//
//  ReadingViewController.m
//  SDKDemoApp
//
//  Created by Ralph Jazer Rebong on 10/29/14.
//  Copyright (c) 2014 Validic. All rights reserved.
//

#import "ReadingViewController.h"
#import <VitalUpDeviceSDK/ReadingManager.h>
#import "AppDelegate.h"

@interface ReadingViewController ()

@property (nonatomic, strong) NSArray *myDevicesArray;
@property (nonatomic, strong) ReadingManager *readingManager;

@end

@implementation ReadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
       
}

-(void)viewWillAppear:(BOOL)animated{
    
    [self getMyDevices];
    
    ValidicDevice *vDevice = [self.myDevicesArray lastObject];
    
    self.deviceLabel.text = vDevice.deviceInformation.BrandName;
    
    if (self.readingManager == nil) {
        self.readingManager = [[ReadingManager alloc]init];
        self.readingManager.delegate = self;
    }
    
    [self.readingManager readDevice:vDevice];
    
  
}

-(void)didConnectDevice:(BOOL)success{
    
    self.connectedLabel.text = @"Connected";
    self.connectedLabel.textColor = [UIColor greenColor];
    
}

-(void)didRecieveData:(BOOL)success withError:(NSString *)error{
    
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Reading Failed" message:error delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            
            [self dismissViewControllerAnimated:YES completion:nil];
            
        });
    }
    else {
    self.readingResultLabel.text = @"Success!";
    self.readingResultLabel.textColor = [UIColor blackColor];
    self.activityInd.hidden = YES;

    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        
         [self dismissViewControllerAnimated:YES completion:nil];
        
    });
    }
}

-(void)getMyDevices{
    
    AppDelegate* app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.myDevicesArray = [[NSArray alloc]init];
    self.myDevicesArray = [app.deviceManager getListOfSavedDevices];
    
    NSLog(@"%@",self.myDevicesArray);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)Cancel{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
