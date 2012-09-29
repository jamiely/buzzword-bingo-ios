//
//  ListDownloadViewController.m
//  BuzzwordBingo
//
//  Created by Jamie Ly on 29/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "ListDownloadViewController.h"
#import "MACollectionUtilities.h"
#import "WordList.h"
#import "WordsDownloadViewController.h"

@interface ListDownloadViewController () {
    NSURLConnection *connection;
    NSURLRequest *request;
    NSMutableArray *lists;
    NSString *selectedWordListName;
}

@end

@implementation ListDownloadViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupRequest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Request Functions

- (void)setupRequest {
    lists = [NSMutableArray array];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:
            [NSURL URLWithString:@"http://buzzy-bingo.herokuapp.com/api/v0.1/lists"]];
        [self performSelectorOnMainThread:@selector(loadData:) withObject:data waitUntilDone:YES];
    });
}

- (void) loadData: (NSData*) data {
    NSError *error;
    NSArray *listNames = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    // filter to only those lists not already added
    NSArray *newListNames = [listNames ma_select:^BOOL(id obj) {
        return ![lists containsObject: obj];
    }];
    
    NSLog(@"new list names: %@", newListNames);

    [lists addObjectsFromArray: newListNames];
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return lists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"StandardTableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [lists objectAtIndex: indexPath.row];
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectedWordListName = [lists objectAtIndex: indexPath.row];
    [self performSegueWithIdentifier: @"WordListSegue" sender: nil];
}

#pragma mark - Segue functions

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    id controller = segue.destinationViewController;
    if([controller respondsToSelector: @selector(setWordListName:)]) {
        [controller setWordListName: selectedWordListName];
    }
}

@end
