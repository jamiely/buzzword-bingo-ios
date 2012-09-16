//
//  JALPosition.h
//  BuzzwordBingo
//
//  Created by Jamie Ly on 16/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JALPosition : NSObject

-(id) initWithRow: (NSUInteger) r andColumn: (NSUInteger) c;
+(JALPosition*) positionWithRow: (NSUInteger) r andColumn: (NSUInteger) c;

@property (nonatomic, assign) NSUInteger row;
@property (nonatomic, assign) NSUInteger col;
@end
