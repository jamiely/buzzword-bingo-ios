//
//  WordsViewController.h
//  BuzzwordBingo
//
//  Created by Jamie Ly on 28/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WordList.h"

@interface WordsViewController : UITableViewController

@property (nonatomic, strong) WordList *wordList;

@end
