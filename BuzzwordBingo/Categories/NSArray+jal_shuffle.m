//
//  NSArray+jal_shuffle.m
//  BuzzwordBingo
//
//  Created by Jamie Ly on 15/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "NSArray+jal_shuffle.h"

@implementation NSArray (jal_shuffle)
- (NSArray*)jal_shuffle {

    NSMutableArray *temp = [[NSMutableArray alloc] initWithArray:self];

    for(NSUInteger i = [self count]; i > 1; i--) {
        NSUInteger j = arc4random_uniform(i);
        [temp exchangeObjectAtIndex:i-1 withObjectAtIndex:j];
    }

    return [NSArray arrayWithArray:temp];
}
@end
