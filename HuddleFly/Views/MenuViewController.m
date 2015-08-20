//
//  MenuViewController.m
//  HuddleFly
//
//  Created by User on 8/8/15.
//  Copyright (c) 2015 XianA. All rights reserved.
//

#import "MenuViewController.h"
#import "SlideNavigationController.h"
#import "AppDelegate.h"

@interface MenuViewController ()
{
    IBOutlet UILabel *helloLabel;
    AppDelegate *appDelegate;
    UIStoryboard *mainStoryboard;
}
@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
}

- (void)viewWillAppear:(BOOL)animated {
    if (appDelegate.isLogin) {
        helloLabel.text = [NSString stringWithFormat:@"Hello, %@!", appDelegate.appUser.uname];
    }
}

- (IBAction)onPreferences:(id)sender {
    UIViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"preView"];
    [[SlideNavigationController sharedInstance] popAllAndSwitchToViewController:vc withCompletion:nil];
}

- (IBAction)onDevice:(id)sender {
    UIViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"deviceView"];
    [[SlideNavigationController sharedInstance] popAllAndSwitchToViewController:vc withCompletion:nil];
}

- (IBAction)onLocation:(id)sender {
    UIViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"locationView"];
    [[SlideNavigationController sharedInstance] popAllAndSwitchToViewController:vc withCompletion:nil];
}

- (IBAction)onCommands:(id)sender {
    UIViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"commandsView"];
    [[SlideNavigationController sharedInstance] popAllAndSwitchToViewController:vc withCompletion:nil];
}

- (IBAction)onLogout:(id)sender {
    NSLog(@"Logout");
    [appDelegate logout];
    
    UIViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"mainView"];
    [[SlideNavigationController sharedInstance] popAllAndSwitchToViewController:vc withCompletion:nil];
    
    [SlideNavigationController sharedInstance].navigationBarHidden = YES;
    [[SlideNavigationController sharedInstance].navigationBar removeFromSuperview];

}

@end
