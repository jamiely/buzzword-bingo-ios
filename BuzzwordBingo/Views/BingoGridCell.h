//
//  BingoGridCell.h
//  BuzzwordBingo
//
//  Created by Jamie Ly on 21/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "AQGridViewCell.h"

@interface BingoGridCell : AQGridViewCell
- (void) setRandomColor;
- (void) setMarked: (BOOL) val;
@property (nonatomic, strong) NSString *word;
@end
