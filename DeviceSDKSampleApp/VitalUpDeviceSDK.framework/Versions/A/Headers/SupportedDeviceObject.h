//
//  SupportedDeviceObject.h
//  SDKDemoApp
//
//  Created by Ralph Jazer Rebong on 11/9/14.
//  Copyright (c) 2014 Validic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SupportedDeviceObject : NSObject

@property (strong, nonatomic) NSString *Type;
@property (strong, nonatomic) NSString *Company;
@property (strong, nonatomic) NSString *BrandName;
@property (strong, nonatomic) NSString *DeviceID;
@property (strong, nonatomic) NSString *ScanName;
@property (strong, nonatomic) NSString *PairingInstruction;
@property (strong, nonatomic) NSString *ReadingInstruction;
@property (strong, nonatomic) NSString *IOSSupport;
@property (strong, nonatomic) NSString *DisplayedName;

@end
