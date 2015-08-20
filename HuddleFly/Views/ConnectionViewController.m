//
//  ConnectionViewController.m
//  HuddleFly
//
//  Created by User on 8/7/15.
//  Copyright (c) 2015 XianA. All rights reserved.
//

#import "ConnectionViewController.h"

@interface ConnectionViewController ()
{
    IBOutlet UILabel *waitLabel;
    int count;
    NSTimer *timer1;
}
@end

@implementation ConnectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    count = 2;
    [self performSelector:@selector(onCounting) withObject:self afterDelay:1.0];
}

- (void)onCounting {
    timer1 = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(target) userInfo:nil repeats:YES];
}

- (void)target {
    if (count > 0) {
        [timer1 invalidate];
        [self performSegueWithIdentifier:@"toWiFi" sender:nil];
        return;
    }
    waitLabel.text = [NSString stringWithFormat:@"Waiting for %d Sec", count];
    count --;
}

- (IBAction)onCancel:(id)sender {
    [timer1 invalidate];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onCant:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
