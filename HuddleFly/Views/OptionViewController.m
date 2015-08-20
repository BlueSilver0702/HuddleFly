//
//  OptionViewController.m
//  HuddleFly
//
//  Created by User on 8/7/15.
//  Copyright (c) 2015 XianA. All rights reserved.
//

#import "OptionViewController.h"

@interface OptionViewController ()
{
    NSArray *optionArr;
}
@end

@implementation OptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = NO;
    optionArr = [NSArray arrayWithObjects:@"Google Calendar", @"Google Tasks", @"Facebook Album", @"Weather Forecase Near You", @"Post A Message", @"Play YouTube", @"Show World Time", @"Local Events Near You", @"Global & Local News", @"Currency & Stocks", nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FirstCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    UILabel *nameLabel = (UILabel *) [cell viewWithTag:1];
    UIButton *loginButton = (UIButton *) [cell viewWithTag:2];
    UIView *backView = (UIView *) [cell viewWithTag:3];
    nameLabel.text = [optionArr objectAtIndex:indexPath.row];
    backView.layer.cornerRadius = 4.0;
    backView.clipsToBounds = YES;
    loginButton.layer.cornerRadius = 2.0;
    loginButton.clipsToBounds = YES;
    if (indexPath.row == 0) {
        [loginButton setTitle:@"Google Login" forState:UIControlStateNormal];
    } else if (indexPath.row == 2) {
        [loginButton setTitle:@"Facebook Login" forState:UIControlStateNormal];
    } else {
        loginButton.hidden = YES;
    }
    return cell;
}

- (IBAction)openMenu:(id)sender
{
    [[SlideNavigationController sharedInstance] toggleLeftMenu];
}

@end
