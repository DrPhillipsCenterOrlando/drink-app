//
//  DPLoginViewController.m
//  Drink App
//
//  Created by Nathan Edwards on 5/31/14.
//  Copyright (c) 2014 Dr Phillips Center. All rights reserved.
//

#import "DPLoginViewController.h"

@interface DPLoginViewController ()

@property (strong, nonatomic) IBOutlet UITextField *lblUsername;

@end

@implementation DPLoginViewController

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([self.lblUsername.text  isEqual: @"a"])
    {
        [self.lblUsername resignFirstResponder];
        [self performSegueWithIdentifier:@"EnterApp" sender:self];
        
        return YES;
    }
    
    return NO;
}

@end
