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
@dynamic name;
@dynamic wordsString;

-(NSArray*) words {
    return [self.wordsString componentsSeparatedByString: @","];
}

-(void) setWords: (NSArray*) _words {
    self.wordsString = [_words componentsJoinedByString: @","];
}

-(NSArray*) take: (NSUInteger) nCountWords {
    NSRange rng;
    rng.location = 0;
    rng.length = self.words.count;
    if(rng.length > nCountWords) rng.length = nCountWords;
    
    return [[self.words jal_shuffle] subarrayWithRange: rng];
}

+ (WordList*) wordListInManagedObjectContext: (NSManagedObjectContext*) context {
    return (WordList*) [NSEntityDescription insertNewObjectForEntityForName: @"WordList" inManagedObjectContext: context];
}

+ (WordList*) wordListInManagedObjectContext: (NSManagedObjectContext*) context
    withName: (NSString*) _name andWordsString: (NSString*) _wordsString {
    WordList *list = [WordList wordListInManagedObjectContext:context];
    list.name = _name;
    list.wordsString = _wordsString;
    return list;
}

@end
