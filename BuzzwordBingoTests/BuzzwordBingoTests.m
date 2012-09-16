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

- (void) setUp {
    [super setUp];
    
    // Only the first 25 states alphabetically
    NSArray *words = [@"Alabama,Alaska,American Samoa,Arizona,Arkansas,California,Colorado,Connecticut,Delaware,District of Columbia,Florida,Georgia,Guam,Hawaii,Idaho,Illinois,Indiana,Iowa,Kansas,Kentucky,Louisiana,Maine,Maryland,Massachusetts,Michigan" componentsSeparatedByString:@","];
    
    wordList = [[WordList alloc] initWithWords: words];
}

@end
