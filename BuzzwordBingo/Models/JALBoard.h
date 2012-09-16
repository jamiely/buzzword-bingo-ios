//
//  JALBoard.h
//  BuzzwordBingo
//
//  Created by Jamie Ly on 16/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WordList;
@class JALSpace;

@interface JALBoard : NSObject

-(id) initWithWordList: (WordList*) list;
-(JALSpace*) spaceAtRow: (NSUInteger) row andCol: (NSUInteger) col;
-(JALSpace*) spaceAtIndex: (NSUInteger) index;
-(BOOL) markWord: (NSString*) word;
-(NSArray*) markedWords;

@property (nonatomic, assign, readonly) NSUInteger rows;
@property (nonatomic, assign, readonly) NSUInteger cols;
@property (nonatomic, strong) NSArray *spaces;
@end
