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
    NSMutableArray *selectedWords;
    NSString *lastWord;
}

@end

@implementation PresenterViewController

@synthesize label;
@synthesize game;
@synthesize navigationBar;

- (void)viewDidLoad
{
    [super viewDidLoad];
    lastWord = @"";
    [self setLastWordText: lastWord];
    self.navigationBar.topItem.title = game.wordList.name;
	label.text = @"Touch or shake for the next word.";
    words = [NSMutableArray arrayWithArray: [game.wordList.words jal_shuffle]];
    selectedWords = [NSMutableArray array];
}

- (void)viewDidUnload {
    [self setLabel:nil];
    [self setNavigationBar:nil];
    [self setLastWordLabel:nil];
    [super viewDidUnload];
}

- (IBAction)handleGesture: (id)sender {
    [self nextWord];
}

- (IBAction)onDone:(id)sender {
    [self performSegueWithIdentifier:@"PresenterSummarySegue" sender:self];
}

- (void) nextWord {
    [self setLastWordText: lastWord];
    NSString *next = [self takeWord];
    label.text = next;
    [selectedWords addObject: next];
    lastWord = next;
}

- (void) setLastWordText: (NSString*) aLastWord {
    if(aLastWord == @"") {
        self.lastWordLabel.text = @"";
    }
    else {
        self.lastWordLabel.text = [NSString stringWithFormat:@"  Last word: %@", aLastWord];
    }
}

#pragma mark - Segue functions

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    id controller = segue.destinationViewController;
    if([controller respondsToSelector:@selector(setWords:)]) {
        [controller setWords: selectedWords];
    }
}

- (IBAction)dismissBackToMenu:(UIStoryboardSegue*)segue {
    [self.presentingViewController dismissModalViewControllerAnimated:YES];
}

#pragma mark - Supports shake functionality

- (BOOL) canBecomeFirstResponder { return YES; }
- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear: animated];
    [self becomeFirstResponder];
}
- (void) viewWillDisappear:(BOOL)animated {
    [self resignFirstResponder];
    [super viewWillDisappear:animated];
}

- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if(motion == UIEventSubtypeMotionShake) {
        [self nextWord];
    }
}


#pragma mark - Model functions

- (NSString*) takeWord {
    NSString *word = [words lastObject];
    [words removeLastObject];
    return word;
}

@end
