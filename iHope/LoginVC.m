//
//  LoginVC.m
//  iHope
//
//  Created by harikrishna patel on 29/11/17.
//  Copyright © 2017 Softqube. All rights reserved.
//

#import "LoginVC.h"

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
    
}

#pragma mark - UIButton Action

- (IBAction)btnLogin:(id)sender
{
    UIViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"HomeVC"];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
