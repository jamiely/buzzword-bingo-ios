//
//  JALDirection.m
//  BuzzwordBingo
//
//  Created by Jamie Ly on 16/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "JALDirection.h"
#import "JALPosition.h"

@implementation JALDirection

@synthesize vertical;
@synthesize horizontal;

- (JALDirection *) initWithVertical: (NSInteger) v andHorizontal: (NSInteger) h {
    self = [self init];
    self.vertical = v;
    self.horizontal = h;
    return self;
}

- (JALPosition*) adjustPosition: (JALPosition*) pos {
    JALPosition *position = [[JALPosition alloc] init];
    NSInteger row = pos.row + self.vertical,
        col = pos.col + self.horizontal;
    if(row < 0 || col < 0) return nil;
    
    position.row = row;
    position.col = col;
    return position;
}

+ (JALDirection *) directionWithVertical: (NSInteger) v andHorizontal: (NSInteger) h {
    return [[JALDirection alloc] initWithVertical: v andHorizontal: h];
}

+ (JALDirection *) North {
    static JALDirection *d = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        d = [self directionWithVertical: 1 andHorizontal: 0];
    });
    return d;
}

+ (JALDirection *) East {
    static JALDirection *d = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        d = [self directionWithVertical: 0 andHorizontal: 1];
    });
    return d;
}
+ (JALDirection *) South {
    static JALDirection *d = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        d = [self directionWithVertical: -1 andHorizontal: 0];
    });
    return d;
}
+ (JALDirection *) West {
    static JALDirection *d = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        d = [self directionWithVertical: 0 andHorizontal: -1];
    });
    return d;
}

+ (JALDirection *) NorthEast {
    static JALDirection *d = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        d = [self directionWithVertical: 1 andHorizontal: 1];
    });
    return d;
}
+ (JALDirection *) SouthEast {
    static JALDirection *d = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        d = [self directionWithVertical: -1 andHorizontal: 1];
    });
    return d;
}

+ (JALDirection *) NorthWest {
    static JALDirection *d = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        d = [self directionWithVertical: 1 andHorizontal: -1];
    });
    return d;
}
+ (JALDirection *) SouthWest {
    static JALDirection *d = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        d = [self directionWithVertical: -1 andHorizontal: -1];
    });
    return d;
}

@end
