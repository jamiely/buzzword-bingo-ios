//
//  JALSpace.h
//  BuzzwordBingo
//
//  Created by Jamie Ly on 16/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JALSpace : NSObject

-(id) initWithWord: (NSString*) word;

@property (nonatomic, strong) NSString *word;
@property (nonatomic, assign) BOOL marked;

@end
