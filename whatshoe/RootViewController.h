//
//  RootViewController.h
//  whatshoe
//
//  Created by whatshoe on 2015. 11. 13..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCSlidingViewController.h"

@interface RootViewController : SCSlidingViewController

@property(nonatomic,retain)NSMutableArray *serviceArray;
@property (nonatomic) int serviceTotalPrice;
@end
