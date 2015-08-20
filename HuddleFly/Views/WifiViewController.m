//
//  WifiViewController.m
//  HuddleFly
//
//  Created by User on 8/7/15.
//  Copyright (c) 2015 XianA. All rights reserved.
//

#import "WifiViewController.h"
#import "TPKeyboardAvoidingScrollView.h"
#import "OptionViewController.h"

@interface WifiViewController ()
{
    IBOutlet UITextField *ssidTxt;
    IBOutlet UITextField *pwdTxt;
    IBOutlet UITextField *emailTxt;
    IBOutlet TPKeyboardAvoidingScrollView *TPScrollView;
}
@end

@implementation WifiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [TPScrollView contentSizeToFit];
}

- (IBAction)onSubmit:(id)sender {
    
    NSString *ssid = ssidTxt.text;
    NSString *pwd = pwdTxt.text;
    NSString *email = emailTxt.text;
    
    if ([ssid isEqualToString:@""] || [pwd isEqualToString:@""] || [email isEqualToString:@""]) {
        [[[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Please input all fields." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        return;
    }

    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    UIViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"preView"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onCancel:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
