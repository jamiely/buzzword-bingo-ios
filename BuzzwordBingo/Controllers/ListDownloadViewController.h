//
//  ListDownloadViewController.h
//  BuzzwordBingo
//
//  Created by Jamie Ly on 29/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListDownloadViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *listNames;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
