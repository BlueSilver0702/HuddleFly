//
//  LoginViewController.m
//  HuddleFly
//
//  Created by User on 8/7/15.
//  Copyright (c) 2015 XianA. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"

@interface LoginViewController ()
{
    IBOutlet UITextField *unameTxt;
    IBOutlet UITextField *pwdTxt;
    IBOutlet UIImageView *rememberImg;
    BOOL isRemember;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;
    [self.navigationController.navigationBar removeFromSuperview];

    isRemember = [[NSUserDefaults standardUserDefaults] boolForKey:@"remember"];
    if (isRemember) {
        [rememberImg setImage:[UIImage imageNamed:@"icon-check.png"]];
        unameTxt.text = (NSString *)[[NSUserDefaults standardUserDefaults] objectForKey:@"uname"];
        pwdTxt.text = (NSString *)[[NSUserDefaults standardUserDefaults] objectForKey:@"passwd"];
    } else {
        [rememberImg setImage:[UIImage imageNamed:@"icon-check-empty.png"]];
    }
}

- (IBAction)onLogin:(id)sender {
    NSString *uname = unameTxt.text;
    NSString *pwd = pwdTxt.text;
    
    if ([uname isEqualToString:@""]) {
        [[[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Please input user name." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        return;
    }
    
    if ([pwd isEqualToString:@""]) {
        [[[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Please input password." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        return;
    }
    
    if (isRemember) {
        [[NSUserDefaults standardUserDefaults] setObject:uname forKey:@"uname"];
        [[NSUserDefaults standardUserDefaults] setObject:pwd forKey:@"passwd"];
    }
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.appUser.uname = @"Kumar";
    
    [self performSegueWithIdentifier:@"toSetup" sender:nil];
    
    NSLog(@"%@:%@", uname, pwd);
    
    
}

- (IBAction)onRemember:(id)sender {
    if (isRemember) {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"remember"];
        isRemember = NO;
        [rememberImg setImage:[UIImage imageNamed:@"icon-check-empty.png"]];
    } else {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"remember"];
        isRemember = YES;
        [rememberImg setImage:[UIImage imageNamed:@"icon-check.png"]];
    }
}

- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidDisappear:(BOOL)animated {
    unameTxt.text = @"";
    pwdTxt.text = @"";
    [rememberImg setImage:[UIImage imageNamed:@"icon-check-empty.png"]];
}

@end
