//
//  WordListViewController.h
//  BuzzwordBingo
//
//  Created by Jamie Ly on 16/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@interface WordListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *listTableView;
@property (strong, nonatomic) IBOutlet UITableView *wordTableView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *selectButton;
- (IBAction)onSelect:(id)sender;
@property (nonatomic, assign) BingoAppMode appMode;

@end
