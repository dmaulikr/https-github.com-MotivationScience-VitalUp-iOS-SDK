//
//  UserManagerDelegate.h
//  VitalUpDeviceSDK
//
//  Created by Ralph Jazer Rebong on 10/29/14.
//  Copyright (c) 2014 Validic. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserManager;


@protocol UserManagerDelegate <NSObject>

-(void)didLoginStatus:(BOOL)didLoginSuccessfully withError:(NSString*)error;

@end