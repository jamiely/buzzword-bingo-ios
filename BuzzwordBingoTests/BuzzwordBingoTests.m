//
//  BuzzwordBingoTests.m
//  BuzzwordBingoTests
//
//  Created by Jamie Ly on 15/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "BuzzwordBingoTests.h"
#import "WordList.h"

@interface BuzzwordBingoTests () {
    WordList *list;
}

@end

@implementation BuzzwordBingoTests

- (void) setUp {
    [super setUp];
    
    list = [[WordList alloc] initWithWords:@[@"apple", @"banana", @"cantaloupe",
        @"durian", @"egg fruit"]];
}

- (void)testWordListHasWords
{
    STAssertNotNil(list.words, @"A word list has words");
}

- (void) testWordListTakeN {
    STAssertEquals([[list take: 3] count], (NSUInteger)3,
        @"We can take N words from a list");
        
    STAssertEquals([[list take: 20] count], list.words.count,
        @"We cannot take more words than the total number.");
}

@end
