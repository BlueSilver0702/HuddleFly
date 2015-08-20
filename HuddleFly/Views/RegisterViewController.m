//
//  RegisterViewController.m
//  HuddleFly
//
//  Created by User on 8/7/15.
//  Copyright (c) 2015 XianA. All rights reserved.
//

#import "RegisterViewController.h"
#import "TPKeyboardAvoidingScrollView.h"

@interface RegisterViewController ()
{
    IBOutlet UITextField *fNameTxt;
    IBOutlet UITextField *lNameTxt;
    IBOutlet UITextField *emailTxt;
    IBOutlet UITextField *pwdTxt;
    IBOutlet UITextField *pwdATxt;
    IBOutlet UITextField *deviceIDTxt;
    IBOutlet UITextField *zipcodeTxt;
    IBOutlet TPKeyboardAvoidingScrollView *TPScrollView;
}
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [TPScrollView contentSizeToFit];
}

- (IBAction)onRegister:(id)sender {
    
    NSString *fname = fNameTxt.text;
    NSString *lname = lNameTxt.text;
    NSString *email = emailTxt.text;
    NSString *pwd = pwdTxt.text;
    NSString *pwdA = pwdATxt.text;
    NSString *deviceID = deviceIDTxt.text;
    NSString *zipcode = zipcodeTxt.text;
    
    if ([fname isEqualToString:@""] || [lname isEqualToString:@""] || [email isEqualToString:@""] || [pwd isEqualToString:@""] || [pwdA isEqualToString:@""] || [deviceID isEqualToString:@""] || [zipcode isEqualToString:@""]) {
        [[[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Please input all fields." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        return;
    }

    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
