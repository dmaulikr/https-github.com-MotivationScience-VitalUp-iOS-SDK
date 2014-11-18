//
//  DevicesTableViewController.m
//  SDKDemoApp
//
//  Created by Ralph Jazer Rebong on 10/28/14.
//  Copyright (c) 2014 Validic. All rights reserved.
//

#import "DevicesTableViewController.h"
#import "MainViewController.h"
#import <VitalUpDeviceSDK/DeviceManager.h>
#import "ScanningTableViewController.h"
#import "AppDelegate.h"


@interface DevicesTableViewController ()

@property (nonatomic, strong)NSMutableArray *devicesArray;
@property (nonatomic, strong)NSMutableDictionary *devicesDictionary;
@property (nonatomic, strong)UIActivityIndicatorView *actInd;
@property (nonatomic,strong) NSArray *supportedDeviceSectionTitle;


@end

@implementation DevicesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    self.actInd = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.actInd];
    
    self.supportedDeviceSectionTitle = app.supportedDeviceSectionTitle;
    self.devicesDictionary = app.supportedDeviceDictionary;
    
    
    app.deviceManager.delegate = self;
    
   
    
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//
//    // Return the number of sections.
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    
    
    // Return the number of rows in the section.
    NSString *sectionTitle = [self.supportedDeviceSectionTitle objectAtIndex:section];
    NSArray *sectionDevices = [self.devicesDictionary objectForKey:sectionTitle];
    return [sectionDevices count];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
        return [self.devicesDictionary count];
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
   
        return [self.supportedDeviceSectionTitle objectAtIndex:section];
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleTableIdentifier];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

        NSString *sectionTitle = [self.supportedDeviceSectionTitle objectAtIndex:indexPath.section];
        NSArray *sectionDeviceArray = [self.devicesDictionary objectForKey:sectionTitle];
        SupportedDeviceObject *deviceFromSectionDeviceArray = [sectionDeviceArray objectAtIndex:indexPath.row];
        NSString *deviceName = deviceFromSectionDeviceArray.DisplayedName;
        NSString *deviceID = deviceFromSectionDeviceArray.DeviceID;
        
        
        cell.textLabel.text = deviceName;
        cell.textLabel.adjustsFontSizeToFitWidth = YES;
        cell.detailTextLabel.text = deviceID;
        cell.detailTextLabel.textColor = [UIColor lightGrayColor];
    
    
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ScanningTableViewController *stvc = [[ScanningTableViewController alloc]init];
    SupportedDeviceObject *supportedDevice = [[SupportedDeviceObject alloc]init];

    NSString *key = [self.supportedDeviceSectionTitle objectAtIndex:indexPath.section];
    NSArray* array = [self.devicesDictionary objectForKey:key];
    
    supportedDevice = [array objectAtIndex:indexPath.row];
    
    stvc.selectedSupportedDevice = supportedDevice;
    
    [self.navigationController pushViewController:stvc animated:YES];
    
}




#pragma mark - Navigation





-(void)threadStartAnimating:(id)data
{
    [self.actInd startAnimating];
}


-(void)threadStopAnimating:(id)data
{
    [self.actInd stopAnimating];
}

#pragma mark DeviceManagerDelegate





//DeviceManagerDelegate


-(void)didConnectToDevice:(ValidicDevice *)device withError:(NSString *)error{
    
}

-(void)didFetchedSupportedDevicesFromJsonFile:(NSMutableDictionary *)supportedDevicesDictionary fromServer:(BOOL)isFromServer withError:(NSError *)error{
    
    
    
}

-(void)didReturnedScannedDevices:(NSArray*)devices withError:(NSString*)error{
    if (!error) {
        [self.actInd stopAnimating];
        NSLog(@"ReturnedDevices = %@",devices);
        self.devicesArray = [devices mutableCopy];
        self.activityView.hidden = YES;
        [self.tableView reloadData];
        
    }
    
    
}

-(void)deviceDisconnected:(ValidicDevice *)imDevice message:(NSString *)message{
    
}





@end
