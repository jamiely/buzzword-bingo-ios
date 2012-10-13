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
        NSString *capitals = @"Honolulu,Boise,Springfield,Indianapolis,Des Moines,Topeka,Frankfort,Baton Rouge,Augusta,Annapolis,Boston,Lansing,St. Paul,Jackson,Jefferson City,Helena,Lincoln,Carson City,Concord,Trenton,Santa Fe,Albany,Raleigh,Bismarck,Columbus,Oklahoma City,Salem,Harrisburg,Providence,Columbia,Pierre,Nashville,Austin,Salt Lake City,Montpelier,Richmond,Olympia,Charleston,Madison,Cheyenne";
        NSString *buzz = @"bandwidth,synergies,pieces,chinese wall,deliverables,incentivize,monetize,paradigm,pushback,takeaway,turnkey,value-add,value chain,traction,touch base,alignment,impact,leverage,organic,out of the box,innovation,best in breed,b2b,core competency,holistic,low-hanging fruit,pain point,small wins,immersive,mashup,portal,enterprise,vertical,matrix,customer-centric,high-impact,engagement,linkage,win-win,blue sky,campaign,segmentation,first mover,cutting-edge,hearts and minds";
        
        
        NSManagedObjectContext *context = delegate.managedObjectContext;
        wordLists = @[
            [WordList wordListInManagedObjectContext:context withName:@"States" andWordsString:states],
            [WordList wordListInManagedObjectContext:context withName:@"State Capitals" andWordsString: capitals],
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
