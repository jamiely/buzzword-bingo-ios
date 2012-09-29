//
//  WordListManagerViewController.m
//  BuzzwordBingo
//
//  Created by Jamie Ly on 28/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "WordListManagerViewController.h"
#import "WordsViewController.h"
#import "Content.h"

@interface WordListManagerViewController () {
    NSMutableArray *wordLists;
    WordList *selectedList;
}

@end

@implementation WordListManagerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    wordLists = [NSMutableArray arrayWithArray: [[Content main] wordLists]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch(section) {
        case 0: {
            // we only have a downloads cell
            return 1;
        }
        case 1: {
            return wordLists.count;
        }
    }
    return 0;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"StandardTableCell"];
    if(indexPath.section == 0) {
        cell.textLabel.text = @"Download Lists";
        return cell;
    }
    
    // otherwise, it's a word list
    cell.textLabel.text = [[wordLists objectAtIndex: indexPath.row] name];
    return cell;
}

- (BOOL) tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.section == 1;
}

- (void)     tableView:(UITableView *)tableView
    commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
     forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(editingStyle == UITableViewCellEditingStyleDelete) {
        [wordLists removeObjectAtIndex: indexPath.row];
        [tableView deleteRowsAtIndexPaths: @[indexPath] withRowAnimation: UITableViewRowAnimationFade];
    }
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        if(indexPath.row == 0) {
            [self performSegueWithIdentifier: @"DownloadWordListsSegue" sender:nil];
        }
        return;
    }
    
    selectedList = [wordLists objectAtIndex: indexPath.row];
    [self performSegueWithIdentifier:@"WordListSegue" sender: self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    id controller = segue.destinationViewController;
    if([controller respondsToSelector:@selector(setWordList:)]) {
        [controller setWordList: selectedList];
    }
}

@end
