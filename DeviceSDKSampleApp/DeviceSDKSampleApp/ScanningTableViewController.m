//
//  ScanningTableViewController.m
//  SDKDemoApp
//
//  Created by Ralph Jazer Rebong on 11/10/14.
//  Copyright (c) 2014 Validic. All rights reserved.
//

#import "ScanningTableViewController.h"
#import "MainViewController.h"
#import <VitalUpDeviceSDK/DeviceManager.h>
#import "AppDelegate.h"
#import <VitalUpDeviceSDK/ValidicDevice.h>

@interface ScanningTableViewController ()

@property (nonatomic, strong)NSMutableArray *devicesArray;
@property (nonatomic, strong)UIActivityIndicatorView *actInd;
@property (nonatomic, strong)AppDelegate *app;

@end

@implementation ScanningTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.title = self.selectedSupportedDevice.BrandName;
    
    self.actInd = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.actInd];
    
    [self.actInd startAnimating];
    
    self.app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.app.deviceManager.delegate = self;
    [self.app.deviceManager scanForSupportedDevice:self.selectedSupportedDevice];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.app.deviceManager stopScanning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    NSLog(@"Devices Count = %lu",(unsigned long)[self.devicesArray count]);
    return [self.devicesArray count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"menuCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    ValidicDevice *device = [self.devicesArray objectAtIndex:indexPath.row];
    cell.textLabel.text = device.deviceInformation.BrandName;
    cell.detailTextLabel.text = device.deviceInformation.Type;;
    NSLog(@"Device Desc = %@",device.deviceInformation.Type);
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ValidicDevice *device = [self.devicesArray objectAtIndex:indexPath.row];
    [self.actInd startAnimating];
    self.app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.app.deviceManager.delegate = self;
    [self.app.deviceManager openValidicDevice:device];
    
}


#pragma mark DeviceManagerDelegate

-(void)didReturnedScannedDevices:(NSArray*)devices withError:(NSString*)error{
    if (!error) {
        [self.actInd stopAnimating];
        NSLog(@"ReturnedDevices = %@",devices);
        self.devicesArray = [devices mutableCopy];
        [self.tableView reloadData];
    }
    
}

-(void)didConnectToDevice:(ValidicDevice *)device withError:(NSString *)error{
    if (!error) {
         self.app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        [self.app.deviceManager addDeviceToDeviceList:device];
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        
        
    }
    
}

-(void)deviceDisconnected:(ValidicDevice *)imDevice message:(NSString *)message{
    NSLog(@"%@",message);
}

//DeviceManagerDelegate

-(void)didFetchedSupportedDevicesFromJsonFile:(NSMutableDictionary *)supportedDevicesDictionary fromServer:(BOOL)isFromServer withError:(NSError *)error{
    
}




@end
