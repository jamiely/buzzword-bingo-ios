//
//  MenuViewController.m
//  BuzzwordBingo
//
//  Created by Jamie Ly on 16/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "MenuViewController.h"
#import "Constants.h"
#import "WordListViewController.h"

@interface MenuViewController () {
    NSArray *data;
    BingoAppMode appMode;
}

@end

@implementation MenuViewController

@synthesize tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Make the background of the tableView totally clear
    tableView.backgroundColor = [UIColor clearColor];
    tableView.opaque = NO;
    tableView.backgroundView = nil;
    
    // Load the menu data
	data = [@"User Mode,Presenter Mode,Manage Word Lists,Contact" componentsSeparatedByString:@","];
    
    [self loadFlowers];
}

- (void) loadFlowers {
    NSArray *flowers = @[
        [[UIImage alloc] initWithContentsOfFile:
            [[NSBundle mainBundle] pathForResource:@"flower_blue" ofType:@"png"]],
        [[UIImage alloc] initWithContentsOfFile:
         [[NSBundle mainBundle] pathForResource:@"flower_magenta" ofType:@"png"]]
    ];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    for (NSInteger i = 0, count = arc4random() % 10 + 10; i < count; i++) {
        UIImage *flowerImage = [flowers objectAtIndex: arc4random() % [flowers count]];
        UIImageView *imageView = [[UIImageView alloc] initWithImage: flowerImage];
        [self.flowerView addSubview: imageView];
        CGRect frame = imageView.frame;
        frame.origin.x = arc4random() % (NSInteger)screenRect.size.width;
        frame.origin.y = arc4random() % (NSInteger)screenRect.size.height;
        imageView.frame = frame;
        // rotate the flower randomly at most 45 degrees
        imageView.transform = CGAffineTransformMakeRotation((arc4random() % 7853) / 1000.0);
    }
}

- (void)viewDidUnload
{
    [self setFlowerView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table delegate functions

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
    return data.count;
}

- (UITableViewCell*) tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier: @"StandardTableCell"];
    cell.textLabel.text = [data objectAtIndex: indexPath.row];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch(indexPath.row) {
        case 0: {
            // fall through!!
        }
        case 1: {
            appMode = indexPath.row == 0 ? BingoAppModeUser : BingoAppModePresenter;
            [self performSegueWithIdentifier: @"NewGameSegue" sender: nil];
            break;
        }
        case 2: {
            [self performSegueWithIdentifier: @"WordListManagerSegue" sender: nil];
            break;
        }
        case 3: {
            [self composeContactEmail];
            break;
        }
    }
}

#pragma mark - Segue functions

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue destinationViewController] respondsToSelector: @selector(setAppMode:)]) {
        [[segue destinationViewController] setAppMode: appMode];
    }
}

#pragma mark - Mail delegate and mail controller functions

- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError *)error {
    [self dismissModalViewControllerAnimated:YES];
}

- (void) composeContactEmail {
    MFMailComposeViewController *composer = [[MFMailComposeViewController alloc] init];
    composer.mailComposeDelegate = self;
    // @todo, move to strings file
    [composer setToRecipients: @[@"bingo@angelforge.org"]];
    [composer setMessageBody:[self contactEmailBody] isHTML:NO];
    [composer setSubject: @"[Bingo] New Word List/Bug Report/Enhancement Request"];
    [self presentModalViewController:composer animated:YES];
}

- (NSString*) contactEmailBody {
    NSString *contactEmailPath = [[NSBundle mainBundle] pathForResource:@"contact_email_body"
                                                                 ofType:@"txt"];
    NSError *error;
    NSString *messageBody =
        [NSString stringWithContentsOfFile:contactEmailPath
                                  encoding:NSStringEncodingConversionAllowLossy
                                     error:&error];
    if(error) {
        NSLog(@"Error in retrieving email text: %@", error);
    }
    
    return messageBody;
}
@end
