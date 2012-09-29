//
//  WordsDownloadViewController.m
//  BuzzwordBingo
//
//  Created by Jamie Ly on 29/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "WordsDownloadViewController.h"
#import "AppDelegate.h"

@interface WordsDownloadViewController () {
    BOOL listWasSaved;
}

@end

@implementation WordsDownloadViewController

@synthesize wordListName;

- (void)viewDidLoad
{
    [super viewDidLoad];
    listWasSaved = NO;
    [self downloadWordList];
}

- (void) viewDidDisappear:(BOOL)animated {
    if(self.wordList && !listWasSaved) {
        [[self context] deleteObject: self.wordList];
    }
    [super viewDidDisappear:animated];
}

- (NSManagedObjectContext*) context {
    return [((AppDelegate*)[[UIApplication sharedApplication] delegate]) managedObjectContext];
}

- (void)downloadWordList {
    if(!wordListName) return;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *urlString = [NSString stringWithFormat:@"http://buzzy-bingo.herokuapp.com/api/v0.1/lists/%@", [wordListName stringByAddingPercentEscapesUsingEncoding: NSStringEncodingConversionAllowLossy]];
        NSURL *url = [NSURL URLWithString: urlString];
        NSData *data = [NSData dataWithContentsOfURL: url];
        NSError *error;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData: data options:0 error:&error];
        
        WordList *list = [WordList wordListInManagedObjectContext: [self context]];
        list.name = [json objectForKey: @"name"];
        list.words = [json objectForKey: @"words"];
        
        [self performSelectorOnMainThread:@selector(loadWordList:) withObject:list waitUntilDone:YES];
    });
}

- (void) loadWordList: (WordList*) list {
    self.wordList = list;
    [self.tableView reloadData];
}

- (IBAction)onSave:(id)sender {
    NSError *error;
    if([self.wordList.managedObjectContext save: &error]) {
        listWasSaved = YES;
        [self.navigationController popViewControllerAnimated: YES];
    }
    else {
        NSLog(@"Error: %@", error);
    }
}
@end
