//
//  JALBingoGame.m
//  BuzzwordBingo
//
//  Created by Jamie Ly on 16/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "JALBingoGame.h"
#import "JALBoard.h"
#import "JALHistory.h"

@implementation JALBingoGame

@synthesize board;
@synthesize history;
@synthesize wordList;

-(id) initWithWordList: (WordList*) list {
    self = [self init];
    if(self) {
        wordList = list;
        board = [[JALBoard alloc] initWithWordList: list];
        history = [[JALHistory alloc] init];
    }
    return self;
}

-(BOOL) playWord: (NSString*) word {
    [history addToHistory: word];
    return [board markWord: word];
}

-(NSArray*) playedWords {
    return [history words];
}

-(NSArray*) markedWords {
    return [board markedWords];
}

@end
