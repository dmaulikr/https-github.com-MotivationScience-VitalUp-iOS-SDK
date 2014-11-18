//
//  UserManager.h
//  VitalUpDeviceSDK
//
//  Created by Ralph Jazer Rebong on 10/27/14.
//  Copyright (c) 2014 Validic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserManagerDelegate.h"



@interface UserManager : NSObject

@property (weak, nonatomic) id<UserManagerDelegate> delegate;

-(NSString *)getValidicUserName;
-(void)setValidicUserName:(NSString *)user_name;

-(NSString *)getValidicUserID;
-(void)setValidicUserID:(NSString *)user_id;

-(NSString *)getValidicToken;
-(void)setValidicToken:(NSString *)token;

-(NSString *)getValidicPIN;
-(void)setValidicPIN:(NSString *)pin;

-(NSString *)getValidicOrganizationID;
-(void)setValidicOrganizationID:(NSString *)token;


- (id)initWithOrganizationID:(NSString *)orgID access_token:(NSString *)token;

-(void)login:(NSString*)accessCode;
//@delegate callback -(void)didLoginStatus:(BOOL)didLoginSuccessfully withError:(NSString*)error;





@end
