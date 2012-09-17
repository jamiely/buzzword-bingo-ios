//
//  MenuViewController.m
//  BuzzwordBingo
//
//  Created by Jamie Ly on 16/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController () {
    NSArray *data;
}

@end

@implementation MenuViewController

@synthesize tableView;

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
    // Make the background of the tableView totally clear
    tableView.backgroundColor = [UIColor clearColor];
    tableView.opaque = NO;
    tableView.backgroundView = nil;
    
    // Load the menu data
	data = [@"New Game,Manage Word Lists,Contact" componentsSeparatedByString:@","];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
    return data.count;
}

- (UITableViewCell*) tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier: @"StandardTableCell"];
    cell.textLabel.text = [data objectAtIndex: indexPath.row];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch(indexPath.row) {
        case 0: { // play game
            [self performSegueWithIdentifier: @"NewGameSegue" sender:nil];
            break;
        }
    }
}

@end
