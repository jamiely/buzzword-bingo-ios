//
//  BingoGridCell.m
//  BuzzwordBingo
//
//  Created by Jamie Ly on 21/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "BingoGridCell.h"

@implementation BingoGridCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize: frame];
    }
    return self;
}

- (id) initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize: frame];
    }
    return self;
}

-(void) initialize:(CGRect) frame {
    UILabel *lbl = [[UILabel alloc] initWithFrame: frame];
    lbl.text = @"blah";
    [self addSubview: lbl];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
