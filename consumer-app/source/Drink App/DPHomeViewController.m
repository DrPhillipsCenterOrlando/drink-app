//
//  DPHomeViewController.m
//  Drink App
//
//  Created by Nathan Edwards on 5/31/14.
//  Copyright (c) 2014 Dr Phillips Center. All rights reserved.
//

#import "DPHomeViewController.h"
#import "DPLoginViewController.h"

@interface DPHomeViewController ()

@property (nonatomic) BOOL loggedIn;

@end

@implementation DPHomeViewController

- (void)viewWillAppear:(BOOL)animated
{
    if (!self.loggedIn)
    {
        [self.view setHidden:YES];
        [self performSegueWithIdentifier:@"RequiresLogin" sender:self];
        self.loggedIn = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"RequiresLogin"]) {
        [[segue destinationViewController] setDelegate:self];
        
    }
}

- (void)userLoggedIn
{
    [self.view setHidden:NO];
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
