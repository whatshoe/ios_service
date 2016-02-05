//
//  PayWebViewController.h
//  whatshoe
//
//  Created by comso on 2015. 11. 14..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayWebViewController : UIViewController


@property (nonatomic,retain) NSString *segueData_2;
@property (nonatomic,retain) NSString *segueData_3;
@property (nonatomic,retain) NSString *payTitle;
@property (nonatomic,retain) NSString *loginId;
@property (nonatomic,retain) NSString *payUrl;
@property (nonatomic,retain) NSString *order_time;
@property (nonatomic,retain) NSMutableArray *serviceArray;
@property (nonatomic) int serviceTotalPrice;
@end
