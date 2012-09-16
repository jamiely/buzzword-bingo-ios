//
//  JALBoard.m
//  BuzzwordBingo
//
//  Created by Jamie Ly on 16/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "JALBoard.h"
#import "WordList.h"
#import "JALSpace.h"
#import "MACollectionUtilities.h"

@interface JALBoard () {
    NSArray *spaces;
    NSUInteger rows;
    NSUInteger cols;
}
@end

@implementation JALBoard

@synthesize spaces;
@synthesize cols;
@synthesize rows;

-(id) initWithWordList: (WordList*) list {
    self = [self init];
    if(self) {
        rows = 5;
        cols = 5;
        NSArray *words = [list take: rows * cols];
        spaces = [words ma_map:^id(NSString* word) {
            JALSpace *space = [[JALSpace alloc] initWithWord: word];
            return space;
        }];
    }
    return self;
}

@end
