//
//  JALDirectionPole.h
//  BuzzwordBingo
//
//  Created by Jamie Ly on 16/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JALDirection.h"

@interface JALDirectionPole : NSObject

-(id) initWithDirection: (JALDirection*) dir1 andDirection: (JALDirection*) dir2;

@property (nonatomic, strong) JALDirection *a;
@property (nonatomic, strong) JALDirection *b;

+(JALDirectionPole*) NS;
+(JALDirectionPole*) EW;
+(JALDirectionPole*) NWSE;
+(JALDirectionPole*) NESW;
+(NSArray*) Diagonals;
+(BOOL) isDiagonal: (JALDirectionPole*) pole;

@end
