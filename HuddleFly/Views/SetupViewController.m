//
//  SetupViewController.m
//  HuddleFly
//
//  Created by User on 8/7/15.
//  Copyright (c) 2015 XianA. All rights reserved.
//

#import "SetupViewController.h"
#import "AppDelegate.h"

@interface SetupViewController ()
{
    IBOutlet UILabel *welcomeLab;
    AppDelegate *appDelegate;
}
@end

@implementation SetupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    welcomeLab.text = [NSString stringWithFormat:@"Welcome,  %@!", appDelegate.appUser.uname];
}

- (IBAction)onLogout:(id)sender {
    [appDelegate logout];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
