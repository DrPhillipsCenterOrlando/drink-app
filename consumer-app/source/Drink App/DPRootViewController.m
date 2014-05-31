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

#define SERVICE_UUID @"3A2B084A-57C4-4312-9E9E-81C90B155D19"
#define CHARACTERISTIC_UUID @"FE9B56BF-64E1-4375-8818-B7377701CC7A"

@interface DPRootViewController ()

@property (strong, nonatomic) CBPeripheralManager *peripheralManager;
@property (strong, nonatomic) CBMutableCharacteristic *transferCharacteristic;
@property (nonatomic, strong) NSMutableArray *centrals;

@end

@implementation DPRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    // init the peripheral manager and array for connected centrals
    
    _peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil];
    
    _centrals = [NSMutableArray array];
}

- (void)viewWillDisappear:(BOOL)animated
{
    // stop advertising when view will disappear
    
    [self.peripheralManager stopAdvertising];
    self.peripheralManager = nil;
    
    [super viewWillDisappear:animated];
}

#pragma mark - CBPeripheral delegate methods

- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral
{
    if (peripheral.state != CBPeripheralManagerStatePoweredOn) {
        return;
    }
    
    NSLog(@"PeripheralManager powered on.");
    
    self.transferCharacteristic = [[CBMutableCharacteristic alloc] initWithType:[CBUUID UUIDWithString: CHARACTERISTIC_UUID] properties:CBCharacteristicPropertyNotify value:nil permissions:CBAttributePermissionsReadable];
    
    CBMutableService *transferService = [[CBMutableService alloc] initWithType:[CBUUID UUIDWithString:SERVICE_UUID] primary:YES];
    
    transferService.characteristics = @[self.transferCharacteristic];
    
    [self.peripheralManager addService:transferService];
    
    [self.peripheralManager startAdvertising:@{ CBAdvertisementDataServiceUUIDsKey : @[[CBUUID UUIDWithString:SERVICE_UUID]], CBAdvertisementDataLocalNameKey : @"EstimoteBeacon" }];
    
    NSLog(@"PeripheralManager is broadcasting (%@).", SERVICE_UUID);
}

- (void)peripheralManager:(CBPeripheralManager *)peripheral central:(CBCentral *)central didSubscribeToCharacteristic:(CBCharacteristic *)characteristic
{
    [_centrals addObject:central];
}

@end
