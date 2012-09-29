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
        NSString *countries = @"Afghanistan,Albania,Algeria,Andorra,Angola,Antigua & Deps,Argentina,Armenia,Australia,Austria,Azerbaijan,Bahamas,Bahrain,Bangladesh,Barbados,Belarus,Belgium,Belize,Benin,Bhutan,Bolivia,Bosnia Herzegovina,Botswana,Brazil,Brunei,Bulgaria,Burkina,Burundi,Cambodia,Cameroon,Canada,Cape Verde,Central African Rep,Chad,Chile,China,Colombia,Comoros,Congo,Congo {Democratic Rep},Costa Rica,Croatia,Cuba,Cyprus,Czech Republic,Denmark,Djibouti,Dominica,Dominican Republic,East Timor,Ecuador,Egypt,El Salvador,Equatorial Guinea,Eritrea,Estonia,Ethiopia,Fiji,Finland,France,Gabon,Gambia,Georgia,Germany,Ghana,Greece,Grenada,Guatemala,Guinea,Guinea-Bissau,Guyana,Haiti,Honduras,Hungary,Iceland,India,Indonesia,Iran,Iraq,Ireland,Israel,Italy,Ivory Coast,Jamaica,Japan,Jordan,Kazakhstan,Kenya,Kiribati,Korea North,Korea South,Kosovo,Kuwait,Kyrgyzstan,Laos,Latvia,Lebanon,Lesotho,Liberia,Libya,Liechtenstein,Lithuania,Luxembourg,Macedonia,Madagascar,Malawi,Malaysia,Maldives,Mali,Malta,Marshall Islands,Mauritania,Mauritius,Mexico,Micronesia,Moldova,Monaco,Mongolia,Montenegro,Morocco,Mozambique,Myanmar, {Burma},Namibia,Nauru,Nepal,Netherlands,New Zealand,Nicaragua,Niger,Nigeria,Norway,Oman,Pakistan,Palau,Panama,Papua New Guinea,Paraguay,Peru,Philippines,Poland,Portugal,Qatar,Romania,Russian Federation,Rwanda,St Kitts & Nevis,St Lucia,Saint Vincent & the Grenadines,Samoa,San Marino,Sao Tome & Principe,Saudi Arabia,Senegal,Serbia,Seychelles,Sierra Leone,Singapore,Slovakia,Slovenia,Solomon Islands,Somalia,South Africa,Spain,Sri Lanka,Sudan,Suriname,Swaziland,Sweden,Switzerland,Syria,Taiwan,Tajikistan,Tanzania,Thailand,Togo,Tonga,Trinidad & Tobago,Tunisia,Turkey,Turkmenistan,Tuvalu,Uganda,Ukraine,United Arab Emirates,United Kingdom,United States,Uruguay,Uzbekistan,Vanuatu,Vatican City,Venezuela,Vietnam,Yemen,Zambia,Zimbabwe";
        
        
        NSManagedObjectContext *context = delegate.managedObjectContext;
        wordLists = @[
            [WordList wordListInManagedObjectContext:context withName:@"States" andWordsString:states],
            [WordList wordListInManagedObjectContext:context withName:@"State Capitals" andWordsString: capitals],
            [WordList wordListInManagedObjectContext:context withName:@"Counties" andWordsString: countries]
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
