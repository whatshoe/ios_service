//
//  CouponViewController.m
//  whatshoe
//
//  Created by whatshoe on 2015. 11. 14..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import "CouponViewController.h"

@interface CouponViewController ()
@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UILabel *navigationBar;
@property (weak, nonatomic) IBOutlet UIButton *barButton;
@property (weak, nonatomic) IBOutlet UILabel *barLabel;
@property (weak, nonatomic) IBOutlet UIImageView *horse2Image;

@property (weak, nonatomic) IBOutlet UIView *couponView;
@property (weak, nonatomic) IBOutlet UIImageView *couponImage;
@property (weak, nonatomic) IBOutlet UIButton *couponButton;
@property (weak, nonatomic) IBOutlet UILabel *couponLabel;

@end

@implementation CouponViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:NO];
    float xR = [[NSUserDefaults standardUserDefaults] floatForKey:@"xRatio"];
    float yR = [[NSUserDefaults standardUserDefaults] floatForKey:@"yRatio"];
    
    
    
    //////////////////////////컨포넌트 재설정/////////////////////////////////
    _mainView.frame = CGRectMake(_mainView.frame.origin.x*xR, _mainView.frame.origin.y*yR, _mainView.frame.size.width*xR, _mainView.frame.size.height*yR);
    _navigationBar.frame = CGRectMake(_navigationBar.frame.origin.x*xR, _navigationBar.frame.origin.y*yR, _navigationBar.frame.size.width*xR, _navigationBar.frame.size.height*yR);
    _barButton.frame = CGRectMake(_barButton.frame.origin.x*xR, _barButton.frame.origin.y*yR, _barButton.frame.size.width*xR, _barButton.frame.size.height*yR);
    _horse2Image.frame = CGRectMake(_horse2Image.frame.origin.x*xR, _horse2Image.frame.origin.y*yR, _horse2Image.frame.size.width*xR, _horse2Image.frame.size.height*yR);
    _couponView.frame = CGRectMake(_couponView.frame.origin.x*xR, _couponView.frame.origin.y*yR, _couponView.frame.size.width*xR, _couponView.frame.size.height*yR);
    
    _couponImage.frame = CGRectMake(_couponImage.frame.origin.x*xR, _couponImage.frame.origin.y*yR, _couponImage.frame.size.width*xR, _couponImage.frame.size.height*yR);
    _couponButton.frame = CGRectMake(_couponButton.frame.origin.x*xR, _couponButton.frame.origin.y*yR, _couponButton.frame.size.width*xR, _couponButton.frame.size.height*yR);
    
    /////+font/////
    
    
    float fontSize14 = 14*yR;
    float fontSize18 = 18*yR;

    
    _barLabel.frame = CGRectMake(_barLabel.frame.origin.x*xR, _barLabel.frame.origin.y*yR, _barLabel.frame.size.width*xR, _barLabel.frame.size.height*yR);
    [_barLabel setFont:[UIFont fontWithName:@"System Font Heavy" size:fontSize18]];
    
    _couponLabel.frame = CGRectMake(_couponLabel.frame.origin.x*xR, _couponLabel.frame.origin.y*yR, _couponLabel.frame.size.width*xR, _couponLabel.frame.size.height*yR);
    [_couponLabel setFont:[UIFont fontWithName:@"System Font" size:fontSize14]];
    
}


- (IBAction)cancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
