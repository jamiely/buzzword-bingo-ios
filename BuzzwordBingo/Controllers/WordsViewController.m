//
//  WordsViewController.m
//  BuzzwordBingo
//
//  Created by Jamie Ly on 28/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "WordsViewController.h"

@implementation WordsViewController

@synthesize wordList;

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return wordList.words.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"StandardTableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier
        forIndexPath:indexPath];
    
    cell.textLabel.text = [wordList.words objectAtIndex: indexPath.row];
    
    return cell;
}

@end
