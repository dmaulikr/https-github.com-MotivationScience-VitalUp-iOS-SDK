//
//  UploadManager.h
//  VitalUpDeviceSDK
//
//  Created by Ralph Jazer Rebong on 10/27/14.
//  Copyright (c) 2014 Validic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UploadManagerDelegate.h"

@interface UploadManager : NSObject

@property (weak, nonatomic) id<UploadManagerDelegate> delegate;

-(void)uploadReading;
/*
 uploads any Pending uploads that is stored on file to Validic Server.
 
 @delegate -(void)didUpload:(BOOL)success withError:(NSString*)error; called after uploadReading finishes. 
 */

-(int)getNumberOfPendingUploads;
/*
    returns the number of Pending Uploads in file.
 */

@end
