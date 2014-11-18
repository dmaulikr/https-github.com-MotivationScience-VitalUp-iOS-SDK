//
//  AppDelegate.h
//  SDKDemoApp
//
//  Created by Ralph Jazer Rebong on 10/28/14.
//  Copyright (c) 2014 Validic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <VitalUpDeviceSDK/DeviceManager.h>
#import <VitalUpDeviceSDK/SupportedDeviceObject.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,DeviceManagerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) DeviceManager *deviceManager;
@property (strong, nonatomic) NSMutableDictionary *supportedDeviceDictionary;
@property (strong, nonatomic) NSArray *supportedDeviceSectionTitle;

@end

