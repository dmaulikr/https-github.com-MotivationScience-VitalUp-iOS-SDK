//
//  LoginViewController.m
//  SDKDemoApp
//
//  Created by Ralph Jazer Rebong on 10/28/14.
//  Copyright (c) 2014 Validic. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"
#import <VitalUpDeviceSDK/DeviceManager.h>

@interface LoginViewController ()

@property (nonatomic,strong) UserManager *userManager;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.busyView.hidden = YES;
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated{
    BOOL logged;
    
    logged = [[NSUserDefaults standardUserDefaults] boolForKey:@"LoggedIn"];
    
    if (logged) {
            [self performSegueWithIdentifier:@"loginSuccess" sender:self];
            
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loginAction:(id)sender{
    
    

    if (self.loginTextField.text.length>0) {
        self.busyView.hidden = NO;
        /*
            To connect to Validic, UserManager must be initialized with an OrganizationID and Access Token.
         */
        self.userManager = [[UserManager alloc]initWithOrganizationID:@"52e175c5e5af473f13000034" access_token:@"8a54ead80e25826eac4c281d7f50e71a7a5778d4e776b0fc8f972c7ace908ad6"];
        
        
        self.userManager.delegate = self;
        [self.userManager login:self.loginTextField.text];
    }
    
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login Error" message:@"Access code cannot be empty" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }
    
    
    
}

-(void)didLoginStatus:(BOOL)didLoginSuccessfully withError:(NSString *)error{
    self.busyView.hidden = YES;
    
    if (didLoginSuccessfully) {
        NSLog(@"Logged In Successful");
        
        [self performSegueWithIdentifier:@"loginSuccess" sender:self];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login Fail" message:error delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
        NSLog(@"Login Fail");
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"loginSegue"]){
        
        [self loginAction:self];
        
       
    }
    if([[segue identifier] isEqualToString:@"loginSuccess"]){

        [[NSUserDefaults standardUserDefaults] setBool:YES forKey: @"LoggedIn"];

    }

}




@end
