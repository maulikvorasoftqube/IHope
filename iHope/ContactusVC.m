//
//  ContactusVC.m
//  iHope
//
//  Created by harikrishna patel on 30/11/17.
//  Copyright © 2017 Softqube. All rights reserved.
//

#import "ContactusVC.h"
#import "Global.h"
@interface ContactusVC ()

@end

@implementation ContactusVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)btnMenu:(id)sender {
    KYDrawerController *elDrawer = (KYDrawerController*)self.navigationController.parentViewController;
    [elDrawer setDrawerState:KYDrawerControllerDrawerStateOpened animated:YES];
}
@end
