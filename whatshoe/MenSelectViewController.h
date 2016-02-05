//
//  MenSelectViewController.h
//  whatshoe
//
//  Created by whatshoe on 2015. 11. 1..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenSelectViewController : UIViewController

@property(nonatomic,retain)NSMutableArray *serviceArray;
@property (nonatomic) int serviceTotalPrice;


- (void)selectedButtonColorEffect:(int)tab;
- (void)normalPremiumColorEffect:(int)tab;
- (void)loadShoeServiceSelect:(NSMutableArray *)shoe_codeArray;
- (void)contentsDissmissColorEffect:(UIView *)tempView;
- (void)contentsSelectColorEffect:(UIView *)tempView;
- (int)tapArrayTotolPrice:(NSMutableArray *)shoe_codeArray;
- (void)clearContentsSelectedColor;
- (NSString *)calculate:(NSString *)string over:(int)price;
@end
