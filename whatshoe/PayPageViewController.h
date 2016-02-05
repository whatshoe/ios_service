//
//  PayPageViewController.h
//  whatshoe
//
//  Created by comso on 2015. 11. 7..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayPageViewController : UIViewController

@property (nonatomic,retain) NSString *segueData_2;
@property (nonatomic,retain) NSString *segueData_3;
@property (nonatomic,retain) NSMutableArray *serviceArray;
@property (nonatomic) int serviceTotalPrice;

@end
