//
//  JALBoard.h
//  BuzzwordBingo
//
//  Created by Jamie Ly on 16/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WordList;

@interface JALBoard : NSObject
-(id) initWithWordList: (WordList*) list;
@property (nonatomic, assign, readonly) NSUInteger rows;
@property (nonatomic, assign, readonly) NSUInteger cols;
@property (nonatomic, strong) NSArray *spaces;
@end
