//
//  WaitViewController.m
//  HuddleFly
//
//  Created by User on 8/7/15.
//  Copyright (c) 2015 XianA. All rights reserved.
//

#import "WaitViewController.h"

@interface WaitViewController ()

@end

@implementation WaitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)onCancel:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onCant:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
