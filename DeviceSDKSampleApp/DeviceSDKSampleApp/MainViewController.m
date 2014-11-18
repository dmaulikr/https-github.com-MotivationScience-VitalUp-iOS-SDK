//
//  MainViewController.m
//  SDKDemoApp
//
//  Created by Ralph Jazer Rebong on 10/28/14.
//  Copyright (c) 2014 Validic. All rights reserved.
//

#import "MainViewController.h"
#import "ReadingViewController.h"
#import "AppDelegate.h"
#import "DevicesTableViewController.h"
#import <VitalUpDeviceSDK/ValidicDevice.h>
#import <VitalUpDeviceSDK/ReadingManager.h>
#import <VitalUpDeviceSDK/UploadManager.h>

@interface MainViewController ()

@property (nonatomic, retain)NSArray *myDevicesArray;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Main Menu";
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillLayoutSubviews{
  
}

-(void)viewWillAppear:(BOOL)animated{
     [self getMyDevices];
       [self setLabels];
    
    
}

-(void)setLabels{
    if (self.myDevicesArray) {
        
    
    ValidicDevice *vDevice = [self.myDevicesArray lastObject];
    
    self.deviceLabel.text = vDevice.deviceInformation.BrandName;
    }
    
    UploadManager *rM = [[UploadManager alloc]init];
    
    self.readingLabel.text =[@([rM getNumberOfPendingUploads])stringValue];
}



-(IBAction)readFromDevice:(id)sender{
    
    ReadingViewController *rvc = [[ReadingViewController alloc]init];
    rvc.deviceName = self.deviceLabel.text;
    [self presentViewController:rvc animated:YES completion:nil];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"readFromDevice"]){
        
       
        ReadingViewController *rvc = (ReadingViewController *)[segue destinationViewController];
        rvc.deviceName = self.deviceLabel.text;

        
        
    }
}

-(IBAction)SelectDevice{

    DevicesTableViewController *dvtc = [[DevicesTableViewController alloc]init];
    [self.navigationController pushViewController:dvtc animated:YES];
    
}




-(IBAction)uploadAction{
    UploadManager *uploadMgr = [[UploadManager alloc]init];
    
    [uploadMgr uploadReading];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        
        [self setLabels];
    });

}

-(void)getMyDevices{
    
   AppDelegate* app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
   self.myDevicesArray = [[NSArray alloc]init];
   self.myDevicesArray = [app.deviceManager getListOfSavedDevices];
    
    NSLog(@"%@",self.myDevicesArray);
    
}

-(void)didUpload:(BOOL)success withError:(NSString *)error{
    if (success) {
        self.uploadStatus.text = @"Success";
    }
    else{
        self.uploadStatus.text = @"Fail";
    }
    
     [self setLabels];
}



@end
