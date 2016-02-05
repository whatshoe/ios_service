//
//  ServiceViewController.m
//  whatshoe
//
//  Created by whatshoe on 2015. 11. 1..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import "AppDelegate.h"
#import "ServiceViewController.h"
#import "MyshoeViewController.h"
#import "WomenSelectViewController.h"
#import "MenSelectViewController.h"
#import "BagSelectViewController.h"
#import "BeltSelectViewController.h"
#import "WalletSelectViewController.h"
#import "EtcSelectViewController.h"
#import "RootViewController.h"
#import "HttpPostManager.h"
#import "MapViewController.h"
#import "SelectCode.h"
#import "PopupNoticeViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ServiceViewController ()
{
    Boolean isSelectMan;
    Boolean isSelectWoman;
    Boolean isSelectBag;
    Boolean isSelectBelt;
    Boolean isSelectWallet;
    Boolean isSelectEtc;
    Boolean isSelectGift;
    Boolean isSelectMyshoe;
    
    bool isMapButon;
    bool myshoe_alarm;
    int order_payMethod;
    NSString *order_id;
    NSString *order_time;
    NSString *order_state;
    NSString *order_code;
    NSString *order_name;
    bool isSlideButton;
    
    bool isViewWillAppear;
    
    bool isPicOpenClose;
    bool isPicButton;
}
@property (weak, nonatomic) IBOutlet UIButton *rightBtnOutlet;
@property (weak, nonatomic) IBOutlet UIButton *leftBtnOutlet;
@property (weak, nonatomic) IBOutlet UIImageView *main_titleOutlet;
@property (weak, nonatomic) IBOutlet UILabel *navigationBarOutlet;
@property (strong, nonatomic) IBOutlet UIView *ViewOutlet;


@property (weak, nonatomic) IBOutlet UIView *downViewOutlet;
@property (weak, nonatomic) IBOutlet UILabel *title00Label_Outlet;
@property (weak, nonatomic) IBOutlet UILabel *title01Label_Outlet;



@property (weak, nonatomic) IBOutlet UIButton *btn01_Outlet;
@property (weak, nonatomic) IBOutlet UIButton *btn02_Outlet;
@property (weak, nonatomic) IBOutlet UIButton *btn03_Outlet;
@property (weak, nonatomic) IBOutlet UIButton *btn04_Outlet;
@property (weak, nonatomic) IBOutlet UIButton *btn05_Outlet;
@property (weak, nonatomic) IBOutlet UIButton *btn06_Outlet;


@property (weak, nonatomic) IBOutlet UIView *alarmView;
@property (weak, nonatomic) IBOutlet UIImageView *alarmImage;
@property (weak, nonatomic) IBOutlet UILabel *alarmLabel;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIView *hiddenMapView;
@property (weak, nonatomic) IBOutlet UIButton *mapButton;
@property (weak, nonatomic) IBOutlet UIImageView *mapButtonImage;

@property (weak, nonatomic) IBOutlet UIView *hiddenView;
@property (weak, nonatomic) IBOutlet UIView *middleView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UILabel *mapTotalLabel;


@property (weak, nonatomic) IBOutlet UIButton *map_woman;
@property (weak, nonatomic) IBOutlet UIButton *map_belt;
@property (weak, nonatomic) IBOutlet UIButton *map_etc;
@property (weak, nonatomic) IBOutlet UIButton *map_man;
@property (weak, nonatomic) IBOutlet UIButton *map_bag;
@property (weak, nonatomic) IBOutlet UIButton *map_wellet;
@property (weak, nonatomic) IBOutlet UIButton *mapSelectButton;
@property (weak, nonatomic) IBOutlet UIImageView *main_btnImage;

@property (weak, nonatomic) IBOutlet UIButton *picButton;
@property (weak, nonatomic) IBOutlet UIButton *pic_background;
@property (weak, nonatomic) IBOutlet UIButton *pic_button1;
@property (weak, nonatomic) IBOutlet UIButton *pic_button2;
@property (weak, nonatomic) IBOutlet UILabel *pic_label1;
@property (weak, nonatomic) IBOutlet UILabel *pic_label2;

@end

@implementation ServiceViewController
@synthesize serviceArray;
@synthesize locationManager;
@synthesize serviceTotalPrice;

- (void)viewDidLoad {
    [super viewDidLoad];
    

    if(serviceArray == NULL)
    {
        serviceArray = [[NSMutableArray alloc]init];
    }
    
    
    if(![[NSUserDefaults standardUserDefaults]boolForKey:@"isregistedToken"])
    {
        [self registerTokenHttp];
    }
    
    self.locationManager = [[CLLocationManager alloc] init];
    
    self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    self.locationManager.delegate = self;
    // 사용중에만 위치 정보 요청
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager startUpdatingLocation];
    [self.locationManager startUpdatingHeading];
    
    
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    if(!isViewWillAppear)
    {
        isViewWillAppear = true;
        [super viewWillAppear:NO];
        float xR = [[NSUserDefaults standardUserDefaults] floatForKey:@"xRatio"];
        float yR = [[NSUserDefaults standardUserDefaults] floatForKey:@"yRatio"];
        
        
        
        //////////////////////////컨포넌트 재설정/////////////////////////////////
        _ViewOutlet.frame = CGRectMake(_ViewOutlet.frame.origin.x*xR, _ViewOutlet.frame.origin.y*yR, _ViewOutlet.frame.size.width*xR, _ViewOutlet.frame.size.height*yR);
        _navigationBarOutlet.frame = CGRectMake(_navigationBarOutlet.frame.origin.x, _navigationBarOutlet.frame.origin.y, _navigationBarOutlet.frame.size.width*xR, _navigationBarOutlet.frame.size.height*yR);
        _rightBtnOutlet.frame = CGRectMake(_rightBtnOutlet.frame.origin.x*xR, _rightBtnOutlet.frame.origin.y*yR, _rightBtnOutlet.frame.size.width*yR, _rightBtnOutlet.frame.size.height*yR);
        _leftBtnOutlet.frame = CGRectMake((_leftBtnOutlet.frame.origin.x*xR+(_leftBtnOutlet.frame.size.width*xR-_leftBtnOutlet.frame.size.height*yR)/2), _leftBtnOutlet.frame.origin.y, _leftBtnOutlet.frame.size.width*yR, _leftBtnOutlet.frame.size.height*yR);
        
        
        _main_titleOutlet.frame = CGRectMake(_main_titleOutlet.frame.origin.x*xR, _main_titleOutlet.frame.origin.y*yR, _main_titleOutlet.frame.size.width*xR, _main_titleOutlet.frame.size.height*yR);
        _btn01_Outlet.frame = CGRectMake(_btn01_Outlet.frame.origin.x*xR, _btn01_Outlet.frame.origin.y*yR, _btn01_Outlet.frame.size.width*xR, _btn01_Outlet.frame.size.height*yR);
        _btn02_Outlet.frame = CGRectMake(_btn02_Outlet.frame.origin.x*xR, _btn02_Outlet.frame.origin.y*yR, _btn02_Outlet.frame.size.width*xR, _btn02_Outlet.frame.size.height*yR);
        _btn03_Outlet.frame = CGRectMake(_btn03_Outlet.frame.origin.x*xR, _btn03_Outlet.frame.origin.y*yR, _btn03_Outlet.frame.size.width*xR, _btn03_Outlet.frame.size.height*yR);
        _btn04_Outlet.frame = CGRectMake(_btn04_Outlet.frame.origin.x*xR, _btn04_Outlet.frame.origin.y*yR, _btn04_Outlet.frame.size.width*xR, _btn04_Outlet.frame.size.height*yR);
        _btn05_Outlet.frame = CGRectMake(_btn05_Outlet.frame.origin.x*xR, _btn05_Outlet.frame.origin.y*yR, _btn05_Outlet.frame.size.width*xR, _btn05_Outlet.frame.size.height*yR);
        _btn06_Outlet.frame = CGRectMake(_btn06_Outlet.frame.origin.x*xR, _btn06_Outlet.frame.origin.y*yR, _btn06_Outlet.frame.size.width*xR, _btn06_Outlet.frame.size.height*yR);
        _mapButton.frame = CGRectMake(_mapButton.frame.origin.x*xR, _mapButton.frame.origin.y*yR, _mapButton.frame.size.width*xR, _mapButton.frame.size.height*yR);
        _mapButtonImage.frame = CGRectMake(_mapButtonImage.frame.origin.x*xR, _mapButtonImage.frame.origin.y*yR, _mapButtonImage.frame.size.width*xR, _mapButtonImage.frame.size.height*yR);
        _main_btnImage.frame = CGRectMake(_main_btnImage.frame.origin.x*xR, _main_btnImage.frame.origin.y*yR, _main_btnImage.frame.size.width*xR, _main_btnImage.frame.size.height*yR);
        
        
        ////+font//////
        
        float fontSize12 = 12*yR;
        float fontSize13 = 13*yR;
        float fontSize14 = 14*yR;
        float fontSize11 = 11*yR;
        
        
        _mapTotalLabel.frame = CGRectMake(_mapTotalLabel.frame.origin.x*xR, _mapTotalLabel.frame.origin.y*yR, _mapTotalLabel.frame.size.width*xR, _mapTotalLabel.frame.size.height*yR);
        [_mapTotalLabel setFont:[UIFont fontWithName:@"System Font" size:fontSize14]];
        
        _title00Label_Outlet.frame = CGRectMake(_title00Label_Outlet.frame.origin.x*xR, _title00Label_Outlet.frame.origin.y*yR, _title00Label_Outlet.frame.size.width*xR, _title00Label_Outlet.frame.size.height*yR);
        [_title00Label_Outlet setFont:[UIFont fontWithName:@"System Font Heavy" size:fontSize12]];
        _title01Label_Outlet.frame = CGRectMake(_title01Label_Outlet.frame.origin.x*xR, _title01Label_Outlet.frame.origin.y*yR, _title01Label_Outlet.frame.size.width*xR, _title01Label_Outlet.frame.size.height*yR);
        [_title01Label_Outlet setFont:[UIFont fontWithName:@"System Font Heavy" size:fontSize12]];
        
        /////alarm//////
        _alarmView.frame = CGRectMake(_alarmView.frame.origin.x*xR, _alarmView.frame.origin.y*yR, _alarmView.frame.size.width*xR, _alarmView.frame.size.height*yR);
        _alarmImage.frame = CGRectMake(_alarmImage.frame.origin.x*xR, _alarmImage.frame.origin.y*yR, _alarmImage.frame.size.width*xR, _alarmImage.frame.size.height*yR);
        _alarmLabel.frame = CGRectMake(_alarmLabel.frame.origin.x*xR, _alarmLabel.frame.origin.y*yR, _alarmLabel.frame.size.width*xR, _alarmLabel.frame.size.height*yR);
        [_alarmLabel setFont:[UIFont systemFontOfSize:fontSize11]];
        _hiddenView.frame = CGRectMake(_hiddenView.frame.origin.x*xR, _hiddenView.frame.origin.y*yR, _hiddenView.frame.size.width*xR, _hiddenView.frame.size.height*yR);
        
        _hiddenMapView.frame = CGRectMake(_hiddenMapView.frame.origin.x*xR, _hiddenMapView.frame.origin.y*yR, _hiddenMapView.frame.size.width*xR, _hiddenMapView.frame.size.height*yR);
        
        _middleView.frame = CGRectMake(_middleView.frame.origin.x*xR, _middleView.frame.origin.y*yR, _middleView.frame.size.width*xR, _middleView.frame.size.height*yR);
        _bottomView.frame = CGRectMake(_bottomView.frame.origin.x*xR, _bottomView.frame.origin.y*yR, _bottomView.frame.size.width*xR, _bottomView.frame.size.height*yR);
        
        _downViewOutlet.frame = CGRectMake(_downViewOutlet.frame.origin.x*xR, _downViewOutlet.frame.origin.y*yR, _downViewOutlet.frame.size.width*xR, _downViewOutlet.frame.size.height*yR);
        _scrollView.frame = CGRectMake(_scrollView.frame.origin.x*xR, _scrollView.frame.origin.y*yR, _scrollView.frame.size.width*xR, (_scrollView.frame.size.height)*xR);
        _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width, _downViewOutlet.frame.size.height);
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.scrollEnabled=YES;
        //[self.view addSubview:_scrollView];
        
        
        _map_woman.frame = CGRectMake(_map_woman.frame.origin.x*xR, _map_woman.frame.origin.y*yR, _map_woman.frame.size.width*xR, _map_woman.frame.size.height*yR);
        _map_man.frame = CGRectMake(_map_man.frame.origin.x*xR, _map_man.frame.origin.y*yR, _map_man.frame.size.width*xR, _map_man.frame.size.height*yR);
        _map_belt.frame = CGRectMake(_map_belt.frame.origin.x*xR, _map_belt.frame.origin.y*yR, _map_belt.frame.size.width*xR, _map_belt.frame.size.height*yR);
        _map_bag.frame = CGRectMake(_map_bag.frame.origin.x*xR, _map_bag.frame.origin.y*yR, _map_bag.frame.size.width*xR, _map_bag.frame.size.height*yR);
        _map_etc.frame = CGRectMake(_map_etc.frame.origin.x*xR, _map_etc.frame.origin.y*yR, _map_etc.frame.size.width*xR, _map_etc.frame.size.height*yR);
        _map_wellet.frame = CGRectMake(_map_wellet.frame.origin.x*xR, _map_wellet.frame.origin.y*yR, _map_wellet.frame.size.width*xR, _map_wellet.frame.size.height*yR);
        
        _picButton.frame = CGRectMake(_picButton.frame.origin.x*xR, _picButton.frame.origin.y*yR, _picButton.frame.size.width*xR, _picButton.frame.size.height*yR);
        _picButton.layer.zPosition = 0.7;
        _mapSelectButton.frame = CGRectMake(_mapSelectButton.frame.origin.x*xR, _mapSelectButton.frame.origin.y*yR, _mapSelectButton.frame.size.width*xR, _mapSelectButton.frame.size.height*yR);
        
        _pic_background.frame = CGRectMake(_pic_background.frame.origin.x*xR, _pic_background.frame.origin.y*yR, _pic_background.frame.size.width*xR, _pic_background.frame.size.height*yR);
        
        _pic_button1.frame = CGRectMake(_pic_button1.frame.origin.x*xR, _pic_button1.frame.origin.y*yR, _pic_button1.frame.size.width*xR, _pic_button1.frame.size.height*yR);
        _pic_button1.layer.zPosition = 0.5;
        _pic_button2.frame = CGRectMake(_pic_button2.frame.origin.x*xR, _pic_button2.frame.origin.y*yR, _pic_button2.frame.size.width*xR, _pic_button2.frame.size.height*yR);
        _pic_button2.layer.zPosition = 0.5;
        _pic_label1.frame = CGRectMake(_pic_label1.frame.origin.x*xR, _pic_label1.frame.origin.y*yR, _pic_label1.frame.size.width*xR, _pic_label1.frame.size.height*yR);
        [_pic_label1 setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
        _pic_label1.layer.zPosition = 0.5;
        _pic_label2.frame = CGRectMake(_pic_label2.frame.origin.x*xR, _pic_label2.frame.origin.y*yR, _pic_label2.frame.size.width*xR, _pic_label2.frame.size.height*yR);
        [_pic_label2 setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
        _pic_label2.layer.zPosition = 0.5;

        [self mapActiveFunction];
        [self mapTotalCountPrice];

        AppDelegate *app_delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        if(!app_delegate.isPopup)
        {
//            NSLog(@"popupNoctice call");
            app_delegate.isPopup = true;
            [self popupNotice];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)womanButton:(id)sender {
    UIStoryboard *storyboard = self.storyboard;
    WomenSelectViewController *nextViewController = [storyboard instantiateViewControllerWithIdentifier:@"WomanServiceVC"];
    nextViewController.serviceArray = serviceArray;
    nextViewController.serviceTotalPrice = serviceTotalPrice;
    [self presentViewController:nextViewController animated:YES completion:nil];
    
}
- (IBAction)manButton:(id)sender {
    UIStoryboard *storyboard = self.storyboard;
    MenSelectViewController *nextViewController = [storyboard instantiateViewControllerWithIdentifier:@"ManServiceVC"];
    nextViewController.serviceArray = serviceArray;
    nextViewController.serviceTotalPrice = serviceTotalPrice;
    [self presentViewController:nextViewController animated:YES completion:nil];
}
- (IBAction)bagButton:(UIButton *)sender {
    UIStoryboard *storyboard = self.storyboard;
    BagSelectViewController *nextViewController = [storyboard instantiateViewControllerWithIdentifier:@"BagServiceVC"];
    nextViewController.serviceArray = serviceArray;
    nextViewController.serviceTotalPrice = serviceTotalPrice;
    [self presentViewController:nextViewController animated:YES completion:nil];
    
}
- (IBAction)beltButton:(UIButton *)sender {
    UIStoryboard *storyboard = self.storyboard;
    BeltSelectViewController *nextViewController = [storyboard instantiateViewControllerWithIdentifier:@"BeltServiceVC"];
    nextViewController.serviceArray = serviceArray;
    nextViewController.serviceTotalPrice = serviceTotalPrice;
    [self presentViewController:nextViewController animated:YES completion:nil];
    
}
- (IBAction)walletButton:(UIButton *)sender {
    UIStoryboard *storyboard = self.storyboard;
    WalletSelectViewController *nextViewController = [storyboard instantiateViewControllerWithIdentifier:@"WalletServiceVC"];
    nextViewController.serviceArray = serviceArray;
    nextViewController.serviceTotalPrice = serviceTotalPrice;
    [self presentViewController:nextViewController animated:YES completion:nil];
    
}
- (IBAction)etcButton:(UIButton *)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"알림"
                                                   message:@"준비중입니다."
                                                  delegate:self
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"확인", nil];
    
    // alert창을 띄우는 method는 show이다.
    [alert show];
}


- (IBAction)picBackground:(UIButton *)sender {
    [self picButton:_picButton];
}

- (IBAction)picButton:(UIButton *)sender {
    float yR = [[NSUserDefaults standardUserDefaults] floatForKey:@"yRatio"];
    if(!isPicButton)
    {
        isPicButton = true;
        
        if (!isPicOpenClose)
        {
            CGRect btn1_frame = _pic_button1.frame;
            btn1_frame.origin.y -= 70*yR;
            CGRect label1_frame = _pic_label1.frame;
            label1_frame.origin.y -= 70*yR;
            
            
            CGRect btn2_frame = _pic_button2.frame;
            btn2_frame.origin.y -= 140*yR;
            CGRect label2_frame = _pic_label2.frame;
            label2_frame.origin.y -= 140*yR;
            
            
            
            CGRect btn1_frame2 = _pic_button1.frame;
            btn1_frame2.origin.y -= 60*yR;
            CGRect label1_frame2 = _pic_label1.frame;
            label1_frame2.origin.y -= 60*yR;
            
            CGRect btn2_frame2 = _pic_button2.frame;
            btn2_frame2.origin.y -= 120*yR;
            CGRect label2_frame2 = _pic_label2.frame;
            label2_frame2.origin.y -= 120*yR;
            
            UIImage *trans_image = [UIImage imageNamed:@"main_fab_push.png"];
            [UIView animateWithDuration:0.1
                             animations:^{
                                 _pic_background.layer.zPosition = 0.5;
                                 _pic_background.hidden = NO;
                                 _picButton.layer.zPosition = 1;
                             }
                             completion:^(BOOL finished){
                                 [UIView animateWithDuration:0.2
                                                  animations:^{
                                                      [_picButton setImage:trans_image forState:UIControlStateNormal];
                                                      _pic_button1.hidden = NO;
                                                      _pic_button1.layer.zPosition = 0.7;
                                                      _pic_button1.frame = btn1_frame;
                                                      
                                                      _pic_label1.hidden = NO;
                                                      _pic_label1.layer.zPosition = 0.7;
                                                      _pic_label1.frame = label1_frame;
                                                      
                                                      _pic_button2.hidden = NO;
                                                      _pic_button2.layer.zPosition = 0.7;
                                                      _pic_button2.frame = btn2_frame;
                                                      
                                                      _pic_label2.hidden = NO;
                                                      _pic_label2.layer.zPosition = 0.7;
                                                      _pic_label2.frame = label2_frame;
                                                      
                                                  }
                                                  completion:^(BOOL finished){
                                                      
                                                      [UIView animateWithDuration:0.1
                                                                       animations:^{
                                                                           _pic_button1.frame = btn1_frame2;
                                                                           _pic_label1.frame = label1_frame2;
                                                                           _pic_button2.frame = btn2_frame2;
                                                                           _pic_label2.frame = label2_frame2;
                                                                       }
                                                                       completion:^(BOOL finished) {
                                                                           isPicButton = false;
                                                                           isPicOpenClose = true;
                                                                       }];
                                                  }];
                             }];
        }
        else
        {
            CGRect btn1_frame = _pic_button1.frame;
            btn1_frame.origin.y += 60*yR;
            CGRect btn2_frame = _pic_button2.frame;
            btn2_frame.origin.y += 120*yR;
            
            CGRect label1_frame = _pic_label1.frame;
            label1_frame.origin.y += 60*yR;
            CGRect label2_frame = _pic_label2.frame;
            label2_frame.origin.y += 120*yR;
            UIImage *trans_image = [UIImage imageNamed:@"main_fab.png"];
            [UIView animateWithDuration:0.2
                             animations:^{
                                 [_picButton setImage:trans_image forState:UIControlStateNormal];
                                 _pic_button1.layer.zPosition = 0.5;
                                 _pic_button1.frame = btn1_frame;
                                 
                                 _pic_button2.layer.zPosition = 0.5;
                                 _pic_button2.frame = btn2_frame;
                                 
                                 _pic_label1.layer.zPosition = 0.5;
                                 _pic_label1.frame = label1_frame;
                                 
                                 _pic_label2.layer.zPosition = 0.5;
                                 _pic_label2.frame = label2_frame;
                                 
                                 _pic_background.hidden = YES;
                                 _pic_background.layer.zPosition = 0;
                                 _picButton.layer.zPosition = 0.7;
                                 
                             }
                             completion:^(BOOL finished) {
                                 _pic_button1.hidden = YES;
                                 _pic_button2.hidden = YES;
                                 _pic_label1.hidden = YES;
                                 _pic_label2.hidden = YES;
                                 
                                 isPicButton = false;
                                 isPicOpenClose = false;

                             }];
        }
    }
}

- (IBAction)kakaoDemande:(UIButton *)sender {
    NSURL* url = [[NSURL alloc] initWithString:@"http://plus.kakao.com/home/%40whatshoe"];
    [[UIApplication sharedApplication] openURL:url];
}

- (IBAction)callDemande:(UIButton *)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"02-2051-8292"
                                                   message:nil
                                                  delegate:self
                                         cancelButtonTitle:@"취소"
                                         otherButtonTitles:@"통화", nil];
    
    alert.tag = 100;
    // alert창을 띄우는 method는 show이다.
    [alert show];
    
}
-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (alertView.tag == 100)
    {
        if (buttonIndex == 1)
        {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:02-2051-8292"]];
        }
    }
    
}

- (IBAction)mapSelectButton:(id)sender {
    if(serviceArray.count != 0)
    {
        UIStoryboard *storyboard = self.storyboard;
        MapViewController *mapViewController = [storyboard instantiateViewControllerWithIdentifier:@"MapVC"];
        mapViewController.serviceArray = serviceArray;
        mapViewController.serviceTotalPrice = serviceTotalPrice;
        [self presentViewController:mapViewController animated:NO completion:nil];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"알림"
                                                       message:@"선택하신 상품이 없습니다."
                                                      delegate:self
                                             cancelButtonTitle:nil    /* nil 로 지정할 경우 cancel button 없음 */
                                             otherButtonTitles:@"확인", nil];
        [alert show];
    }

    
}


- (IBAction)mapButton:(UIButton *)sender {
    if(!isSlideButton)
    {
        isSlideButton = true;
        
        float yR = [[NSUserDefaults standardUserDefaults] floatForKey:@"yRatio"];
        if (!isMapButon)
        {
            [UIView animateWithDuration:0.4
                             animations:^{
                                 CGRect hidenView_frame = _hiddenView.frame;
                                 hidenView_frame.size.height += 174*yR;
                                 _hiddenView.frame = hidenView_frame;
                                 
                                 _mapButtonImage.image = [UIImage imageNamed:@"main_bar_btn2.png"];
                                 
                                 CGRect middleView_frame = _middleView.frame;
                                 middleView_frame.origin.y += 174*yR;
                                 middleView_frame.size.height -= 174*yR;
                                 _middleView.frame = middleView_frame;
                                 
                                 CGRect scrollview_frame = _scrollView.frame;
                                 scrollview_frame.size.height -= 174*yR;
                                 _scrollView.frame = scrollview_frame;
                                 
                             }
                             completion:^(BOOL finished){
                                 isSlideButton = false;
                                 isMapButon = true;
                             }];
        }
        else
        {
            [UIView animateWithDuration:0.2
                             animations:^{
                                 CGRect hidenView_frame = _hiddenView.frame;
                                 hidenView_frame.size.height -= 174*yR;
                                 _hiddenView.frame = hidenView_frame;
                                 
                                 _mapButtonImage.image = [UIImage imageNamed:@"main_bar_btn.png"];
                                 
                                 CGRect middleView_frame = _middleView.frame;
                                 middleView_frame.origin.y -= 174*yR;
                                 middleView_frame.size.height += 174*yR;
                                 _middleView.frame = middleView_frame;
                                 
                                 CGRect scrollview_frame = _scrollView.frame;
                                 scrollview_frame.size.height += 174*yR;
                                 _scrollView.frame = scrollview_frame;
                                 
                             }
                             completion:^(BOOL finished) {
                                 isSlideButton = false;
                                 isMapButon = false;
                             }];
        }
    }
}

- (IBAction)myshoeButton:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"알림"
                                                   message:@"준비중입니다."
                                                  delegate:self
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"확인", nil];
    // alert창을 띄우는 method는 show이다.
    [alert show];
    
}

-(void) mapActiveFunction
{
    if(serviceArray.count != 0)
    {
        [self mapButton:_mapButton];
    }
    for(SelectCode *temp in serviceArray)
    {
        if([temp.service_index isEqualToString:@"1"])
        {
            _map_woman.userInteractionEnabled = YES;
            _map_woman.alpha = 1;
            [_btn01_Outlet setImage:[UIImage imageNamed:@"main_woman_push.png"] forState:UIControlStateNormal];
        }
        else if([temp.service_index isEqualToString:@"2"])
        {
            _map_man.userInteractionEnabled = YES;
            _map_man.alpha = 1;
            [_btn02_Outlet setImage:[UIImage imageNamed:@"main_man_push.png"] forState:UIControlStateNormal];
        }
        else if([temp.service_index isEqualToString:@"3"])
        {
            _map_bag.userInteractionEnabled = YES;
            _map_bag.alpha = 1;
            [_btn03_Outlet setImage:[UIImage imageNamed:@"main_bag_push.png"] forState:UIControlStateNormal];
        }
        else if([temp.service_index isEqualToString:@"4"])
        {
            _map_belt.userInteractionEnabled = YES;
            _map_belt.alpha = 1;
            [_btn04_Outlet setImage:[UIImage imageNamed:@"main_belt_push.png"] forState:UIControlStateNormal];
        }
        else if([temp.service_index isEqualToString:@"5"])
        {
            _map_wellet.userInteractionEnabled = YES;
            _map_wellet.alpha = 1;
            [_btn05_Outlet setImage:[UIImage imageNamed:@"main_wallet_push.png"] forState:UIControlStateNormal];
        }
        else if([temp.service_index isEqualToString:@"6"])
        {
            _map_etc.userInteractionEnabled = YES;
            _map_etc.alpha = 1;
            [_btn06_Outlet setImage:[UIImage imageNamed:@"main_etc_push.png"] forState:UIControlStateNormal];
        }
    }
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */



- (IBAction)toggleLeftButtonClicked:(id)sender {
    [self.slidingViewController slideRight];
}


////////////////////////////////////팝업 모달창//////////////////////////////////////
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    MyshoeViewController *newVC = segue.destinationViewController;
    
    [ServiceViewController
     setPresentationStyleForSelfController:self presentingController:newVC];
    
}





+ (void)setPresentationStyleForSelfController:(UIViewController *)selfController presentingController:(UIViewController *)presentingController
{
    if ([NSProcessInfo instancesRespondToSelector:@selector(isOperatingSystemAtLeastVersion:)])
    {
        //iOS 8.0 and above
        presentingController.providesPresentationContextTransitionStyle = YES;
        presentingController.definesPresentationContext = YES;
        
        [presentingController setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    }
    else
    {
        [selfController setModalPresentationStyle:UIModalPresentationCurrentContext];
        [selfController.navigationController setModalPresentationStyle:UIModalPresentationCurrentContext];
    }
}


- (void)popupNotice
{
    NSString *result = [self popupCountHttp];
    int popupCount = [result intValue];
    
    UIStoryboard *storyboard = self.storyboard;
    PopupNoticeViewController *popupViewController = [storyboard instantiateViewControllerWithIdentifier:@"PopupVC"];
    popupViewController.imageNum = popupCount;
    [popupViewController setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    UINavigationController *navCon = [[UINavigationController alloc] initWithRootViewController:popupViewController];
    navCon.navigationBarHidden = YES;
    navCon.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    
    [self presentViewController:navCon animated:YES completion:nil];
    
}

- (void)mapTotalCountPrice
{
    NSString *tempText = @"총 ";
    NSString *totalCount = [NSString stringWithFormat:@"%lu건 ",(unsigned long)serviceArray.count];
    NSString *tempPrice = [NSNumberFormatter localizedStringFromNumber:@(serviceTotalPrice) numberStyle:NSNumberFormatterDecimalStyle];
    
    tempText = [tempText stringByAppendingString:totalCount];
    tempText = [tempText stringByAppendingString:tempPrice];
    tempText = [tempText stringByAppendingString:@"원"];
    
    _mapTotalLabel.text = tempText;
    
}

-(NSString *)registerTokenHttp
{
    NSString *result;
    HttpPostManager *registerTokenHttp = [[HttpPostManager alloc]init];
    [registerTokenHttp setURL:@"iphone_token"];
    order_name = [[NSUserDefaults standardUserDefaults] objectForKey:@"loginId"];
    [registerTokenHttp addEntity:@"id" over:order_name];
    NSString *token =[[NSUserDefaults standardUserDefaults] stringForKey:@"registrationToken"];
    if(token == nil){
        token = @"null";
    }
    
    [registerTokenHttp addEntity:@"token" over:token];
    result = [registerTokenHttp startHttp:@"getRegisterToken"];
    [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"isregistedToken"];
    return result;
}

-(NSString *)popupCountHttp
{
    NSString *result;
    HttpPostManager *popupCountHttp = [[HttpPostManager alloc]init];
    [popupCountHttp setURL:@"iphone_popup_count"];
    order_name = [[NSUserDefaults standardUserDefaults] objectForKey:@"loginId"];
    [popupCountHttp addEntity:@"id" over:order_name];
    result = [popupCountHttp startHttp:@"popupCount"];
    return result;
}

@end