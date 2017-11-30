//
//  itemListVc.h
//  iHope
//
//  Created by MAC0008 on 29/11/17.
//  Copyright © 2017 Softqube. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface itemListVc : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tbl_item_List;

@end
