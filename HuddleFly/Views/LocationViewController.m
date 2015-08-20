//
//  LocationViewController.m
//  HuddleFly
//
//  Created by User on 8/8/15.
//  Copyright (c) 2015 XianA. All rights reserved.
//

#import "LocationViewController.h"

@interface LocationViewController ()
{
    IBOutlet UITextField *unameTxt;
}
@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = NO;
}

- (IBAction)onForget:(id)sender {
    
    NSString *uname = unameTxt.text;
    
    if ([uname isEqualToString:@""]) {
        [[[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Please input Location." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        return;
    }
    
    [[[UIAlertView alloc] initWithTitle:@"Success!" message:@"Successfully registered your Location." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
    
    
}

- (IBAction)openMenu:(id)sender
{
    [[SlideNavigationController sharedInstance] toggleLeftMenu];
}

@end
