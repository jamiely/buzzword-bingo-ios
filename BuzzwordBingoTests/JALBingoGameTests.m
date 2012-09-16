//
//  JALBingoGameTests.m
//  BuzzwordBingo
//
//  Created by Jamie Ly on 16/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "JALBingoGameTests.h"
#import "JALBingoGame.h"
#import "WordList.h"

@interface JALBingoGameTests(){
    JALBingoGame *game;
}

@end

@implementation JALBingoGameTests
-(void) setUp {
    [super setUp];
    game = [[JALBingoGame alloc] initWithWordList: wordList];
}
-(void) testPlayWord {
    STAssertTrue([game playWord: @"California"], @"Can play a word in the word list");
}
-(void) testGetMarkedWords {
    [game playWord: @"Mexico"];
    [game playWord: @"Russia"];
    [game playWord: @"Alabama"];
    [game playWord: @"Arkansas"];
    
    NSArray *expected = [@"Mexico,Russia,Alabama,Arkansas" componentsSeparatedByString: @","];
    STAssertEqualObjects(expected, [game playedWords], @"Played words match");
    STAssertEqualObjects([@"Alabama,Arkansas" componentsSeparatedByString: @","],
        [game markedWords], @"Marked words match");
}
@end
