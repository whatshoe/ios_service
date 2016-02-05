//
//  OrderCell.m
//  whatshoe
//
//  Created by comso on 2016. 1. 2..
//  Copyright © 2016년 whatshoe. All rights reserved.
//

#import "OrderCell.h"
@implementation OrderCell
{
    BOOL isViewWillAppear;
}

- (void)awakeFromNib {
    // Initialization code
}
- (void)layoutSubviews
{
    if(!isViewWillAppear)
    {
        isViewWillAppear = true;
        [super layoutSubviews];
        float xR = [[NSUserDefaults standardUserDefaults] floatForKey:@"xRatio"];
        float yR = [[NSUserDefaults standardUserDefaults] floatForKey:@"yRatio"];
        
        _topView.frame = CGRectMake(_topView.frame.origin.x*xR, _topView.frame.origin.y*yR, _topView.frame.size.width*xR, _topView.frame.size.height*yR);
//        _bottomView.frame = CGRectMake(_bottomView.frame.origin.x*xR, _bottomView.frame.origin.y*yR, _bottomView.frame.size.width*xR, _bottomView.frame.size.height*yR);
//        
//        _beforeImage.frame = CGRectMake(_beforeImage.frame.origin.x*xR, _beforeImage.frame.origin.y*yR, _beforeImage.frame.size.width*xR, _beforeImage.frame.size.height*yR);
//        _afterImage.frame = CGRectMake(_afterImage.frame.origin.x*xR, _afterImage.frame.origin.y*yR, _afterImage.frame.size.width*xR, _afterImage.frame.size.height*yR);
//        _beforeButton.frame = CGRectMake(_beforeButton.frame.origin.x*xR, _beforeButton.frame.origin.y*yR, _beforeButton.frame.size.width*xR, _beforeButton.frame.size.height*yR);
//        _afterButton.frame = CGRectMake(_afterButton.frame.origin.x*xR, _afterButton.frame.origin.y*yR, _afterButton.frame.size.width*xR, _afterButton.frame.size.height*yR);
        
        float fontSize15 = 15*yR;
        
        _titleLabel.frame = CGRectMake(_titleLabel.frame.origin.x*xR, _titleLabel.frame.origin.y*yR, _titleLabel.frame.size.width*xR, _titleLabel.frame.size.height*yR);
        [_titleLabel setFont:[UIFont fontWithName:@"System Font Heavy" size:fontSize15]];
        _addressLabel.frame = CGRectMake(_addressLabel.frame.origin.x*xR, _addressLabel.frame.origin.y*yR, _addressLabel.frame.size.width*xR, _addressLabel.frame.size.height*yR);
        [_addressLabel setFont:[UIFont fontWithName:@"System Font" size:fontSize15]];
        _timeLabel.frame = CGRectMake(_timeLabel.frame.origin.x*xR, _timeLabel.frame.origin.y*yR, _timeLabel.frame.size.width*xR, _timeLabel.frame.size.height*yR);
        [_timeLabel setFont:[UIFont fontWithName:@"System Font" size:fontSize15]];
//        _adviseLabel.frame = CGRectMake(_adviseLabel.frame.origin.x*xR, _adviseLabel.frame.origin.y*yR, _adviseLabel.frame.size.width*xR, _adviseLabel.frame.size.height*yR);
//        [_adviseLabel setFont:[UIFont fontWithName:@"System Font" size:fontSize15]];

    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
