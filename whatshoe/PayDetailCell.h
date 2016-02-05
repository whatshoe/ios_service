//
//  PayDetailCell.h
//  whatshoe
//
//  Created by comso on 2016. 1. 27..
//  Copyright © 2016년 whatshoe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayDetailCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *categoryImage;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end
