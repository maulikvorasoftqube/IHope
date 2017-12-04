//
//  Menu.m
//  Storyboard
//
//Just updated MainViewController and DrawerTableViewController (both programmed in Swift)
//to objectiveC version (MainViewControllerObjc and Menu), this way will be easier to implement on Objective-c Projects.
//
//  Created by Daniel Rosero on 22/01/16.
//  Copyright © 2016 Kyohei Yamaguchi. All rights reserved.
//

#import "Menu.h"
#import "KYDrawerController.h"
#import "Global.h"


@implementation Menu



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)newIndexPath{
    [tableView deselectRowAtIndexPath:newIndexPath animated:YES];
    
    KYDrawerController *elDrawer = (KYDrawerController*)self.navigationController.parentViewController;
   
    UINavigationController *navController;
    switch ([newIndexPath row])
    {
        case 0:
        {
            UIViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"HomeVC"];
            navController=[[UINavigationController alloc]initWithRootViewController:viewController];
            navController.navigationBarHidden=YES;
            elDrawer.mainViewController=navController;
            break;
        }
        case 1:
        {
            UIViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"HomeVC"];
            navController=[[UINavigationController alloc]initWithRootViewController:viewController];
            navController.navigationBarHidden=YES;
            elDrawer.mainViewController=navController;
            break;
        }
        case 2:
        {
            UIViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"itemListVc"];
            navController=[[UINavigationController alloc]initWithRootViewController:viewController];
            navController.navigationBarHidden=YES;
            elDrawer.mainViewController=navController;
            break;
        }
        case 3:
        {
            UIViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"itemListVc"];
            navController=[[UINavigationController alloc]initWithRootViewController:viewController];
            navController.navigationBarHidden=YES;
            elDrawer.mainViewController=navController;
            break;
        }
        case 4:
        {
            UIViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"itemListVc"];
            navController=[[UINavigationController alloc]initWithRootViewController:viewController];
            navController.navigationBarHidden=YES;
            elDrawer.mainViewController=navController;
            break;
        }
        case 5:
        {
            UIViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"itemListVc"];
            navController=[[UINavigationController alloc]initWithRootViewController:viewController];
            navController.navigationBarHidden=YES;
            elDrawer.mainViewController=navController;

            break;
        }
        case 6:
        {
            UIViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"itemListVc"];
            navController=[[UINavigationController alloc]initWithRootViewController:viewController];
            navController.navigationBarHidden=YES;
            elDrawer.mainViewController=navController;

            break;
        }
        case 7:
        {
            UIViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"itemListVc"];
            navController=[[UINavigationController alloc]initWithRootViewController:viewController];
            navController.navigationBarHidden=YES;
            elDrawer.mainViewController=navController;

            break;
        }
        case 8:
        {
            UIViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ContactusVC"];
            navController=[[UINavigationController alloc]initWithRootViewController:viewController];
            navController.navigationBarHidden=YES;
            elDrawer.mainViewController=navController;

            break;
        }
            
        default:{
            
            break;
        }
            
    }
    
    [elDrawer setDrawerState:KYDrawerControllerDrawerStateClosed animated:YES];
}




@end
