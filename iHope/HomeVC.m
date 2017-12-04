//
//  HomeVC.m
//  iHope
//
//  Created by harikrishna patel on 29/11/17.
//  Copyright © 2017 Softqube. All rights reserved.
//

#import "HomeVC.h"
#import "Global.h"

@interface HomeVC ()<UICollectionViewDelegate,UICollectionViewDataSource, UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    NSString *is_searchOpen;
    NSMutableArray *arrItemList,*arrMainItem;
}
@end

@implementation HomeVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    _txtSearch.delegate = self;
    is_searchOpen=@"0";
    
    arrItemList = [[NSMutableArray alloc]init];
    arrItemList = [DBOperation selectData:@"Select * from item"];
    arrMainItem = [[NSMutableArray alloc]init];
    arrMainItem = [DBOperation selectData:@"Select * from item"];
    [self.tblSearchList reloadData];
    
    
    self.tblSearchList.layer.cornerRadius=4;
    self.tblSearchList.clipsToBounds=YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UITextField Delegate

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    _tblSearchList.hidden = NO;
    NSString *searchString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.item_name CONTAINS[c] %@", searchString];
    NSArray *filteredArray = [arrMainItem filteredArrayUsingPredicate:predicate];
    arrItemList=[filteredArray mutableCopy];
    
    if([arrItemList count] == 0)
    {
        self.tblSearchListHeight.constant=0;
    }
    else if ([arrItemList count] < 4)
    {
        self.tblSearchListHeight.constant= [arrItemList count] * 44;
    }
    else
    {
        self.tblSearchListHeight.constant=176;
    }
    
    
    [self.tblSearchList reloadData];
  
    return YES;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - UITableView Delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrItemList count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=(UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cell_search"];

    UILabel *lbl=(UILabel*)[cell.contentView viewWithTag:1];
    lbl.text=[[arrItemList objectAtIndex:indexPath.row]objectForKey:@"item_name"];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemDetailVc *Item = [self.storyboard instantiateViewControllerWithIdentifier:@"ItemDetailVc"];
    Item.dic = [[arrItemList objectAtIndex:indexPath.row]mutableCopy];
    _tblSearchList.hidden = YES;
    _txtSearch.text  = @"";
    [_txtSearch resignFirstResponder];
    [self.navigationController pushViewController:Item animated:YES];
}

#pragma mark - UICollectionView Delegate Method-

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat screenWidth = self.collectionCategory.frame.size.width;
    float cellWidth = screenWidth / 3.0 - 10;
    CGSize size = CGSizeMake(cellWidth, cellWidth);
    
    return size;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 9;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{


    UICollectionViewCell *cell=(UICollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell_itemlist" forIndexPath:indexPath];
    
    if(indexPath.item == 0)
    {
        UIImageView *img1=(UIImageView*)[cell.contentView viewWithTag:1];
        img1.image=[UIImage imageNamed:@"egg.png"];
    }
    if(indexPath.item == 1)
    {
        UIImageView *img1=(UIImageView*)[cell.contentView viewWithTag:1];
        img1.image=[UIImage imageNamed:@"desert.png"];
    }
    if(indexPath.item == 2)
    {
        UIImageView *img1=(UIImageView*)[cell.contentView viewWithTag:1];
        img1.image=[UIImage imageNamed:@"burger.png"];
    }
    if(indexPath.item == 3)
    {
        UIImageView *img1=(UIImageView*)[cell.contentView viewWithTag:1];
        img1.image=[UIImage imageNamed:@"soup.png"];
    }
    if(indexPath.item == 4)
    {
        UIImageView *img1=(UIImageView*)[cell.contentView viewWithTag:1];
        img1.image=[UIImage imageNamed:@"brekfast.png"];
    }
    if(indexPath.item == 5)
    {
        UIImageView *img1=(UIImageView*)[cell.contentView viewWithTag:1];
        img1.image=[UIImage imageNamed:@"dinner.png"];
    }
    if(indexPath.item == 6)
    {
        UIImageView *img1=(UIImageView*)[cell.contentView viewWithTag:1];
        img1.image=[UIImage imageNamed:@"pancake.png"];
    }
    if(indexPath.item == 7)
    {
        UIImageView *img1=(UIImageView*)[cell.contentView viewWithTag:1];
        img1.image=[UIImage imageNamed:@"beverage.png"];
    }
    if(indexPath.item == 8)
    {
        UIImageView *img1=(UIImageView*)[cell.contentView viewWithTag:1];
        img1.image=[UIImage imageNamed:@"frenchtost.png"];
    }

    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.view endEditing:YES];
    self.txtSearchWidth.constant = 0;
    self.tblSearchListHeight.constant=0;
    
    if(indexPath.item == 0)
    {
        UIViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"itemListVc"];
        [self.navigationController pushViewController:vc animated:NO];
    }
}


#pragma mark- UIButton Action

- (IBAction)btnMenu:(id)sender
{
    [self.view endEditing:YES];
    self.txtSearchWidth.constant = 0;
    self.tblSearchListHeight.constant=0;
    
    KYDrawerController *elDrawer = (KYDrawerController*)self.navigationController.parentViewController;
    [elDrawer setDrawerState:KYDrawerControllerDrawerStateOpened animated:YES];
}

- (IBAction)btnSearch:(id)sender
{
    [self.view endEditing:YES];
    if ([is_searchOpen isEqualToString:@"0"])
    {
        [UIView animateWithDuration:.2 delay:0 options:UIViewAnimationOptionCurveLinear  animations:^{
            self.txtSearchWidth.constant = self.lblHeaderTitle.frame.size.width;
            [self.view layoutIfNeeded];
            is_searchOpen=@"1";
        } completion:^(BOOL finished) {
            //code for completion
        }];
    }
    else
    {
        [UIView animateWithDuration:.2 delay:0 options:UIViewAnimationOptionCurveLinear  animations:^{
            self.txtSearchWidth.constant = 0;
            [self.view layoutIfNeeded];
            is_searchOpen=@"0";
        } completion:^(BOOL finished) {
            //code for completion
        }];

    }
    
}

@end
