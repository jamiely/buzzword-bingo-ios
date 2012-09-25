//
//  WordListViewController.m
//  BuzzwordBingo
//
//  Created by Jamie Ly on 16/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "WordListViewController.h"
#import "Content.h"
#import "WordList.h"
#import "BoardViewController.h"

@interface WordListViewController () {
    WordList *selectedList;
}

@end

@implementation WordListViewController
@synthesize listTableView;
@synthesize wordTableView;
@synthesize selectButton;
@synthesize appMode;

#pragma mark - View functions

- (void)viewDidLoad {
    [super viewDidLoad];
    selectButton.enabled = NO;
}

- (void)viewDidUnload {
    [self setSelectButton:nil];
    [super viewDidUnload];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table delegate functions

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(tableView == listTableView) {
        return [[[Content main] wordLists] count];
    }
    else if(tableView == wordTableView && selectedList) {
        return [[selectedList words] count];
    }
    return 0;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *value = @"Unknown";
    
    if(tableView == listTableView) {
        value = [[[[Content main] wordLists] objectAtIndex: indexPath.row] name];
    }
    else if(tableView == wordTableView) {
        value = [[selectedList words] objectAtIndex: indexPath.row];
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"StandardTableCell"];
    cell.textLabel.text = value;
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(tableView != listTableView) return;
    
    selectedList = [[[Content main] wordLists] objectAtIndex: indexPath.row];
    [wordTableView reloadData];
    
    selectButton.enabled = YES;
}

#pragma mark - Segue functions

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.destinationViewController respondsToSelector: @selector(setGame:)]) {
        BoardViewController *controller = segue.destinationViewController;
        [controller setGame: [[JALBingoGame alloc] initWithWordList: selectedList]];
    }
}

- (IBAction)onSelect:(id)sender {
    NSString *identifier = appMode == BingoAppModeUser ? @"UserSegue" : @"PresenterSegue";
    [self performSegueWithIdentifier: identifier sender: self];
}
@end
