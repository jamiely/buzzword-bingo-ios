//
//  PresenterSummaryViewController.m
//  BuzzwordBingo
//
//  Created by Jamie Ly on 07/10/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "PresenterSummaryViewController.h"

@implementation PresenterSummaryViewController

@synthesize words;

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return words.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"StandardTableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier];
    
    cell.textLabel.text = [words objectAtIndex: indexPath.row];
    
    return cell;
}

- (NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Selected words";
}

- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}
- (IBAction)onDone:(id)sender {
    // dismiss both this and the previous view controller
    [self.presentingViewController.presentingViewController
        dismissModalViewControllerAnimated:YES];
}
@end
