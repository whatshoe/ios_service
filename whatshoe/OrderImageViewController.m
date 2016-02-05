//
//  OrderImageViewController.m
//  whatshoe
//
//  Created by comso on 2016. 1. 4..
//  Copyright © 2016년 whatshoe. All rights reserved.
//

#import "OrderImageViewController.h"

@interface OrderImageViewController () <UIScrollViewDelegate>
{
    NSString *urlString;
}
@property (weak, nonatomic) IBOutlet UIImageView *orderImage;
@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIView *modalView;
@property (weak, nonatomic) IBOutlet UIScrollView *imageScrollView;
@property (weak, nonatomic) IBOutlet UILabel *navigationBar;
@property (weak, nonatomic) IBOutlet UIButton *barButton;
@property (weak, nonatomic) IBOutlet UILabel *barLabel;
@end

@implementation OrderImageViewController
@synthesize segueData_1;
@synthesize segueData_2;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    urlString = segueData_1;
    _barLabel.text = segueData_2;
    urlString = @"http://whatshoe.co.kr/whatshoe/img/member_p01.jpg";
    NSURL *url = [NSURL URLWithString:urlString];
    [self loadImageFromURL:url];
    

}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:NO];
    float xR = [[NSUserDefaults standardUserDefaults] floatForKey:@"xRatio"];
    float yR = [[NSUserDefaults standardUserDefaults] floatForKey:@"yRatio"];
    
    
    //////////////////////////컨포넌트 재설정/////////////////////////////////
    _mainView.frame = CGRectMake(_mainView.frame.origin.x*xR, _mainView.frame.origin.y*yR, _mainView.frame.size.width*xR, _mainView.frame.size.height*yR);
    _modalView.frame = CGRectMake(_modalView.frame.origin.x*xR, _modalView.frame.origin.y*yR, _modalView.frame.size.width*xR, _modalView.frame.size.height*yR);
    _orderImage.frame = CGRectMake(_orderImage.frame.origin.x*xR, _orderImage.frame.origin.y*yR, _orderImage.frame.size.width*xR, _orderImage.frame.size.height*yR);
    _imageScrollView.frame = CGRectMake(_imageScrollView.frame.origin.x*xR, _imageScrollView.frame.origin.y*yR, _imageScrollView.frame.size.width*xR, _imageScrollView.frame.size.height*yR);
    _navigationBar.frame = CGRectMake(_navigationBar.frame.origin.x*xR, _navigationBar.frame.origin.y*yR, _navigationBar.frame.size.width*xR, _navigationBar.frame.size.height*yR);
    _barButton.frame = CGRectMake(_barButton.frame.origin.x*xR, _barButton.frame.origin.y*yR, _barButton.frame.size.width*xR, _barButton.frame.size.height*yR);
    _imageScrollView.delegate = self;
    _imageScrollView.contentSize = _orderImage.image.size;
    _imageScrollView.maximumZoomScale=6.0;
    
    /////+font/////
    //float fontSize13 = 13*yR;
    float fontSize18 = 18*yR;
    
    
    _barLabel.frame = CGRectMake(_barLabel.frame.origin.x*xR, _barLabel.frame.origin.y*yR, _barLabel.frame.size.width*xR, _barLabel.frame.size.height*yR);
    [_barLabel setFont:[UIFont fontWithName:@"System Font Heavy" size:fontSize18]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    // return which subview we want to zoom
    return _orderImage;
}

- (IBAction)cancelButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)loadImageFromURL:(NSURL*)url
{
    dispatch_async( dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0 ), ^(void)
                   {
                       NSData * data = [[NSData alloc] initWithContentsOfURL:url];
                       UIImage * image = [[UIImage alloc] initWithData:data];
                       dispatch_async( dispatch_get_main_queue(), ^(void)
                       {
                           if( image != nil )
                           {
                               _orderImage.image = image;
                           } else {
                               UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"알림"
                                                                              message:@"이미지를 불러오는데 실패했습니다.\n인터넷 연결상태를 확인해주세요."
                                                                             delegate:self
                                                                    cancelButtonTitle:nil
                                                                    otherButtonTitles:@"확인", nil];
                               [alert show];
                           }
                       });
                   });
}


@end
