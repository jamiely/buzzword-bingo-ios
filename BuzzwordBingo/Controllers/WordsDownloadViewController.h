//
//  WordsDownloadViewController.h
//  BuzzwordBingo
//
//  Created by Jamie Ly on 29/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "WordsViewController.h"

@interface WordsDownloadViewController : WordsViewController

- (IBAction)onSave:(id)sender;

@property (nonatomic, strong) NSString *wordListName;

@end
