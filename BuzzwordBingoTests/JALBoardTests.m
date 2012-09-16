//
//  JALBoardTests.m
//  BuzzwordBingo
//
//  Created by Jamie Ly on 16/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "JALBoardTests.h"
#import "JALBoard.h"
#import "WordList.h"
@interface JALBoardTests() {
    JALBoard *board;
}
@end
@implementation JALBoardTests

-(void) setUp {
    [super setUp];
    
    WordList *list = [[WordList alloc] initWithWords: @[
        @"alpha", @"beta", @"delta", @"gamma", @"iota"
    ]];
    
    board = [[JALBoard alloc] initWithWordList: list];
}

-(void) testHasSpaces {
    STAssertNotNil(board.spaces, @"A board has spaces");
}

@end
