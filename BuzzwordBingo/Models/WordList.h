//
//  WordList.h
//  BuzzwordBingo
//
//  Created by Jamie Ly on 15/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface WordList : NSManagedObject

-(NSArray*) take: (NSUInteger) nCountWords;
@property (nonatomic, strong, readonly) NSArray* words;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString * wordsString;

+ (WordList*) wordListInManagedObjectContext: (NSManagedObjectContext*) context;
+ (WordList*) wordListInManagedObjectContext: (NSManagedObjectContext*) context
    withName: (NSString*) _name andWordsString: (NSString*) _wordsString;

@end