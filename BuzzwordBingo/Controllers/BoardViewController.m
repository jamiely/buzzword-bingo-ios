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
}

- (void) viewWillAppear:(BOOL)animated {
    [self setupGridView];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [self setupGridLayout];
}

- (void) setupGridLayout {
    // Calculate the size that each space should be
    CGSize size = gridView.bounds.size;
    spaceSize = size;
    spaceSize.width = size.width / (float)game.board.cols;
    spaceSize.height = size.height / (float)game.board.rows;
    
    [gridView reloadData];
    [gridView layoutSubviews];
}

- (void) setupGridView {
    // Adjust the content size of the grid view
    gridView.scrollEnabled = NO;
    gridView.contentSizeGrowsToFillBounds = NO;
    
    [self setupGridLayout];
}

- (CGSize) portraitGridCellSizeForGridView:(AQGridView *)aGridView {
    return spaceSize;
}

- (NSUInteger) numberOfItemsInGridView:(AQGridView *)gridView {
    return game.board.rows * game.board.cols;
}

- (AQGridViewCell *)gridView:(AQGridView *)aGridView cellForItemAtIndex:(NSUInteger)index {
    static NSString *cidStandard = @"StandardCell";
    
    CGRect frame = CGRectMake(0, 0, spaceSize.width, spaceSize.height);
    BingoGridCell *cell = (BingoGridCell*)[aGridView dequeueReusableCellWithIdentifier: cidStandard];
    if(!cell) {
        cell = [[BingoGridCell alloc] initWithFrame: frame
                                    reuseIdentifier: cidStandard];
    }
    cell.frame = frame;
    
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
