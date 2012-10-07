//
//  PresenterViewController.h
//  BuzzwordBingo
//
//  Created by Jamie Ly on 24/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JALBingoGame.h"

@interface PresenterViewController : UIViewController
@property (nonatomic, strong) JALBingoGame *game;
@property (strong, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UINavigationBar *navigationBar;
- (IBAction)handleGesture:(id)sender;
- (IBAction)onDone:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *lastWordLabel;

@end
