//
//  ValidicDevice.h
//  SDKDemoApp
//
//  Created by Ralph Jazer Rebong on 10/29/14.
//  Copyright (c) 2014 Validic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SupportedDeviceObject.h"

@interface ValidicDevice : NSObject

@property (strong, nonatomic) id bluetoothDevice;
//Stores the instance of the bluetooth device.

@property (strong, nonatomic) SupportedDeviceObject *deviceInformation;
//Stores information about the bluetooth Device.




@end
