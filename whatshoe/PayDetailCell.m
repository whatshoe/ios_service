//
//  PayDetailCell.m
//  whatshoe
//
//  Created by comso on 2016. 1. 27..
//  Copyright © 2016년 whatshoe. All rights reserved.
//

#import "PayDetailCell.h"

@implementation PayDetailCell
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
        
        
        self.contentView.frame = CGRectMake(self.contentView.frame.origin.x*xR, self.contentView.frame.origin.y*yR, self.contentView.frame.size.width*xR, self.contentView.frame.size.height*yR);
        float fontSize13 = 13*yR;

        _categoryImage.frame = CGRectMake(_categoryImage.frame.origin.x*xR, _categoryImage.frame.origin.y*yR, _categoryImage.frame.size.width*xR, _categoryImage.frame.size.height*yR);
        _titleLabel.frame = CGRectMake(_titleLabel.frame.origin.x*xR, _titleLabel.frame.origin.y*yR, _titleLabel.frame.size.width*xR, _titleLabel.frame.size.height*yR);
        [_titleLabel setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
        _priceLabel.frame = CGRectMake(_priceLabel.frame.origin.x*xR, _priceLabel.frame.origin.y*yR, _priceLabel.frame.size.width*xR, _priceLabel.frame.size.height*yR);
        [_priceLabel setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
        
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
