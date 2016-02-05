//
//  OrderCell.h
//  whatshoe
//
//  Created by comso on 2016. 1. 2..
//  Copyright © 2016년 whatshoe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *topView;
//@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

//@property (weak, nonatomic) IBOutlet UIImageView *beforeImage;
//@property (weak, nonatomic) IBOutlet UIImageView *afterImage;
//@property (weak, nonatomic) IBOutlet UILabel *adviseLabel;
//@property (weak, nonatomic) IBOutlet UIButton *beforeButton;
//@property (weak, nonatomic) IBOutlet UIButton *afterButton;

@end
