//
//  DPRootViewController.m
//  Drink App
//
//  Created by Nathan Edwards on 5/30/14.
//  Copyright (c) 2014 Dr Phillips Center. All rights reserved.
//

#import "DPRootViewController.h"
#import "DPLocation.h"

@interface DPRootViewController ()

@end

@implementation DPRootViewController

- (void) viewWillAppear:(BOOL)animated
{
    UIImage *image = [UIImage imageNamed:@"navigation-bar.png"];
    [[UINavigationBar appearance] setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[DPLocation instance] startFence];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
