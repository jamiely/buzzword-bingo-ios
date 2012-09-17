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

@interface WordListViewController () {
    WordList *selectedList;
}

@end

@implementation WordListViewController
@synthesize listTableView;
@synthesize wordTableView;

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
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setListTableView:nil];
    [self setWordTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

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
}

@end
