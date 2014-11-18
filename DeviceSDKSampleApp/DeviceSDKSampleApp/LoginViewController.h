//
//  LoginViewController.h
//  SDKDemoApp
//
//  Created by Ralph Jazer Rebong on 10/28/14.
//  Copyright (c) 2014 Validic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <VitalUpDeviceSDK/UserManager.h>

@interface LoginViewController : UIViewController <UserManagerDelegate>

@property (nonatomic,weak) IBOutlet UIButton *loginButton;
@property (nonatomic,weak) IBOutlet UITextField *loginTextField;
@property (nonatomic,weak) IBOutlet UIView *busyView;

@end
