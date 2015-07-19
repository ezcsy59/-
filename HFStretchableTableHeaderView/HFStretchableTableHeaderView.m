//
//  StretchableTableHeaderView.m
//  StretchableTableHeaderView
//

#import "HFStretchableTableHeaderView.h"

@interface HFStretchableTableHeaderView()
{
    CGRect initialFrame;
    CGFloat defaultViewHeight;
     CGFloat defaultViewW;
}
@end


@implementation HFStretchableTableHeaderView

@synthesize tableView = _tableView;
@synthesize view = _view;

//- (void)stretchHeaderForTableView:(UITableView*)tableView withView:(UIView*)view btn:(UIButton *)btn
//{
//    _tableView = tableView;
//    _view = view;
//    _btn=btn;
//    
//    initialFrame       = _view.frame;
//    defaultViewHeight  = initialFrame.size.height;
//    defaultViewW=initialFrame.size.width;
//    UIView* emptyTableHeaderView = [[UIView alloc] initWithFrame:initialFrame];
//    emptyTableHeaderView.contentMode = UIViewContentModeScaleAspectFill;
//    _tableView.tableHeaderView = emptyTableHeaderView;
//    
//    [_tableView addSubview:_view];
//}
//
//- (void)scrollViewDidScroll:(UIScrollView*)scrollView
//{
//    CGRect f = _view.frame;
//    f.size.width = _tableView.frame.size.width;
//    _view.frame = f;
//    NSLog(@"%f",scrollView.contentOffset.y);
//    if(scrollView.contentOffset.y>defaultViewHeight-64+5)
//    {
//        
//    }
//    
//    
//    
//    
//    
//    
// //   NSLog(@"按钮%f",_btn.bounds.origin.y);
//   // if(scrollView.contentOffset.y < 0) {
//        CGFloat offsetY = (scrollView.contentOffset.y + scrollView.contentInset.top) * -1;
//        initialFrame.origin.y = offsetY * -1;
//        initialFrame.size.height = defaultViewHeight + offsetY;
//        
//     
//        initialFrame.origin.x=64+scrollView.contentOffset.y;
//        if(initialFrame.origin.x>0)
//            initialFrame.origin.x=0;
//     
//        
//        initialFrame.size.width=defaultViewW+(64+scrollView.contentOffset.y)*(-2);
//           if(initialFrame.size.width<defaultViewW)
//               initialFrame.size.width=defaultViewW;
//        
//        _view.frame = initialFrame;
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
//}
//
//- (void)resizeView
//{
//    initialFrame.size.width = _tableView.frame.size.width;
//    _view.frame = initialFrame;
//}


@end
