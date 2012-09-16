//
//  JALBingoGameTests.m
//  BuzzwordBingo
//
//  Created by Jamie Ly on 16/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "JALBingoGameTests.h"
#import "JALBingoGame.h"
#import "JALBoard.h"
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
    NSArray *marked = [[game markedWords] sortedArrayUsingComparator:^NSComparisonResult(NSString* obj1, NSString* obj2) {
        return [obj1 compare: obj2];
    } ]; // needs to be sorted
    STAssertEqualObjects(expected, [game playedWords], @"Played words match");
    STAssertEqualObjects([@"Alabama,Arkansas" componentsSeparatedByString: @","],
        marked, @"Marked words match");
}
-(void) testBingo {
    // VERTICAL bingo
    JALBingoGame *game1 = [[JALBingoGame alloc] initWithWordList: wordList];
    NSMutableArray *words1 = [NSMutableArray array];
    for(NSInteger i=0, rows = game.board.rows; i<rows; i++) {
        [words1 addObject:[[game1.board spaceAtRow:i andCol:0] word]];
    }
    // Play first n-1 words
    for(NSInteger i=0, c = words1.count-1; i<c; i++) {
        NSString *word = [words1 objectAtIndex: i];
        [game1 playWord: word];
        NSLog(@"Played word %d \"%@\". Is bingo? %@", i, word, game1.isBingo ? @"YES": @"NO");
        STAssertFalse(game1.isBingo, @"Is Not bingo");
    }
    
    
    [game1 playWord: [words1 lastObject]];
    STAssertTrue(game1.isBingo, @"Is bingo");
}
@end
