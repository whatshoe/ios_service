//
//  ShoeSizeImageViewController.m
//  whatshoe
//
//  Created by comso on 2016. 1. 19..
//  Copyright © 2016년 whatshoe. All rights reserved.
//

#import "ShoeSizeImageViewController.h"

@interface ShoeSizeImageViewController () <UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UILabel *navigationBar;
@property (weak, nonatomic) IBOutlet UIButton *barButton;
@property (weak, nonatomic) IBOutlet UILabel *barLabel;
@property (weak, nonatomic) IBOutlet UIImageView *sizeImageView;
@property (weak, nonatomic) IBOutlet UIScrollView *imageScrollView;

@end

@implementation ShoeSizeImageViewController

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
    _sizeImageView.frame = CGRectMake(_sizeImageView.frame.origin.x*xR, _sizeImageView.frame.origin.y*yR, _sizeImageView.frame.size.width*xR, _sizeImageView.frame.size.height*yR);
    _imageScrollView.frame = CGRectMake(_imageScrollView.frame.origin.x*xR, _imageScrollView.frame.origin.y*yR, _imageScrollView.frame.size.width*xR, _imageScrollView.frame.size.height*yR);
    
    _imageScrollView.delegate = self;
    _imageScrollView.maximumZoomScale=6.0;
    _imageScrollView.showsVerticalScrollIndicator=YES;

    _imageScrollView.contentSize = CGSizeMake(_imageScrollView.frame.size.width, _sizeImageView.frame.size.height);

    float fontSize18 = 18*yR;
    
    _barLabel.frame = CGRectMake(_barLabel.frame.origin.x*xR, _barLabel.frame.origin.y*yR, _barLabel.frame.size.width*xR, _barLabel.frame.size.height*yR);
    [_barLabel setFont:[UIFont fontWithName:@"System Font Heavy" size:fontSize18]];
    
    
}
-(UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    // return which subview we want to zoom
    return _sizeImageView;
}
- (IBAction)cancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
