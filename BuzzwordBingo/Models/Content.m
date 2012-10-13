//
//  Content.m
//  BuzzwordBingo
//
//  Created by Jamie Ly on 16/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "Content.h"
#import "WordList.h"
#import "AppDelegate.h"

@interface Content() {
    NSArray *wordLists;
}

@end

@implementation Content
- (NSArray*) wordLists {
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    // Load from core data if possible
    wordLists = [delegate wordLists];
    
    // Otherwise load some defaults
    if(!wordLists || wordLists.count == 0) {
        // setup word lists
        NSString *states = @"Alabama,Alaska,American Samoa,Arizona,Arkansas,California,Colorado,Connecticut,Delaware,District of Columbia,Florida,Georgia,Guam,Hawaii,Idaho,Illinois,Indiana,Iowa,Kansas,Kentucky,Louisiana,Maine,Maryland,Massachusetts,Michigan,Minnesota,Mississippi,Missouri,Montana,Nebraska,Nevada,New Hampshire,New Jersey,New Mexico,New York,North Carolina,North Dakota,Northern Marianas Islands,Ohio,Oklahoma,Oregon,Pennsylvania,Puerto Rico,Rhode Island,South Carolina,South Dakota,Tennessee,Texas,Utah,Vermont,Virginia,Virgin Islands,Washington,West Virginia,Wisconsin,Wyoming";
        NSString *animals = @"aardvark,alligator,armadillo,badger,boar,camel,cat,cow,dog,donkey,elephant,elk,fish,fox,frog,goat,horse,iguana,jaguar,kangaroo,lamb,lion,mole,ox,panda,pig,reindeer,seal,sheep,tiger,turtle,wolf,zebra";
        NSString *buzz = @"bandwidth,synergies,pieces,chinese wall,deliverables,incentivize,monetize,paradigm,pushback,takeaway,turnkey,value-add,value chain,traction,touch base,alignment,impact,leverage,organic,out of the box,innovation,best in breed,b2b,core competency,holistic,low-hanging fruit,pain point,small wins,immersive,mashup,portal,enterprise,vertical,matrix,customer-centric,high-impact,engagement,linkage,win-win,blue sky,campaign,segmentation,first mover,cutting-edge,hearts and minds";
        NSString *fruit = @"Apple,Apricot,Avocado,Banana,Breadfruit,Blackberry,Blueberry,Cherry,Clementine,Date,Dragonfruit,Durian,Fig,Gooseberry,Grape,Grapefruit,Guava,Huckleberry,Jackfruit,Kiwi,Lemon,Lime,Lychee,Mandarine,Mango,Cantaloupe,Honeydew melon,Watermelon,Nectarine,Orange,Peach,Pear,Plum,Pineapple,Pomegranate,Pomelo,Raspberry,Rambutan,Star fruit,Strawberry,Tangerine,Tomato";
        
        
        NSManagedObjectContext *context = delegate.managedObjectContext;
        wordLists = @[
            [WordList wordListInManagedObjectContext:context withName:@"States" andWordsString:states],
            [WordList wordListInManagedObjectContext:context withName:@"Animals" andWordsString: animals],
            [WordList wordListInManagedObjectContext:context withName:@"Fruit" andWordsString: fruit],
            [WordList wordListInManagedObjectContext:context withName:@"Buzzwords" andWordsString: buzz]
        ];
        NSError __autoreleasing *error;
        if(![context save: &error]) {
            NSLog(@"Problem saving word list: %@", [error localizedDescription]);
        }
    }
    return wordLists;
}

+ (Content*) main {
    static Content* content = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        content = [[Content alloc] init];
    });
    return content;
}
@end
