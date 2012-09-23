//
//  BoardViewController.m
//  BuzzwordBingo
//
//  Created by Jamie Ly on 21/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "BoardViewController.h"
#import "BingoGridCell.h"

@interface BoardViewController () {
    CGSize spaceSize;
}
@end

@implementation BoardViewController

@synthesize game;
@synthesize gridView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Calculate the size that each space should be
    spaceSize = gridView.frame.size;
    spaceSize.width /= (float)game.board.cols;
    CGFloat height = self.navigationController.navigationBar.frame.size.height;
    //spaceSize.height -= self.navigationController.view.frame.size.height;
    spaceSize.height -= height;
    spaceSize.height /= (float)game.board.rows;

    // Adjust the content size of the grid view
    gridView.contentSize = CGSizeMake(spaceSize.width * game.board.cols,
                                      spaceSize.height * game.board.rows);
    gridView.scrollEnabled = NO;
    gridView.contentSizeGrowsToFillBounds = NO;
    
    [gridView reloadData];
}

- (CGSize) portraitGridCellSizeForGridView:(AQGridView *)aGridView {
    return spaceSize;
}

- (NSUInteger) numberOfItemsInGridView:(AQGridView *)gridView {
    return game.board.rows * game.board.cols;
}

- (AQGridViewCell *)gridView:(AQGridView *)aGridView cellForItemAtIndex:(NSUInteger)index {
    BingoGridCell *cell = (BingoGridCell*)[aGridView dequeueReusableCellWithIdentifier: @"StandardCell"];
    if(!cell) {
        cell = [[BingoGridCell alloc] initWithFrame: CGRectMake(0, 0, spaceSize.width, spaceSize.height)
                                    reuseIdentifier:@"StandardCell"];
    }
    
    cell.word = [[game boardWords] objectAtIndex: index];
    [cell setRandomColor];
    return cell;
}

- (void)viewDidUnload {
    [self setGridView:nil];
    [super viewDidUnload];
}
@end
