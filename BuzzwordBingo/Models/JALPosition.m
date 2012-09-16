//
//  JALPosition.m
//  BuzzwordBingo
//
//  Created by Jamie Ly on 16/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "JALPosition.h"

@implementation JALPosition
@synthesize row;
@synthesize col;

-(id) initWithRow: (NSUInteger) r andColumn: (NSUInteger) c {
    self = [self init];
    if(self) {
        self.row = r;
        self.col = c;
    }
    return self;
}
-(BOOL) isEqual:(id)object {
    return [object row] == row && [object col] == col;
}
+(JALPosition*) positionWithRow: (NSUInteger) r andColumn: (NSUInteger) c {
    return [[JALPosition alloc] initWithRow:r andColumn:c];
}

@end
