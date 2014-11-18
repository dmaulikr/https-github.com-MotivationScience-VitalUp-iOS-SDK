//
//  AppDelegate.m
//  SDKDemoApp
//
//  Created by Ralph Jazer Rebong on 10/28/14.
//  Copyright (c) 2014 Validic. All rights reserved.
//

#import "AppDelegate.h"
#import <VitalUpDeviceSDK/SupportedDeviceObject.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /*
     Create an instance of DeviceManager for handling BLE devices.
     */
    self.deviceManager = [[DeviceManager alloc]init];
    self.deviceManager.delegate = self;
    
    /*
        Fetches the list of SupportedDevices in the server.
        @delegate callback below
     */
    [self.deviceManager fetchListOfSupportedDevices];
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


//DeviceManagerDelegate

-(void)didConnectToDevice:(ValidicDevice *)device withError:(NSString *)error{
    
}

-(void)didFetchedSupportedDevicesFromJsonFile:(NSMutableDictionary *)supportedDevicesDictionary fromServer:(BOOL)isFromServer withError:(NSError *)error{
    
    NSLog(@"ReturnedDevices = %@ FromServer = %s",supportedDevicesDictionary,isFromServer ? "yes" : "no");
    
    
    self.supportedDeviceDictionary = supportedDevicesDictionary;
    
    
    self.supportedDeviceSectionTitle  = [[supportedDevicesDictionary allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    
    
}

-(void)didReturnedScannedDevices:(NSArray *)devices withError:(NSString *)error{
    
}

-(void)deviceDisconnected:(ValidicDevice *)imDevice message:(NSString *)message{
    
}




@end
