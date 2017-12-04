//
//  itemListVc.m
//  iHope
//
//  Created by MAC0008 on 29/11/17.
//  Copyright © 2017 Softqube. All rights reserved.
//

#import "itemListVc.h"
#import "Global.h"

@interface itemListVc ()
{
    NSMutableArray *aryItemList,*arrMainItem;
    
}
@end

@implementation itemListVc

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    _txtSearch.delegate = self;
    
    aryItemList = [[NSMutableArray alloc]init];
    aryItemList = [DBOperation selectData:@"Select * from item"];
    
    arrMainItem = [[NSMutableArray alloc]init];
    arrMainItem = [DBOperation selectData:@"Select * from item"];
    
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"item_name"
                                                 ascending:YES];
    NSArray *sortedArray = [aryItemList sortedArrayUsingDescriptors:@[sortDescriptor]];
    aryItemList = [[NSMutableArray alloc]initWithArray:sortedArray];
    
    _view_Dictionary_Contact_SideBar.layer.cornerRadius = 10.0;
    _view_Dictionary_Contact_SideBar.layer.masksToBounds = YES;
    
    _tbl_item_List.sectionIndexBackgroundColor = [UIColor colorWithRed:232.0/255.0 green:51.0/255.0 blue:50.0/255.0 alpha:1.0];
    _tbl_item_List.sectionIndexColor = [UIColor whiteColor];

    self.tbl_item_List.separatorStyle=UITableViewCellSeparatorStyleNone;
    
        
    //NSLog(@"Item =%@",aryItemList);
    
    // NSArray *jsonAry = [DBOperation selectData:@"Select * from Login"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextField Delegate

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *searchString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.item_name CONTAINS[c] %@", searchString];
    NSArray *filteredArray = [arrMainItem filteredArrayUsingPredicate:predicate];
    aryItemList=[filteredArray mutableCopy];

    if(searchString.length == 0)
    {
        aryItemList=[arrMainItem mutableCopy];
    }
    
    [self.tbl_item_List reloadData];
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - tabelview delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return aryItemList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"ItemCell"];
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    [cell.contentView setBackgroundColor:[UIColor clearColor]];
    UIImageView *img = (UIImageView *)[cell.contentView viewWithTag:1];
    img.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",[[aryItemList objectAtIndex:indexPath.row]objectForKey:@"image_name"]]];
    
    UILabel *lb = (UILabel *)[cell.contentView viewWithTag:2];
    lb.text = [[aryItemList objectAtIndex:indexPath.row]objectForKey:@"item_name"];
    
    return cell;
}


- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return[NSArray arrayWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", nil];
}
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    NSInteger newRow = [self indexForFirstChar:title inArray:aryItemList];
    NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:newRow inSection:0];
    [tableView scrollToRowAtIndexPath:newIndexPath atScrollPosition:UITableViewScrollPositionMiddle animated:NO];
    
    return index;
}

- (NSInteger)indexForFirstChar:(NSString *)character inArray:(NSArray *)array
{
    NSUInteger count = 0;
    for (NSMutableDictionary *dic in array)
    {
        NSString *Splitstr = [dic objectForKey:@"item_name"];
        NSString *str = [Splitstr substringToIndex:1];
        
        if ([str hasPrefix:character])
        {
            return count;
        }
        count++;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 231.0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemDetailVc *Item = [self.storyboard instantiateViewControllerWithIdentifier:@"ItemDetailVc"];
    Item.dic = [[aryItemList objectAtIndex:indexPath.row]mutableCopy];
    [self.navigationController pushViewController:Item animated:YES];
}

#pragma mark - UIButton Action

- (IBAction)btnMenu:(id)sender
{
    [self.view endEditing:YES];
    KYDrawerController *elDrawer = (KYDrawerController*)self.navigationController.parentViewController;
    [elDrawer setDrawerState:KYDrawerControllerDrawerStateOpened animated:YES];
}

@end
