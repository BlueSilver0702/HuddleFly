//
//  CommandsViewController.h
//  HuddleFly
//
//  Created by User on 8/8/15.
//  Copyright (c) 2015 XianA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"

@interface CommandsViewController : UIViewController <SlideNavigationControllerDelegate>

- (void)closeModal:(NSString *)selectTxt;

@end
