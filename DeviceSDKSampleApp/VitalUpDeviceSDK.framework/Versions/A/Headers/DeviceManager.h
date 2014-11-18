//
//  DeviceManager.h
//  VitalUpDeviceSDK
//
//  Created by Ralph Jazer Rebong on 10/27/14.
//  Copyright (c) 2014 Validic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "DeviceManagerDelegate.h"
#import "SupportedDeviceObject.h"
#import "ValidicDevice.h"

@interface DeviceManager : NSObject

@property (weak, nonatomic) id<DeviceManagerDelegate> delegate;


/*
    Returns a Dictionary of SupportedDeviceObject.
*/

-(void)scanForSupportedDevice:(SupportedDeviceObject*)supportedDevice;
/*
 @parameter - pass an instance of SupportedDeviceObject to filter the devices returned in the delegate callback.
 @delegate callback -(void)didReturnedScannedDevices:(NSArray*)devices withError:(NSString*)error; - returns an Array of ValidicDevice objects.
*/

-(void)addDeviceToDeviceList:(ValidicDevice*)device;
/*
    Stores a ValidicDevice to file.
*/

-(NSArray*)getListOfSavedDevices;
/*
    Returnes an Array of stored ValidicDevice(s).
*/

-(void)fetchListOfSupportedDevices;
/*

 @delegate callback -(void)didFetchedSupportedDevicesFromJsonFile:(NSMutableDictionary*)supportedDevicesDictionary fromServer:               (BOOL)isFromServer withError:(NSError*)error;
 
                    - returns a Dictionary of supported device objects. isFromServer, YES if it came from server, NO if it came locally.
*/


-(void)stopScanning;
/*
    stops the Scanning of Devices.
*/


-(void)openValidicDevice:(ValidicDevice*)device;

/*
  opens a Validic Device for pairing.
 
  @delegate callbacks  -(void)didConnectToDevice:(ValidicDevice *)device withError:(NSString*)error; called when device connected.
                       -(void)deviceDisconnected:(ValidicDevice *)imDevice message:(NSString *)message; called when connected device got disconnected
*/

@end
