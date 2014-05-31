//
//  DPLoginViewController.h
//  Drink App
//
//  Created by Nathan Edwards on 5/31/14.
//  Copyright (c) 2014 Dr Phillips Center. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DPLoginDelegate;

@interface DPLoginViewController: UIViewController <UITextFieldDelegate>

@property (nonatomic, weak) id<DPLoginDelegate> delegate;

@end

@protocol DPLoginDelegate <NSObject>
@required
-(void)userLoggedIn;

@end