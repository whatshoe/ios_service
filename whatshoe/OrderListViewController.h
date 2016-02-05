//
//  OrderListViewController.h
//  whatshoe
//
//  Created by comso on 2015. 11. 19..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface OrderListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *orderArray,*timeArray,*priceArray;
}
//@property (weak, nonatomic) IBOutlet UITableView *tableViewObject;

@end
