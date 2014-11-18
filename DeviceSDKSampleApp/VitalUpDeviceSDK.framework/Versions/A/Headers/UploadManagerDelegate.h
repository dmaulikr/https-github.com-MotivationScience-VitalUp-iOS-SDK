//
//  UploadManagerDelegate.h
//  SDKDemoApp
//
//  Created by Ralph Jazer Rebong on 11/17/14.
//  Copyright (c) 2014 Validic. All rights reserved.
//
#import <Foundation/Foundation.h>

@class UploadManager;


@protocol UploadManagerDelegate <NSObject>

-(void)didUpload:(BOOL)success withError:(NSString*)error;

@end