//
//  JALHistory.m
//  BuzzwordBingo
//
//  Created by Jamie Ly on 16/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "JALHistory.h"

@interface JALHistory() {
    NSMutableArray *_words;
}

@end

@implementation JALHistory

-(id) init {
    self = [super init];
    if(self) {
        _words = [NSMutableArray array];
    }
    return self;
}

-(void) addToHistory: (NSString*) word {
    [_words addObject: word];
}

-(NSArray*) words {
    return [NSArray arrayWithArray: _words];
}

@end
