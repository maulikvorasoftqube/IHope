//
//  ItemDetailVc.m
//  iHope
//
//  Created by MAC0008 on 30/11/17.
//  Copyright © 2017 Softqube. All rights reserved.
//

#import "ItemDetailVc.h"
#import "Global.h"

@interface ItemDetailVc ()
{
    NSMutableArray *aryBlockType,*aryItemBlock,*aryFilter;
    NSMutableArray *aryForStep,*aryOrderAphaSteps;
    int count;
    int likeCheck;
}
@end

@implementation ItemDetailVc


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*
     "cat_id" = 4;
     id = 4;
     */
    
    
    aryBlockType = [[NSMutableArray alloc]init];
    aryItemBlock = [[NSMutableArray alloc]init];
    aryFilter = [[NSMutableArray alloc]init];
    aryForStep = [[NSMutableArray alloc]init];
    aryOrderAphaSteps = [[NSMutableArray alloc]init];
    
    _tbl_Multiple_Layout.delegate = self;
    _tbl_Multiple_Layout.dataSource = self;
    
    _tbl_Multiple_Layout.estimatedRowHeight = UITableViewAutomaticDimension;
    _tbl_Multiple_Layout.rowHeight = UITableViewAutomaticDimension;
    
    [_tbl_Multiple_Layout registerNib:[UINib nibWithNibName:@"CellWithImage" bundle:nil] forCellReuseIdentifier:@"CellWithImage1"];
    
     [_tbl_Multiple_Layout registerNib:[UINib nibWithNibName:@"CellWithNote" bundle:nil] forCellReuseIdentifier:@"CellWithNote1"];
    
    _imgItemName.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",[_dic objectForKey:@"image_name"]]];
    
    _lbItemName.text = [_dic objectForKey:@"item_name"];
    
    NSLog(@"Dic=%@",_dic);
    
    aryBlockType = [DBOperation selectData:@"Select * from block_Type"];
    aryItemBlock = [DBOperation selectData:@"Select * from item_block ORDER BY block_index ASC"];
    
    
    NSLog(@"Item Type=%@",aryItemBlock);
    
    NSString *strMainItemID = [NSString stringWithFormat:@"%@",[_dic objectForKey:@"id"]];
    
    for(NSDictionary *dic in aryItemBlock)
    {
        NSString *strItemId = [NSString stringWithFormat:@"%@",[dic objectForKey:@"item_id"]];
        
        if ([strMainItemID isEqualToString:strItemId])
        {
            [aryFilter addObject:dic];
        }
    }
    // NSString *strCompare = [NSString stringWithFormat:@"%@",[[aryFilter objectAtIndex:indexPath.row]objectForKey:@"block_type"]];
    
    NSLog(@"Block type=%@",aryBlockType);
    NSLog(@"ary filter=%@",aryFilter);
    
    NSMutableDictionary *di;
  //  NSMutableDictionary *dic1 ;//= [[NSDictionary alloc]init];
    
    
    for (int i =0 ;i<aryFilter.count;i++)
    {
        di = [[aryFilter objectAtIndex:i]mutableCopy];
        
        NSString *strCompare = [NSString stringWithFormat:@"%@",[[aryFilter objectAtIndex:i]objectForKey:@"block_type"]];
        
        if ([strCompare isEqualToString:@"2"])
        {
            [di setObject:[NSString stringWithFormat:@"%d",count] forKey:@"Count"];
            [aryFilter replaceObjectAtIndex:i withObject:di];
             count++;
        }
        else
        {
        }
        
    }

    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    _tbl_Multiple_Layout.tableHeaderView = _viewHeader;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableview delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return aryFilter.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    NSString *strCompare = [NSString stringWithFormat:@"%@",[[aryFilter objectAtIndex:indexPath.row]objectForKey:@"block_type"]];
    
    if ([strCompare isEqualToString:@"0"])
    {
        //Ingredients
        
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"CellDrawTableLook"];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        NSString *strSplit = [NSString stringWithFormat:@"%@",[[aryFilter objectAtIndex:indexPath.row]objectForKey:@"detail"]];
        
        NSArray *arySplit = [strSplit componentsSeparatedByString:@"%"];
        
        UILabel *lb = (UILabel *)[cell.contentView viewWithTag:1];
        UILabel *lb1 = (UILabel *)[cell.contentView viewWithTag:2];
        
        if (arySplit.count == 1)
        {
            UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"TextDetailCell"];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            
            UILabel *lb = (UILabel *)[cell.contentView viewWithTag:1];
            lb.text = [[aryFilter objectAtIndex:indexPath.row]objectForKey:@"detail"];
            
            return cell;
        }
        else if (arySplit.count == 2)
        {
            lb.text = [NSString stringWithFormat:@"%@",[arySplit objectAtIndex:0]];
            lb1.text = [NSString stringWithFormat:@"%@",[arySplit objectAtIndex:1]];
        }
        else
        {
          
        }
        return cell;
    }
    else if ([strCompare isEqualToString:@"1"])
    {
        // Text
        
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"CellSimpleText"];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        UILabel *lb = (UILabel *)[cell.contentView viewWithTag:1];
        lb.text = [[aryFilter objectAtIndex:indexPath.row]objectForKey:@"detail"];
        
        return cell;
    }
    else if ([strCompare isEqualToString:@"2"])
    {
        // Step
        
        CellWithImage *cell = (CellWithImage *)[tableView dequeueReusableCellWithIdentifier:@"CellWithImage1"];
        
        if (cell == nil)
        {
            NSArray *xib = [[NSBundle mainBundle] loadNibNamed:@"CellWithImage" owner:self options:nil];
            cell = [xib objectAtIndex:0];
        }
    
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        NSString *strGetCount = [NSString stringWithFormat:@"%@",[[aryFilter objectAtIndex:indexPath.row]objectForKey:@"Count"]];
        
        if ([strGetCount isEqualToString:@"0"])
        {
            cell.lbIndex.text = [NSString stringWithFormat:@"%@",strGetCount];
            cell.lbDetail.text = [[aryFilter objectAtIndex:indexPath.row]objectForKey:@"detail"];
            
            [cell.lbDetailTop setConstant:5];
            [cell.lbStepHeight setConstant:31];
            
        }
        else
        {
            cell.lbIndex.text = [NSString stringWithFormat:@"%@",strGetCount];
            cell.lbDetail.text = [[aryFilter objectAtIndex:indexPath.row]objectForKey:@"detail"];
            
            [cell.lbDetailTop setConstant:5];
            [cell.lbStepHeight setConstant:0];
        }
        
        return cell;
    }
    else if ([strCompare isEqualToString:@"3"])
    {
        // Note

        CellWithNote *cell = (CellWithNote *)[tableView dequeueReusableCellWithIdentifier:@"CellWithNote1"];
        
        if (cell == nil)
        {
            NSArray *xib = [[NSBundle mainBundle] loadNibNamed:@"CellWithNote" owner:self options:nil];
            cell = [xib objectAtIndex:0];
        }
        
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        cell.lbDetail.text = [[aryFilter objectAtIndex:indexPath.row]objectForKey:@"detail"];
        
        float degree = (270*M_PI/180);
        
        cell.lbNoteRotate.transform = CGAffineTransformMakeRotation(degree);
        
        return cell;
    }
    
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

#pragma mark - textfield delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}

#pragma mark - button action

- (IBAction)btnShareClicked:(id)sender
{
    NSString *url=@"";
    NSMutableArray *sharingItems = [NSMutableArray new];
    
    if (url) {
        [sharingItems addObject:url];
    }
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:sharingItems applicationActivities:nil];
    [self presentViewController:activityController animated:YES completion:nil];
}

- (IBAction)btnLikeClicked:(id)sender
{
    if (likeCheck == 0)
    {
        [_imgLike setImage:[UIImage imageNamed:@"like_selected.png"]];
        likeCheck = 1;
    }
    else
    {
        [_imgLike setImage:[UIImage imageNamed:@"like.png"]];
        likeCheck = 0;
    }
}
- (IBAction)btnBAckClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)btnHomeClicked:(id)sender
{
    UIViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"HomeVC"];
    [self.navigationController pushViewController:vc animated:YES];
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
