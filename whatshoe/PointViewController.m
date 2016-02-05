//
//  PointViewController.m
//  whatshoe
//
//  Created by whatshoe on 2015. 11. 13..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import "PointViewController.h"

@interface PointViewController ()
@property (strong, nonatomic) IBOutlet UIView *mainView;

@property (weak, nonatomic) IBOutlet UILabel *navigationBar;
@property (weak, nonatomic) IBOutlet UIButton *barButton;
@property (weak, nonatomic) IBOutlet UILabel *barLabel;

@property (weak, nonatomic) IBOutlet UIView *pointView;
@property (weak, nonatomic) IBOutlet UILabel *pointNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *pointLabel;

@property (weak, nonatomic) IBOutlet UIView *listView;
@property (weak, nonatomic) IBOutlet UIImageView *horseImage;
@property (weak, nonatomic) IBOutlet UILabel *listLabel;

@end

@implementation PointViewController

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
    _pointView.frame = CGRectMake(_pointView.frame.origin.x*xR, _pointView.frame.origin.y*yR, _pointView.frame.size.width*xR, _pointView.frame.size.height*yR);

    _listView.frame = CGRectMake(_listView.frame.origin.x*xR, _listView.frame.origin.y*yR, _listView.frame.size.width*xR, _listView.frame.size.height*yR);
    _horseImage.frame = CGRectMake(_horseImage.frame.origin.x*xR, _horseImage.frame.origin.y*yR, _horseImage.frame.size.width*xR, _horseImage.frame.size.height*yR);
    
    /////+font/////
    

    float fontSize14 = 14*yR;
    float fontSize18 = 18*yR;
    float fontSize41 = 41*yR;
    
    _barLabel.frame = CGRectMake(_barLabel.frame.origin.x*xR, _barLabel.frame.origin.y*yR, _barLabel.frame.size.width*xR, _barLabel.frame.size.height*yR);
    [_barLabel setFont:[UIFont fontWithName:@"System Font Heavy" size:fontSize18]];
    
    _pointNameLabel.frame = CGRectMake(_pointNameLabel.frame.origin.x*xR, _pointNameLabel.frame.origin.y*yR, _pointNameLabel.frame.size.width*xR, _pointNameLabel.frame.size.height*yR);
    [_pointNameLabel setFont:[UIFont fontWithName:@"System Font Bold" size:fontSize14]];
    
    _pointLabel.frame = CGRectMake(_pointLabel.frame.origin.x*xR, _pointLabel.frame.origin.y*yR, _pointLabel.frame.size.width*xR, _pointLabel.frame.size.height*yR);
    [_pointLabel setFont:[UIFont fontWithName:@"System Font" size:fontSize41]];
    
    _listLabel.frame = CGRectMake(_listLabel.frame.origin.x*xR, _listLabel.frame.origin.y*yR, _listLabel.frame.size.width*xR, _listLabel.frame.size.height*yR);
    [_listLabel setFont:[UIFont fontWithName:@"System Font Bold" size:fontSize14]];
    

}

 


- (IBAction)cancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
