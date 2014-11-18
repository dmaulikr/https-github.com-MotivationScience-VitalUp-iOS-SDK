//
//  ReadingManager.h
//  VitalUpDeviceSDK
//
//  Created by Ralph Jazer Rebong on 10/27/14.
//  Copyright (c) 2014 Validic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ValidicDevice.h"
#import "ReadingManagerDelegate.h"

@interface ReadingManager : NSObject

@property (weak, nonatomic) id<ReadingManagerDelegate> delegate;

-(void)readDevice:(ValidicDevice*)device;
/*
 Connects to a ValidicDevice object and gets a reading.
 
 @delegate callbacks -(void)didRecieveData:(BOOL)success withError:(NSString*)error; is called when device successfully recieved a reading.
 
                     -(void)didConnectDevice:(BOOL)success; is called when device successfully connected.
 */



@end
