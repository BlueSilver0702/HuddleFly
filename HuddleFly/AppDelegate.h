//
//  AppDelegate.h
//  HuddleFly
//
//  Created by User on 8/7/15.
//  Copyright (c) 2015 XianA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) User *appUser;
@property (nonatomic) BOOL isLogin;

- (void)logout;

@end

