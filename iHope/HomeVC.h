//
//  HomeVC.h
//  iHope
//
//  Created by harikrishna patel on 29/11/17.
//  Copyright © 2017 Softqube. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeVC : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIButton *btnMenu;
- (IBAction)btnMenu:(id)sender;

@property (strong, nonatomic) IBOutlet UICollectionView *collectionCategory;

@property (strong, nonatomic) IBOutlet UITextField *txtSearch;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *txtSearchWidth;
@property (strong, nonatomic) IBOutlet UIButton *btnSearch;
- (IBAction)btnSearch:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *lblHeaderTitle;

@property (strong, nonatomic) IBOutlet UITableView *tblSearchList;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *tblSearchListHeight;


@end
