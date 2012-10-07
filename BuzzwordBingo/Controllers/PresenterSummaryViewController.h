//
//  PresenterSummaryViewController.h
//  BuzzwordBingo
//
//  Created by Jamie Ly on 07/10/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PresenterSummaryViewController : UIViewController <UITableViewDataSource,
    UITableViewDelegate>

@property (nonatomic, strong) NSArray *words;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
