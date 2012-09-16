//
//  BuzzwordBingoTests.m
//  BuzzwordBingoTests
//
//  Created by Jamie Ly on 15/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "BuzzwordBingoTests.h"
#import "WordList.h"

@implementation BuzzwordBingoTests

- (void)testWordListHasWords
{
    WordList *list = [[WordList alloc] initWithWords:@[@"apple", @"banana", @"cantaloupe"]];
    STAssertNotNil(list.words, @"A word list has words");
}

@end
