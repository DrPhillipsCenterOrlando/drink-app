//
//  DPLocation.h
//  Drink App
//
//  Created by Nathan Edwards on 5/31/14.
//  Copyright (c) 2014 Dr Phillips Center. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface DPLocation : NSObject <CLLocationManagerDelegate>

+ (id)instance;

- (void)startFence;

- (void)startBeaconMonitoring;

@end
