//
//  BingoGridCell.m
//  BuzzwordBingo
//
//  Created by Jamie Ly on 21/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "BingoGridCell.h"

@interface BingoGridCell() {
    UILabel *label;
}

@end

@implementation BingoGridCell

@synthesize word;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize: frame];
    }
    return self;
}

- (id) initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initialize: frame];
    }
    return self;
}

-(void) initialize:(CGRect) frame {
    word = @"";
    
    // label setup
    label = [[UILabel alloc] initWithFrame: frame];
    label.text = word;
    label.numberOfLines = 5;
    label.textAlignment = UITextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    
    // background
    [self.contentView addSubview: label];
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    // create a border
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 1.f;
}

- (void) setMarked: (BOOL) val {
    self.contentView.backgroundColor = val ? [UIColor yellowColor] : [UIColor whiteColor];
}

- (void) setRandomColor {
    self.contentView.backgroundColor = [UIColor redColor];
    switch(arc4random()%5) {
        case 0: {
            self.contentView.backgroundColor = [UIColor blueColor];
            break;
        }
        case 1: {
            self.contentView.backgroundColor = [UIColor yellowColor];
            break;
        }
        case 2: {
            self.contentView.backgroundColor = [UIColor greenColor];
            break;
        }
        case 3: {
            self.contentView.backgroundColor = [UIColor whiteColor];
            break;
        }
        case 4: {
            self.contentView.backgroundColor = [UIColor purpleColor];
            break;
        }
    }
}

- (void) setWord:(NSString *)_word {
    word = _word;
    label.text = word;
}

- (void) layoutSubviews {
    label.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
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
