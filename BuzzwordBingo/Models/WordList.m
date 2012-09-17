//
//  WordList.m
//  BuzzwordBingo
//
//  Created by Jamie Ly on 15/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "WordList.h"
#import "NSArray+jal_shuffle.h"

@interface WordList () {
    NSArray *words;
}
@end

@implementation WordList

@synthesize words;
@synthesize name;

-(id) initWithName: (NSString*) _name andWords: (NSArray*) _words {
    self = [self initWithWords:_words];
    if(self){
        name = _name;
    }
    return self;
}

-(id) initWithWords: (NSArray*) _words {
    self = [self init];
    if(self){
        words = _words;
    }
    return self;
}

-(NSArray*) take: (NSUInteger) nCountWords {
    NSRange rng;
    rng.location = 0;
    rng.length = self.words.count;
    if(rng.length > nCountWords) rng.length = nCountWords;
    
    return [[self.words jal_shuffle] subarrayWithRange: rng];
}

@end
