//
//  SelectViewController.m
//  HuddleFly
//
//  Created by User on 8/7/15.
//  Copyright (c) 2015 XianA. All rights reserved.
//

#import "SelectViewController.h"
#import <GoogleSignIn/GIDGoogleUser.h>
#import <GoogleSignIn/GIDProfileData.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "AppDelegate.h"

@interface SelectViewController () <GIDSignInDelegate, GIDSignInUIDelegate, FBSDKLoginButtonDelegate>

@property (weak, nonatomic) IBOutlet GIDSignInButton *signInButton;
@property (weak, nonatomic) IBOutlet FBSDKLoginButton *fbInButton;

@end

@implementation SelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [GIDSignIn sharedInstance].delegate = self;
    [GIDSignIn sharedInstance].uiDelegate = self;
    
    // Uncomment to automatically sign in the user.
    [[GIDSignIn sharedInstance] signInSilently];
    
    self.signInButton.style = 1;
    
    self.fbInButton.readPermissions = @[@"public_profile", @"email"];
    [FBSDKProfile enableUpdatesOnAccessTokenChange:YES];
    
    [self toggleAuthUI];
}

- (void)  loginButton:(FBSDKLoginButton *)loginButton
didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
                error:(NSError *)error {
    
    if ([FBSDKAccessToken currentAccessToken]) {
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil] startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *err) {
            NSLog(@"fetched Info%@", result);
            if (!error) {
                AppDelegate *appDel = [[UIApplication sharedApplication] delegate];
                NSDictionary *resultD = (NSDictionary *)result;
                appDel.appUser.uname = [resultD objectForKey:@"name"];
                appDel.appUser.fmail = @"";
                appDel.appUser.fName = [resultD objectForKey:@"name"];
                
                if (appDel.isLogin) {
                    return;
                }
                [self performSegueWithIdentifier:@"toOtherSetup" sender:nil];
                appDel.isLogin = YES;
            }
        }];
    }
}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {

}

- (void)signIn:(GIDSignIn *)signIn
didSignInForUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
    // Perform any operations on signed in user here.
//    self.statusText.text = [NSString stringWithFormat:@"Signed in user: %@",user.profile.name];
    if ([GIDSignIn sharedInstance].currentUser.authentication == nil) {
        // Not signed in
        return;
    }
    AppDelegate *appDel = [[UIApplication sharedApplication] delegate];
    appDel.appUser.uname = user.profile.name;
    appDel.appUser.gmail = user.userID;
    appDel.appUser.gName = user.profile.name;
    
    NSLog(@"hahaha:");
    [self toggleAuthUI];
    if (appDel.isLogin) {
        return;
    }
    [self performSegueWithIdentifier:@"toOtherSetup" sender:nil];
    appDel.isLogin = YES;
}
// [END signin_handler]
// This callback is triggered after the disconnect call that revokes data
// access to the user's resources has completed.
// [START disconnect_handler]
- (void)signIn:(GIDSignIn *)signIn
didDisconnectWithUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
    // Perform any operations when the user disconnects from app here.
//    self.statusText.text = @"Disconnected user";
    [self toggleAuthUI];
}

- (void)toggleAuthUI {
    if ([GIDSignIn sharedInstance].currentUser.authentication == nil) {
        // Not signed in
    } else {
        // Signed in
        
    }
}

- (IBAction)onBack:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
