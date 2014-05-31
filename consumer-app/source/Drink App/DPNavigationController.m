//
//  DPNavigationController.m
//  Drink App
//
//  Created by Nathan Edwards on 5/31/14.
//  Copyright (c) 2014 Dr Phillips Center. All rights reserved.
//

#import "DPNavigationController.h"
#import "DPLocation.h"
#import "DPLoginViewController.h"

@interface DPNavigationController ()

@end

@implementation DPNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[DPLocation instance] startFence];
}

- (void) viewWillAppear:(BOOL)animated
{
    UIImage *image = [UIImage imageNamed:@"navigation-bar.png"];
    [[UINavigationBar appearance] setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
