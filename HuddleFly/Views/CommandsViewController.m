//
//  CommandsViewController.m
//  HuddleFly
//
//  Created by User on 8/8/15.
//  Copyright (c) 2015 XianA. All rights reserved.
//

#import "CommandsViewController.h"
#import "ComSelViewController.h"

@interface CommandsViewController ()
{
    IBOutlet UILabel *unameTxt;
    IBOutlet UIView *modalView;
}
@end

@implementation CommandsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = NO;
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main"
                                                             bundle: nil];
    ComSelViewController *currencyView = (ComSelViewController *)[mainStoryboard instantiateViewControllerWithIdentifier: @"ComSelView"];
    
    [self addChildViewController:currencyView];
    [modalView addSubview:currencyView.view];
    [modalView setHidden:YES];
}

- (IBAction)onForget:(id)sender {
    
//    NSString *uname = unameTxt.text;
    
    [[[UIAlertView alloc] initWithTitle:@"Success!" message:@"Successfully registered your Device." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
    
}

- (IBAction)onSelect:(id)sender {
    [UIView transitionWithView:self.view duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        [modalView setHidden:NO];
    } completion:nil];
}

- (void)closeModal:(NSString *)selectTxt {
    [UIView transitionWithView:self.view duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        [modalView setHidden:YES];
        unameTxt.text = selectTxt;
    } completion:nil];
}

- (IBAction)openMenu:(id)sender
{
    [[SlideNavigationController sharedInstance] toggleLeftMenu];
}

@end
