//
//  WordList.m
//  BuzzwordBingo
//
//  Created by Jamie Ly on 15/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "WordList.h"

@interface WordList () {
    NSArray *words;
}
@end

@implementation WordList

@synthesize words;

-(id) initWithWords: (NSArray*) _words {
    self = [self init];
    if(self){
        words = _words;
    }
    return self;
}
@end
