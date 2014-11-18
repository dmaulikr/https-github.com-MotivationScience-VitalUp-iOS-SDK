//
//  ReadingManagerDelegate.h
//  SDKDemoApp
//
//  Created by Ralph Jazer Rebong on 10/30/14.
//  Copyright (c) 2014 Validic. All rights reserved.
//


#import <Foundation/Foundation.h>

@class ReadingManager;


@protocol ReadingManagerDelegate <NSObject>

-(void)didRecieveData:(BOOL)success withError:(NSString*)error;
-(void)didConnectDevice:(BOOL)success;

@end