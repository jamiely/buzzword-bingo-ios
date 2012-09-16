//
//  JALDirection.h
//  BuzzwordBingo
//
//  Created by Jamie Ly on 16/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JALPosition;

@interface JALDirection : NSObject

@property (nonatomic, assign) NSInteger vertical;
@property (nonatomic, assign) NSInteger horizontal;

- (JALDirection *) initWithVertical: (NSInteger) v andHorizontal: (NSInteger) h;
- (JALPosition*) adjustPosition: (JALPosition*) pos;

+ (JALDirection *) directionWithVertical: (NSInteger) v andHorizontal: (NSInteger) h;

+ (JALDirection *) North;
+ (JALDirection *) East;
+ (JALDirection *) South;
+ (JALDirection *) West;

+ (JALDirection *) NorthEast;
+ (JALDirection *) SouthEast;

+ (JALDirection *) NorthWest;
+ (JALDirection *) SouthWest;

@end
