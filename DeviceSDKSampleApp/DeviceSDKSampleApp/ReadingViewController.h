//
//  ReadingViewController.h
//  SDKDemoApp
//
//  Created by Ralph Jazer Rebong on 10/29/14.
//  Copyright (c) 2014 Validic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <VitalUpDeviceSDK/ReadingManagerDelegate.h>

@interface ReadingViewController : UIViewController<ReadingManagerDelegate>

@property (nonatomic, weak)IBOutlet UILabel *connectedLabel;
@property (nonatomic, weak)IBOutlet UILabel *readingResultLabel;
@property (nonatomic, weak)IBOutlet UILabel *deviceLabel;
@property (nonatomic, weak)IBOutlet UIActivityIndicatorView *activityInd;

@property (nonatomic, strong)NSString *deviceName;



@end
