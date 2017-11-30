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
    NSMutableArray *aryItemList;
    
}
@end

@implementation itemListVc

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    aryItemList = [[NSMutableArray alloc]init];
    aryItemList = [DBOperation selectData:@"Select * from item"];
    
    //NSLog(@"Item =%@",aryItemList);
    
    // NSArray *jsonAry = [DBOperation selectData:@"Select * from Login"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    UIImageView *img = (UIImageView *)[cell.contentView viewWithTag:1];
    img.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",[[aryItemList objectAtIndex:indexPath.row]objectForKey:@"image_name"]]];
    
    UILabel *lb = (UILabel *)[cell.contentView viewWithTag:2];
    lb.text = [[aryItemList objectAtIndex:indexPath.row]objectForKey:@"item_name"];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 231.0;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
