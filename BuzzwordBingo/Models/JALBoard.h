//
//  JALBoard.h
//  BuzzwordBingo
//
//  Created by Jamie Ly on 16/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JALSpace.h"
#import "JALPosition.h"
#import "WordList.h"

@interface JALBoard : NSObject

-(id) initWithWordList: (WordList*) list;
-(JALSpace*) spaceAtRow: (NSUInteger) row andCol: (NSUInteger) col;
-(JALSpace*) spaceAtIndex: (NSUInteger) index;
-(BOOL) markWord: (NSString*) word;
-(BOOL) isMarkedAtPosition: (JALPosition*) pos;
-(BOOL) isPositionBounded: (JALPosition*) pos;
-(NSUInteger) indexOfWord: (NSString*) word;
-(JALPosition*) positionOfWord: (NSString*) word;
-(NSArray*) markedWords;

-(JALPosition*) topLeft;
-(JALPosition*) topRight;
-(JALPosition*) bottomLeft;
-(JALPosition*) bottomRight;


@property (nonatomic, assign, readonly) NSUInteger rows;
@property (nonatomic, assign, readonly) NSUInteger cols;
@property (nonatomic, strong) NSArray *spaces;
@end
