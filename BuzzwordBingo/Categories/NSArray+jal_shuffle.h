//
//  NSArray+jal_shuffle.h
//  BuzzwordBingo
//
//  Created by Jamie Ly on 15/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (jal_shuffle)
// http://stackoverflow.com/questions/3318902/picking-a-random-object-in-an-nsarray
// Returns a shuffled copy of the array
- (NSArray*)jal_shuffle;
@end
