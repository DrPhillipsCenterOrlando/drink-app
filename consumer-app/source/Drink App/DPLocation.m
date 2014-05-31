//
//  DPLocation.m
//  Drink App
//
//  Created by Nathan Edwards on 5/31/14.
//  Copyright (c) 2014 Dr Phillips Center. All rights reserved.
//

#import "DPLocation.h"
#import <CoreLocation/CoreLocation.h>

#define APP_UUID "3A2B084A-57C4-4312-9E9E-81C90B155D19"

@interface DPLocation ()

@property (strong, nonatomic) CLBeaconRegion *myBeaconRegion;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation DPLocation

#pragma mark -

- (void)startFence
{
    // Create a NSUUID with the same UUID as the broadcasting beacon
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@APP_UUID];
    
    // Setup a new region with that UUID and same identifier as the broadcasting beacon
    self.myBeaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid identifier:@"com.db.test"];
    
    self.myBeaconRegion.notifyEntryStateOnDisplay = YES;
    
    self.locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
    [self.locationManager startUpdatingLocation];
    
    // Tell location manager to start monitoring for the beacon region
    [self.locationManager startMonitoringForRegion:self.myBeaconRegion];
    
    // Check if beacon monitoring is available for this device
    if (![CLLocationManager isMonitoringAvailableForClass:[CLBeaconRegion class]]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Monitoring not available" message:nil delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
        return;
    }
    
    if([CLLocationManager isMonitoringAvailableForClass:[CLBeaconRegion class]])
    {
        NSLog(@"Monitoring Avail");
    }
    
    if([CLLocationManager isRangingAvailable])
    {
        NSLog(@"Ranging Avail");
    }
}

- (void)startBeaconMonitoring
{
    // Move some of the stuff above to here so that monitoring only turns on if a user submits a drink order.
}

#pragma mark Singleton Methods

+ (id)instance
{
    static DPLocation *inst = nil;
    
    @synchronized(self)
    {
        if (inst == nil)
        {
            inst = [[self alloc] init];
        }
    }
    
    return inst;
}

- (id)init
{
    if (self = [super init])
    {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
    }
    
    return self;
}

- (void)dealloc
{
    // Should never be called, but just here for clarity really.
}

#pragma mark CLLocationManagerDelegate Implementation

-(void)locationManager:(CLLocationManager*)manager didRangeBeacons:(NSArray*)beacons inRegion:(CLBeaconRegion*)region
{
    CLBeacon *foundBeacon = [beacons firstObject];
    
    // send Put with username, foundBeacon.proximity, foundBeacon.accuracy;
    NSLog(@"username : %lld : %f", (long long)foundBeacon.proximity, foundBeacon.accuracy);
}

- (void)locationManager:(CLLocationManager *)manager monitoringDidFailForRegion:(CLRegion *)region withError:(NSError *)error
{
    NSLog(@"monitoringDidFailForRegion - error: %@", [error localizedDescription]);
}

- (void)locationManager:(CLLocationManager *)manager didDetermineState:(CLRegionState)state forRegion:(CLRegion *)region
{
    switch (state)
    {
        case CLRegionStateInside:
            NSLog(@"Region Entered");
            [self.locationManager startRangingBeaconsInRegion:self.myBeaconRegion];
            break;
            
        case CLRegionStateOutside:
            NSLog(@"Region Left");
            [self.locationManager stopRangingBeaconsInRegion:self.myBeaconRegion];
            break;
            
        default:
            NSLog(@"Unknown State");
            break;
    }
}

@end
