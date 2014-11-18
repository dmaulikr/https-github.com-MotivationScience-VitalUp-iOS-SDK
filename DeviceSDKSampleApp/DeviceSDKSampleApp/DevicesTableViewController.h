//
//  DevicesTableViewController.h
//  SDKDemoApp
//
//  Created by Ralph Jazer Rebong on 10/28/14.
//  Copyright (c) 2014 Validic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <VitalUpDeviceSDK/DeviceManager.h>

@interface DevicesTableViewController : UITableViewController<DeviceManagerDelegate>

@property (nonatomic,weak)IBOutlet UIView *activityView;

@end
