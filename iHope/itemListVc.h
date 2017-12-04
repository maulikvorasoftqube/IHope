//
//  itemListVc.h
//  iHope
//
//  Created by MAC0008 on 29/11/17.
//  Copyright © 2017 Softqube. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface itemListVc : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imgSearch;

@property (strong, nonatomic) IBOutlet UITableView *tbl_item_List;
@property (strong, nonatomic) IBOutlet UIView *view_Dictionary_Contact_SideBar;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *view_SideBar_Height;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *view_SideBar_Width;

- (IBAction)btnMenu:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *txtSearch;


@end
