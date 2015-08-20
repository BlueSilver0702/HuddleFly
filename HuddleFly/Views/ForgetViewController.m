//
//  ForgetViewController.m
//  HuddleFly
//
//  Created by User on 8/7/15.
//  Copyright (c) 2015 XianA. All rights reserved.
//

#import "ForgetViewController.h"

@interface ForgetViewController ()
{
    IBOutlet UITextField *unameTxt;
}
@end

@implementation ForgetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)onForget:(id)sender {
    
    NSString *uname = unameTxt.text;
    
    if ([uname isEqualToString:@""]) {
        [[[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Please input Email." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        return;
    }
    
    [self onBack:nil];
    
    
}

- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
