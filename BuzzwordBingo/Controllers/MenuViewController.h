//
//  MenuViewController.h
//  BuzzwordBingo
//
//  Created by Jamie Ly on 16/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end
