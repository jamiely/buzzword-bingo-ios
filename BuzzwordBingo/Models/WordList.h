//
//  WordList.h
//  BuzzwordBingo
//
//  Created by Jamie Ly on 15/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WordList : NSObject
-(id) initWithWords: (NSArray*) _words;
-(NSArray*) take: (NSUInteger) nCountWords;
@property (nonatomic, strong, readonly) NSArray* words;
@end
