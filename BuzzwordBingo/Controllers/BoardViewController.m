//
//  BoardViewController.m
//  BuzzwordBingo
//
//  Created by Jamie Ly on 21/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "BoardViewController.h"
#import "BingoGridCell.h"

@interface BoardViewController ()

@end

@implementation BoardViewController

@synthesize game;
@synthesize gridView;

- (void)viewDidLoad {
    [super viewDidLoad];
    gridView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [gridView reloadData];
}

- (NSUInteger)numberOfItemsInGridView:(AQGridView *)gridView {
    return 25;
}

- (AQGridViewCell *)gridView:(AQGridView *)aGridView cellForItemAtIndex:(NSUInteger)index {
    CGSize size = self.view.bounds.size;
    AQGridViewCell *cell = [aGridView dequeueReusableCellWithIdentifier: @"StandardCell"];
    if(!cell) {
        CGRect frame = CGRectMake(0, 0, size.width / 5.f, size.height / 5.f);
        cell = [[BingoGridCell alloc] initWithFrame:frame reuseIdentifier:@"StandardCell"];
    }
    return cell;
}

- (void)viewDidUnload {
    [self setGridView:nil];
    [super viewDidUnload];
}
@end
