//
//  LoginVC.h
//  iHope
//
//  Created by harikrishna patel on 29/11/17.
//  Copyright © 2017 Softqube. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginVC : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *txtEmailid;
@property (strong, nonatomic) IBOutlet UITextField *txtPwd;

@property (strong, nonatomic) IBOutlet UIButton *btnLogin;
- (IBAction)btnLogin:(id)sender;

@end
