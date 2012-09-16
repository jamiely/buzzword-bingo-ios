//
//  JALSpace.m
//  BuzzwordBingo
//
//  Created by Jamie Ly on 16/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "JALSpace.h"

@implementation JALSpace
@synthesize word;
@synthesize marked;

-(id) init {
    self = [super init];
    if(self) {
        marked = NO;
    }
    return self;
}

-(id) initWithWord: (NSString*) _word {
    self = [self init];
    if(self) {
        self.word = _word;
    }
    return self;
}

@end
