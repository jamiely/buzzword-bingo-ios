//
//  PresenterViewController.m
//  BuzzwordBingo
//
//  Created by Jamie Ly on 24/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "PresenterViewController.h"
#import "JALSpace.h"
#import "NSArray+jal_shuffle.h"

@interface PresenterViewController () {
    NSMutableArray *words;
}

@end

@implementation PresenterViewController

@synthesize label;
@synthesize game;
@synthesize navigationBar;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationBar.topItem.title = game.wordList.name;
	label.text = @"Touch to spin";
    words = [NSMutableArray arrayWithArray: [game.wordList.words jal_shuffle]];
}

- (void)viewDidUnload {
    [self setLabel:nil];
    [self setNavigationBar:nil];
    [super viewDidUnload];
}

- (IBAction)handleGesture: (id)sender {
    label.text = [self takeWord];
}

- (IBAction)onDone:(id)sender {
    [self dismissModalViewControllerAnimated: YES];
}

#pragma mark - Model functions

- (NSString*) takeWord {
    NSString *word = [words lastObject];
    [words removeLastObject];
    return word;
}

@end
