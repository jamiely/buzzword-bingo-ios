//
//  JALDirectionPole.m
//  BuzzwordBingo
//
//  Created by Jamie Ly on 16/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "JALDirectionPole.h"

@implementation JALDirectionPole

@synthesize a;
@synthesize b;

-(id) initWithDirection: (JALDirection*) dir1 andDirection: (JALDirection*) dir2 {
    self = [super init];
    if(self) {
        a = dir1;
        b = dir2;
    }
    return self;
}

+(JALDirectionPole*) NS {
    static JALDirectionPole *pole = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        pole = [[JALDirectionPole alloc] initWithDirection: [JALDirection North] andDirection: [JALDirection South]];
    });
    return pole;
}

+(JALDirectionPole*) EW {
    static JALDirectionPole *pole = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        pole = [[JALDirectionPole alloc] initWithDirection: [JALDirection East] andDirection: [JALDirection West]];
    });
    return pole;
}
+(JALDirectionPole*) NWSE {
    static JALDirectionPole *pole = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        pole = [[JALDirectionPole alloc] initWithDirection: [JALDirection NorthWest] andDirection: [JALDirection SouthEast]];
    });
    return pole;
}
+(JALDirectionPole*) NESW {
    static JALDirectionPole *pole = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        pole = [[JALDirectionPole alloc] initWithDirection: [JALDirection NorthEast] andDirection: [JALDirection SouthWest]];
    });
    return pole;
}

+(NSArray*) Diagonals {
    static NSArray *pole = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        pole = @[[self NESW], [self NWSE]];
    });
    return pole;
}

+(BOOL) isDiagonal: (JALDirectionPole*) pole {
    return [[self Diagonals] indexOfObject: pole] != NSNotFound;
}

@end
