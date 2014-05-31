//
//  DPRootViewController.m
//  Drink App
//
//  Created by Nathan Edwards on 5/30/14.
//  Copyright (c) 2014 Dr Phillips Center. All rights reserved.
//

#import "DPRootViewController.h"
#import <CoreBluetooth/CoreBluetooth.h>
#import <CoreLocation/CoreLocation.h>

@interface DPRootViewController ()

@end

@implementation DPRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initBeacon
{
    NSUUID *proximityUUID = [[NSUUID alloc] initWithUUIDString:@"018634C9-AAD4-4040-A565-527F2484E017"];
    
    // Create the beacon region.
    CLBeaconRegion *beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:proximityUUID identifier:@"com.dp.device"];
    
    NSDictionary *beaconPeripheralData = [beaconRegion peripheralDataWithMeasuredPower:nil];
    
    // Create the peripheral manager.
    CBPeripheralManager *peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil options:nil];
    
    // Start advertising your beacon's data.
    [peripheralManager startAdvertising:beaconPeripheralData];
}

#pragma mark CBPeripheralManagerDelegate implementation

- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral
{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
