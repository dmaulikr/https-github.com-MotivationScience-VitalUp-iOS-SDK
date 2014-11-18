//
//  MainViewController.h
//  SDKDemoApp
//
//  Created by Ralph Jazer Rebong on 10/28/14.
//  Copyright (c) 2014 Validic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <VitalUpDeviceSDK/ValidicDevice.h>
#import <VitalUpDeviceSDK/UploadManagerDelegate.h>

@interface MainViewController : UIViewController<UploadManagerDelegate>

@property (nonatomic, weak) IBOutlet UILabel *deviceLabel;
@property (nonatomic, weak) IBOutlet UILabel *readingLabel;
@property (nonatomic, weak) IBOutlet UILabel *uploadStatus;

@property (nonatomic, weak) IBOutlet UIButton *readingButton;
@property (nonatomic, weak) IBOutlet UIButton *uploadButton;

@property (nonatomic, strong) NSString *deviceString;
@property (nonatomic, strong) ValidicDevice *validicDevice;

@end
