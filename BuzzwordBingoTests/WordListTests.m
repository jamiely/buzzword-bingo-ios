//
//  WordListTests.m
//  BuzzwordBingo
//
//  Created by Jamie Ly on 16/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "WordListTests.h"
#import "WordList.h"

@implementation WordListTests
- (void)testWordListHasWords
{
    STAssertNotNil(wordList.words, @"A word list has words");
}

- (void) testWordListTakeN {
    STAssertEquals([[wordList take: 3] count], (NSUInteger)3,
        @"We can take N words from a list");
        
    STAssertEquals([[wordList take: 100] count], wordList.words.count,
        @"We cannot take more words than the total number.");
}


@end
