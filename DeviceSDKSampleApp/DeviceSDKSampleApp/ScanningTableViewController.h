//
//  ScanningTableViewController.h
//  SDKDemoApp
//
//  Created by Ralph Jazer Rebong on 11/10/14.
//  Copyright (c) 2014 Validic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <VitalUpDeviceSDK/SupportedDeviceObject.h>
#import <VitalUpDeviceSDK/DeviceManager.h>

@interface ScanningTableViewController : UITableViewController<DeviceManagerDelegate>

@property (nonatomic, strong)SupportedDeviceObject *selectedSupportedDevice;

@end
