//
//  WordListManagerViewController.h
//  BuzzwordBingo
//
//  Created by Jamie Ly on 28/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WordListManagerViewController : UITableViewController
- (IBAction)onEdit:(id)sender;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *editButton;

@end
