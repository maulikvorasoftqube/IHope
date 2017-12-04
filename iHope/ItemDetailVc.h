//
//  ItemDetailVc.h
//  iHope
//
//  Created by MAC0008 on 30/11/17.
//  Copyright © 2017 Softqube. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemDetailVc : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

- (IBAction)btnHomeClicked:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *viewHeader;
- (IBAction)btnBAckClicked:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *imgLike;
@property (strong, nonatomic) IBOutlet UILabel *lbItemName;
@property (strong, nonatomic) IBOutlet UIPageControl *PageControl;
@property (strong, nonatomic) IBOutlet UIImageView *imgItemName;
- (IBAction)btnShareClicked:(id)sender;
- (IBAction)btnLikeClicked:(id)sender;
@property(strong,nonatomic)NSMutableDictionary *dic;
@property (strong, nonatomic) IBOutlet UITableView *tbl;
@property (strong, nonatomic) IBOutlet UITableView *tbl_Multiple_Layout;

@end
