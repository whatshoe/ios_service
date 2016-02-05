//
//  EventDetailViewController.m
//  whatshoe
//
//  Created by comso on 2016. 1. 19..
//  Copyright © 2016년 whatshoe. All rights reserved.
//

#import "EventDetailViewController.h"

@interface EventDetailViewController ()
@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UILabel *navigationBar;
@property (weak, nonatomic) IBOutlet UIButton *barButton;
@property (weak, nonatomic) IBOutlet UILabel *barLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;


@end

@implementation EventDetailViewController
@synthesize imageTitle;
@synthesize imageUrl;

- (void)viewDidLoad {
    [super viewDidLoad];
//    _barLabel.text = imageTitle;
    
    NSURL *url = [NSURL URLWithString:imageUrl];
    [self loadImageFromURL:url imageView:_imageView];
    
    [self.activityIndicatorView layer].zPosition = 1;
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
    _activityIndicatorView.frame = CGRectMake(_activityIndicatorView.frame.origin.x*xR, _activityIndicatorView.frame.origin.y*yR, _activityIndicatorView.frame.size.width*xR, _activityIndicatorView.frame.size.height*yR);
    _imageView.frame = CGRectMake(_imageView.frame.origin.x*xR, _imageView.frame.origin.y*yR, _imageView.frame.size.width*xR, _imageView.frame.size.height*yR);
    
    /////+font/////
    float fontSize18 = 18*yR;
    
    
    _barLabel.frame = CGRectMake(_barLabel.frame.origin.x*xR, _barLabel.frame.origin.y*yR, _barLabel.frame.size.width*xR, _barLabel.frame.size.height*yR);
    [_barLabel setFont:[UIFont fontWithName:@"System Font Heavy" size:fontSize18]];
    
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
-(void)loadImageFromURL:(NSURL*)url imageView:(UIImageView*)imageView
{
    [self.activityIndicatorView startAnimating];
    dispatch_async( dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0 ), ^(void)
                   {
                       NSData * data = [[NSData alloc] initWithContentsOfURL:url];
                       UIImage * image = [[UIImage alloc] initWithData:data];
                       dispatch_async( dispatch_get_main_queue(), ^(void)
                                      {
                                          [self.activityIndicatorView stopAnimating];
                                          if( image != nil )
                                          {
                                              imageView.image = image;
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
