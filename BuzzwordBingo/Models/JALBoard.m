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
    NSDictionary *spacesByWord;
}
-(NSUInteger) indexForRow: (NSUInteger) row andCol: (NSUInteger) col;
-(NSArray*) markedSpaces;
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
        NSMutableDictionary *byWord = [NSMutableDictionary dictionary];
        spaces = [words ma_map:^id(NSString* word) {
            JALSpace *space = [[JALSpace alloc] initWithWord: word];
            // Add the space to a dictionary by word
            [byWord setValue: space forKey: word];
            return space;
        }];
        
        spacesByWord = [NSDictionary dictionaryWithDictionary: byWord];
    }
    return self;
}

-(JALSpace*) spaceAtRow: (NSUInteger) row andCol: (NSUInteger) col {
    return [self spaceAtIndex: [self indexForRow:row andCol:col]];
}
-(JALSpace*) spaceAtIndex: (NSUInteger) index {
    return [spaces objectAtIndex: index];
}
-(NSUInteger) indexForRow: (NSUInteger) row andCol: (NSUInteger) col {
    return row * rows + col;
}
-(BOOL) markWord: (NSString*) word {
    JALSpace *space = [spacesByWord objectForKey: word];
    if(space) {
        space.marked = YES;
        return YES;
    }
    return NO;
}
-(NSArray*) markedSpaces {
    return [spaces ma_select:^BOOL(JALSpace* space) {
        return space.marked;
    }];
}
-(NSArray*) markedWords {
    return [[self markedSpaces] ma_map:^id(JALSpace *space) {
        return space.word;
    }];
}
@end
