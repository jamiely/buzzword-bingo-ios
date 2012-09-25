//
//  BoardViewController.m
//  BuzzwordBingo
//
//  Created by Jamie Ly on 21/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "BoardViewController.h"
#import "BingoGridCell.h"
#import "JALSpace.h"

@interface BoardViewController () {
    // The size of each space on the bingo board
    CGSize spaceSize;
}
@end

@implementation BoardViewController

@synthesize game;
@synthesize gridView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = game.wordList.name;
    
    [self setupGridView];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) setupGridView {
    [gridView sizeToFit];
    
    // Calculate the size that each space should be
    spaceSize = gridView.frame.size;
    spaceSize.width /= (float)game.board.cols;
    
    spaceSize.height -= self.navigationController.navigationBar.frame.size.height;
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
    static NSString *cidStandard = @"StandardCell";
    
    BingoGridCell *cell = (BingoGridCell*)[aGridView dequeueReusableCellWithIdentifier: cidStandard];
    if(!cell) {
        cell = [[BingoGridCell alloc] initWithFrame: CGRectMake(0, 0, spaceSize.width, spaceSize.height)
                                    reuseIdentifier: cidStandard];
    }
    
    JALSpace *space = [self spaceAtIndex: index];
    cell.word = [space word];
    [cell setMarked: space.marked];
    return cell;
}

- (void) gridView:(AQGridView *)aGridView didSelectItemAtIndex:(NSUInteger)index {
    [game playWord: [self wordAtIndex: index]];
    [gridView reloadItemsAtIndices: [NSIndexSet indexSetWithIndex:index]
                     withAnimation: AQGridViewItemAnimationFade];
    if(game.isBingo) {
        [[[UIAlertView alloc] initWithTitle:@"Alert" message:@"BINGO" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
    }
}

- (void)viewDidUnload {
    [self setGridView:nil];
    [super viewDidUnload];
}

#pragma mark - Model functions

-(NSString*) wordAtIndex: (NSUInteger) index {
    return [[self spaceAtIndex: index] word];
}

-(JALSpace*) spaceAtIndex: (NSUInteger) index {
    return [game.board spaceAtIndex: index];
}

@end
