//
//  LoginVC.m
//  iHope
//
//  Created by harikrishna patel on 29/11/17.
//  Copyright © 2017 Softqube. All rights reserved.
//

#import "LoginVC.h"
#import "Global.h"

@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self commonData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)commonData
{
    self.btnLogin.layer.cornerRadius=4;
    self.btnLogin.clipsToBounds=YES;
    
    
    NSString *UserEmail=[[NSUserDefaults standardUserDefaults]objectForKey:@"UserEmail"];
    if (UserEmail.length != 0)
    {
        UIViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"HomeVC"];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

#pragma mark - UIButton Action

- (IBAction)btnLogin:(id)sender
{
   /* if ([Utility validateBlankField:self.txtEmailid.text]) {
        [WToast showWithText:@"Please enter email!"];
        return;
    }
    if ([Utility validateBlankField:self.txtPwd.text]) {
        [WToast showWithText:@"Please enter password!"];
        return;
    }
    if (![Utility validateEmailWithString:self.txtEmailid.text]) {
        [WToast showWithText:@"Please enter valid email!"];
        return;
    }
    */
    
    NSString *strEmail=self.txtEmailid.text;
    [[NSUserDefaults standardUserDefaults]setObject:strEmail forKey:@"UserEmail"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    UIViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"HomeVC"];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
