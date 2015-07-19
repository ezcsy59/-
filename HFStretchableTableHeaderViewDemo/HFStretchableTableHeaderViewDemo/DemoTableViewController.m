//
//  ImageTableViewController.m
//  StretchableTableHeaderViewDemo
//
//  Created by Hendrik Frahmann on 10.05.14.
//  Copyright (c) 2014 Hendrik Frahmann. All rights reserved.
//

#import "DemoTableViewController.h"
@interface DemoTableViewController()
{
    CGRect initialFrame;
    CGFloat defaultViewHeight;
    CGFloat defaultViewW;
}
@end

@implementation DemoTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    _btntop=[UIButton buttonWithType:UIButtonTypeCustom];
    _btntop.frame=CGRectMake(200, 64, 40, 40);
    _btntop.backgroundColor=[UIColor redColor];
    _btntop.hidden=NO;
    self.navigationController.view.clipsToBounds=NO;
    self.navigationController.navigationBar.alpha=0.5;
    
    [self.navigationController.view addSubview:_btntop];
    
    
    
    initialFrame       = CGRectMake(0, 0, 320, 300);
    defaultViewHeight  = initialFrame.size.height;
    defaultViewW=initialFrame.size.width;
    UIView* emptyTableHeaderView = [[UIView alloc] initWithFrame:initialFrame];
    
    emptyTableHeaderView.contentMode = UIViewContentModeScaleAspectFill;
    self.tableView.tableHeaderView = emptyTableHeaderView;
    
    [self.tableView addSubview:_stretchView];
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    [_stretchableTableHeaderView scrollViewDidScroll:scrollView];
//}

//- (void)viewDidLayoutSubviews
//{
//   // [_stretchableTableHeaderView resizeView];
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellReuseIdentifier   = @"SectionTwoCell";
    NSString *windowReuseIdentifier = @"SectionOneCell";
    
    UITableViewCell *cell = nil;
    
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:windowReuseIdentifier];
        if (!cell) {
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:windowReuseIdentifier];
        }
    }
    //    else {
    //        cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier];
    //        if (!cell) {
    //            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellReuseIdentifier];
    //            cell.contentView.backgroundColor = [UIColor lightGrayColor];
    //
    //
    //        }
    //        cell.textLabel.text = [ NSString stringWithFormat:@"cell %i",indexPath.row];
    //    }
    cell.textLabel.text = [ NSString stringWithFormat:@"cell %i",indexPath.row];
    if(indexPath.row==0)
    {
    _btn=[UIButton buttonWithType:UIButtonTypeCustom];
    _btn.frame=CGRectMake(200, 5, 40, 40);
        _btn.backgroundColor=[UIColor redColor];
    [cell addSubview:_btn];

        
        


        
    }
    cell.selectionStyle= UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* customView =[[UIView alloc]init];
    customView.frame=CGRectZero;
    
//    UILabel * headerLabel = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
//    headerLabel.backgroundColor = [UIColor clearColor];
//    headerLabel.opaque = NO;
//    headerLabel.textColor = [UIColor lightGrayColor];
//    headerLabel.highlightedTextColor = [UIColor whiteColor];
//    headerLabel.font = [UIFont boldSystemFontOfSize:18];
//    headerLabel.frame = CGRectMake(10.0, 0.0, 300.0, 44.0);
//    
//    if (section == 0) {
//        headerLabel.text =  @"测试1";
//    }else if (section == 1){
//        headerLabel.text = @"测试2";
//    }else if (section == 2){
//        headerLabel.text = @"测试3";
//    }else if (section == 3){
//        headerLabel.text = @"测试4";
//    }
//    
//    [customView addSubview:headerLabel];
    
    return customView;
}




- (void)scrollViewDidScroll:(UIScrollView*)scrollView
{
    CGRect f = _stretchView.frame;
    f.size.width =self.tableView.frame.size.width;
    _stretchView.frame = f;
    NSLog(@"%f",scrollView.contentOffset.y);
    if(scrollView.contentOffset.y>defaultViewHeight-64+6)
    {
        _btntop.hidden=NO;
        _btntop.frame=CGRectMake(200,64-( scrollView.contentOffset.y-(defaultViewHeight-64+6)), 40, 40);
        
        if(64-( scrollView.contentOffset.y-(defaultViewHeight-64+6))<20){
            _btntop.frame=CGRectMake(200,20, 40, 40);
   
        }
        
    }else {
        
        _btntop.hidden=YES;
    }

    //   NSLog(@"按钮%f",_btn.bounds.origin.y);
    // if(scrollView.contentOffset.y < 0) {
    CGFloat offsetY = (scrollView.contentOffset.y + scrollView.contentInset.top) * -1;
    initialFrame.origin.y = offsetY * -1;
    initialFrame.size.height = defaultViewHeight + offsetY;
    
    
    initialFrame.origin.x=64+scrollView.contentOffset.y;
    if(initialFrame.origin.x>0)
        initialFrame.origin.x=0;
    
    
    initialFrame.size.width=defaultViewW+(64+scrollView.contentOffset.y)*(-2);
    if(initialFrame.size.width<defaultViewW)
        initialFrame.size.width=defaultViewW;
    
    _stretchView.frame = initialFrame;
    //  }
    //  CGFloat offsetY = (scrollView.contentOffset.y + scrollView.contentInset.top) * -1;
    
    //    CGFloat ImageHeight  = _view.frame.size.height;
    //    CGFloat ImageWidth  = _view.frame.size.width;
    //    CGFloat yOffset=(scrollView.contentOffset.y + scrollView.contentInset.top) * -1;
    //    if (scrollView.contentOffset.y < 0) {
    //
    //        CGFloat factor = ((ABS(yOffset)+ImageHeight)*ImageWidth)/ImageHeight;
    //        CGRect f = CGRectMake(-(factor-ImageWidth)/2, 0, factor, ImageHeight+ABS(yOffset));
    //       _view.frame = f;
    //    } else {
    //        CGRect f =_view.frame;
    //        f.origin.y = -yOffset;
    //        _view.frame = f;
    //    }
}

@end
