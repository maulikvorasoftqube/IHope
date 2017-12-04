//
//  CellWithImage.h
//  iHope
//
//  Created by MAC0008 on 01/12/17.
//  Copyright © 2017 Softqube. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellWithImage : UITableViewCell
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *lbStepHeight;
@property (strong, nonatomic) IBOutlet UILabel *lbIndex;
@property (strong, nonatomic) IBOutlet UILabel *lbDetail;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *lbDetailTop;

@end
