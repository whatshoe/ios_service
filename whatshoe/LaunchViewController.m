//
//  LaunchViewController.m
//  whatshoe
//
//  Created by whatshoe on 2015. 12. 5..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import "LaunchViewController.h"

@interface LaunchViewController ()
@property (strong, nonatomic) IBOutlet UIView *startView;
@property (weak, nonatomic) IBOutlet UIImageView *startImage;

@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:NO];
    float xR = [[NSUserDefaults standardUserDefaults] floatForKey:@"xRatio"];
    float yR = [[NSUserDefaults standardUserDefaults] floatForKey:@"yRatio"];
    
    
    
    
    //////////////////////////컨포넌트 재설정/////////////////////////////////
    _startImage.frame = CGRectMake(_startImage.frame.origin.x*xR, _startImage.frame.origin.y*yR, _startImage.frame.size.width*xR, _startImage.frame.size.height*yR);
    _startView.frame = CGRectMake(_startView.frame.origin.x*xR, _startView.frame.origin.y*yR, _startView.frame.size.width*xR, _startView.frame.size.height*yR);
}

@end
