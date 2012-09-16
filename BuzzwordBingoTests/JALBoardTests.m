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
#import "JALSpace.h"

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

-(void) testGetsSpacesByPositionOrIndex {
    // This will be the 1st space in the 2nd row (0-indexed)
    JALSpace *space = [board.spaces objectAtIndex: 5];
    STAssertEquals(space, [board spaceAtRow:1 andCol:0], @"Space matches at position");
    STAssertEquals(space, [board spaceAtIndex: 5], @"Space matches at index");
    
    JALSpace *another = [board.spaces objectAtIndex: 7];
    STAssertEquals(another, [board spaceAtRow: 1 andCol: 2],
        @"Another space matches at position");

}

@end
