//
//  BoardViewController.h
//  BuzzwordBingo
//
//  Created by Jamie Ly on 21/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JALBingoGame.h"
#import "AQGridView.h"

@interface BoardViewController : UIViewController <AQGridViewDelegate, AQGridViewDataSource>
@property (nonatomic, strong) JALBingoGame *game;
@property (strong, nonatomic) IBOutlet AQGridView *gridView;
@end
