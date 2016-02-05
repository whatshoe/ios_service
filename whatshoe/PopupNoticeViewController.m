//
//  PopupNoticeViewController.m
//  whatshoe
//
//  Created by comso on 2016. 1. 18..
//  Copyright © 2016년 whatshoe. All rights reserved.
//

#import "PopupNoticeViewController.h"

@interface PopupNoticeViewController ()
{
    int totalPopupcount;
    int currentPopup;
}
@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UIView *popupBoxView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;

@end

@implementation PopupNoticeViewController
@synthesize imageNum;

- (void)viewDidLoad {
    [super viewDidLoad];
    totalPopupcount = imageNum;
    currentPopup = 1;
    NSString *urlString = @"http://whatshoe.co.kr/mobile_main_popup/";
    NSString *tempString = [NSString stringWithFormat:@"popup_%d.png",currentPopup];
    urlString = [urlString stringByAppendingString:tempString];
    NSURL *url = [NSURL URLWithString:urlString];
    [self loadImageFromURL:url imageView:_imageView];
    
    [self.activityIndicatorView layer].zPosition = 1;
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
    _backgroundImage.frame = CGRectMake(_backgroundImage.frame.origin.x*xR, _backgroundImage.frame.origin.y*yR, _backgroundImage.frame.size.width*xR, _backgroundImage.frame.size.height*yR);
    _popupBoxView.frame = CGRectMake(_popupBoxView.frame.origin.x*xR, _popupBoxView.frame.origin.y*yR, _popupBoxView.frame.size.width*xR, _popupBoxView.frame.size.height*yR);
    _imageView.frame = CGRectMake(_imageView.frame.origin.x*xR, _imageView.frame.origin.y*yR, _imageView.frame.size.width*xR, _imageView.frame.size.height*yR);
    _cancelButton.frame = CGRectMake(_cancelButton.frame.origin.x*xR, _cancelButton.frame.origin.y*yR, _cancelButton.frame.size.width*xR, _cancelButton.frame.size.height*yR);
    _activityIndicatorView.frame = CGRectMake(_activityIndicatorView.frame.origin.x*xR, _activityIndicatorView.frame.origin.y*yR, _activityIndicatorView.frame.size.width*xR, _activityIndicatorView.frame.size.height*yR);

    
    
    
    
}

- (IBAction)cancelButton:(UIButton *)sender {
    if(currentPopup != totalPopupcount)
    {
        currentPopup += 1;
        NSString *urlString = @"http://whatshoe.co.kr/mobile_main_popup/popup_";
        NSString *tempString = [NSString stringWithFormat:@"%d.png",currentPopup];
        urlString = [urlString stringByAppendingString:tempString];
        NSURL *url = [NSURL URLWithString:urlString];
        [self loadImageFromURL:url imageView:_imageView];
    }
    else
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}

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
