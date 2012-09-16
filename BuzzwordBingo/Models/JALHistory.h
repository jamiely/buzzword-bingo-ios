//
//  JALHistory.h
//  BuzzwordBingo
//
//  Created by Jamie Ly on 16/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JALHistory : NSObject

-(void) addToHistory: (NSString*) word;
-(NSArray*) words;
@end
