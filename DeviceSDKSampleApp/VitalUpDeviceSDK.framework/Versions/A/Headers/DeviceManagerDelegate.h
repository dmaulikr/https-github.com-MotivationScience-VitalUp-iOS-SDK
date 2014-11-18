//
//  DeviceManagerDelegate.h
//  SDKDemoApp
//
//  Created by Ralph Jazer Rebong on 11/6/14.
//  Copyright (c) 2014 Validic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ValidicDevice.h"

@class DeviceManager;


@protocol DeviceManagerDelegate <NSObject>

-(void)didReturnedScannedDevices:(NSArray*)devices withError:(NSString*)error;
//Returns an Array of ValidicDevice objects.

-(void)didFetchedSupportedDevicesFromJsonFile:(NSMutableDictionary*)supportedDevicesDictionary fromServer:(BOOL)isFromServer withError:(NSError*)error;

@optional
-(void)didConnectToDevice:(ValidicDevice *)device withError:(NSString*)error;
-(void)deviceDisconnected:(ValidicDevice *)imDevice message:(NSString *)message;




@end