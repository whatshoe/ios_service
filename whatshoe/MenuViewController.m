//
//  MenuViewController.m
//  whatshoe
//
//  Created by whatshoe on 2015. 11. 13..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import "MenuViewController.h"
#import "HttpPostManager.h"
#import "LoginViewController.h"
#import "AppDelegate.h"

#import <KakaoOpenSDK/KakaoOpenSDK.h>
@interface MenuViewController (){

    int order_payMethod;
    NSString *order_id;
    NSString *order_time;
    NSString *order_state;
    NSString *order_code;
    
    bool isViewWillAppear;
}
@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UIView *middleView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;


@property (weak, nonatomic) IBOutlet UIView *nav_mypageView;
@property (weak, nonatomic) IBOutlet UIButton *nav_mypage;
@property (weak, nonatomic) IBOutlet UIView *nav_pointView;
@property (weak, nonatomic) IBOutlet UIButton *nav_point;
@property (weak, nonatomic) IBOutlet UIView *nav_couponView;
@property (weak, nonatomic) IBOutlet UIButton *nav_coupon;
@property (weak, nonatomic) IBOutlet UIView *nav_listView;
@property (weak, nonatomic) IBOutlet UIButton *nav_list;
@property (weak, nonatomic) IBOutlet UIView *nav_shareView;
@property (weak, nonatomic) IBOutlet UIButton *nav_share;
@property (weak, nonatomic) IBOutlet UIView *nav_noticeview;
@property (weak, nonatomic) IBOutlet UIButton *nav_notice;
@property (weak, nonatomic) IBOutlet UIView *nav_eventView;
@property (weak, nonatomic) IBOutlet UIButton *nav_event;
@property (weak, nonatomic) IBOutlet UIView *nav_callView;
@property (weak, nonatomic) IBOutlet UIButton *nav_call;

@property (weak, nonatomic) IBOutlet UIButton *logoutButton;

@end
@implementation MenuViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    AppDelegate *app_delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    

    if(!app_delegate.isNickNameHTTP)
    {

        app_delegate.isNickNameHTTP = true;
        [[NSUserDefaults standardUserDefaults] setObject:[self nickNameHttp] forKey:@"nickName"];

    }
}

-(void)viewWillAppear:(BOOL)animated
{
    NSString *nickName = [[NSUserDefaults standardUserDefaults]objectForKey:@"nickName"];
    if(nickName != NULL)
    {
        [_idLabel setText:nickName];
    }
    
    if(!isViewWillAppear)
    {
        isViewWillAppear = true;
        [super viewWillAppear:NO];
        float xR = [[NSUserDefaults standardUserDefaults] floatForKey:@"xRatio"];
        float yR = [[NSUserDefaults standardUserDefaults] floatForKey:@"yRatio"];
        
        
        //////////////////////////컨포넌트 재설정/////////////////////////////////
        _mainView.frame = CGRectMake(_mainView.frame.origin.x*xR, _mainView.frame.origin.y*yR, _mainView.frame.size.width*xR, _mainView.frame.size.height*yR);
        _topView.frame = CGRectMake(_topView.frame.origin.x*xR, _topView.frame.origin.y*yR, _topView.frame.size.width*xR, _topView.frame.size.height*yR);
        _middleView.frame = CGRectMake(_middleView.frame.origin.x*xR, _middleView.frame.origin.y*yR, _middleView.frame.size.width*xR, _middleView.frame.size.height*yR);
        [self drawTopBorder:_middleView border:2];
        _bottomView.frame = CGRectMake(_bottomView.frame.origin.x*xR, _bottomView.frame.origin.y*yR, _bottomView.frame.size.width*xR, _bottomView.frame.size.height*yR);
        
        
        _nav_mypage.frame = CGRectMake(_nav_mypage.frame.origin.x*xR, _nav_mypage.frame.origin.y*yR, _nav_mypage.frame.size.width*xR, _nav_mypage.frame.size.height*yR);
        _nav_point.frame = CGRectMake(_nav_point.frame.origin.x*xR, _nav_point.frame.origin.y*yR, _nav_point.frame.size.width*xR, _nav_point.frame.size.height*yR);
        _nav_coupon.frame = CGRectMake(_nav_coupon.frame.origin.x*xR, _nav_coupon.frame.origin.y*yR, _nav_coupon.frame.size.width*xR, _nav_coupon.frame.size.height*yR);
        _nav_list.frame = CGRectMake(_nav_list.frame.origin.x*xR, _nav_list.frame.origin.y*yR, _nav_list.frame.size.width*xR, _nav_list.frame.size.height*yR);
        _nav_share.frame = CGRectMake(_nav_share.frame.origin.x*xR, _nav_share.frame.origin.y*yR, _nav_share.frame.size.width*xR, _nav_share.frame.size.height*yR);
        _nav_notice.frame = CGRectMake(_nav_notice.frame.origin.x*xR, _nav_notice.frame.origin.y*yR, _nav_notice.frame.size.width*xR, _nav_notice.frame.size.height*yR);
        _nav_event.frame = CGRectMake(_nav_event.frame.origin.x*xR, _nav_event.frame.origin.y*yR, _nav_event.frame.size.width*xR, _nav_event.frame.size.height*yR);
        _nav_call.frame = CGRectMake(_nav_call.frame.origin.x*xR, _nav_call.frame.origin.y*yR, _nav_call.frame.size.width*xR, _nav_call.frame.size.height*yR);
        
        _nav_mypageView.frame = CGRectMake(_nav_mypageView.frame.origin.x*xR, _nav_mypageView.frame.origin.y*yR, _nav_mypageView.frame.size.width*xR, _nav_mypageView.frame.size.height*yR);
        [self drawRightBorder:_nav_mypageView border:1];
        [self drawBottomBorder:_nav_mypageView border:1];
        _nav_pointView.frame = CGRectMake(_nav_pointView.frame.origin.x*xR, _nav_pointView.frame.origin.y*yR, _nav_pointView.frame.size.width*xR, _nav_pointView.frame.size.height*yR);
        [self drawRightBorder:_nav_pointView border:1];
        [self drawBottomBorder:_nav_pointView border:1];
        _nav_couponView.frame = CGRectMake(_nav_couponView.frame.origin.x*xR, _nav_couponView.frame.origin.y*yR, _nav_couponView.frame.size.width*xR, _nav_couponView.frame.size.height*yR);
        [self drawRightBorder:_nav_couponView border:1];
        [self drawBottomBorder:_nav_couponView border:1];
        _nav_listView.frame = CGRectMake(_nav_listView.frame.origin.x*xR, _nav_listView.frame.origin.y*yR, _nav_listView.frame.size.width*xR, _nav_listView.frame.size.height*yR);
        [self drawBottomBorder:_nav_listView border:1];
        _nav_shareView.frame = CGRectMake(_nav_shareView.frame.origin.x*xR, _nav_shareView.frame.origin.y*yR, _nav_shareView.frame.size.width*xR, _nav_shareView.frame.size.height*yR);
        [self drawBottomBorder:_nav_shareView border:1];
        _nav_noticeview.frame = CGRectMake(_nav_noticeview.frame.origin.x*xR, _nav_noticeview.frame.origin.y*yR, _nav_noticeview.frame.size.width*xR, _nav_noticeview.frame.size.height*yR);
        [self drawBottomBorder:_nav_noticeview border:1];
        _nav_eventView.frame = CGRectMake(_nav_eventView.frame.origin.x*xR, _nav_eventView.frame.origin.y*yR, _nav_eventView.frame.size.width*xR, _nav_eventView.frame.size.height*yR);
        [self drawBottomBorder:_nav_eventView border:1];
        _nav_callView.frame = CGRectMake(_nav_callView.frame.origin.x*xR, _nav_callView.frame.origin.y*yR, _nav_callView.frame.size.width*xR, _nav_callView.frame.size.height*yR);
        [self drawBottomBorder:_nav_callView border:1];
        /////+font/////
        float fontSize12 = 12*yR;
        float fontSize16 = 16*yR;
        _idLabel.frame = CGRectMake(_idLabel.frame.origin.x*xR, _idLabel.frame.origin.y*yR, _idLabel.frame.size.width*xR, _idLabel.frame.size.height*yR);
        [_idLabel setFont:[UIFont fontWithName:@"System Font Heavy" size:fontSize16]];
        
        _logoutButton.frame = CGRectMake(_logoutButton.frame.origin.x*xR, _logoutButton.frame.origin.y*yR, _logoutButton.frame.size.width*xR, _logoutButton.frame.size.height*yR);
        [_logoutButton.titleLabel setFont:[UIFont fontWithName:@"System Font Heavy" size:fontSize12]];

    }
}
-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (alertView.tag == 100)
    {
        if (buttonIndex == 1)
        {
 
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"loginId"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"loginPhoneNum"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"detail"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"nickName"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"isBoolGPS"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"isregistedToken"];
            
            AppDelegate *app_delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
            app_delegate.isNickNameHTTP = false;
            app_delegate.isPopup = false;
            

            exit(0);
//            UIStoryboard *storyboard = self.storyboard;
//            UIViewController *mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginVC"];
//            [self presentViewController:mainViewController animated:NO completion:nil];
        }
    }
    
}
- (IBAction)logoutButton:(UIButton *)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"알림"
                                                   message:@"정말 로그아웃 하시겠습니까?"
                                                  delegate:self
                                         cancelButtonTitle:@"취소"
                                         otherButtonTitles:@"확인", nil];
    
    alert.tag = 100;
    // alert창을 띄우는 method는 show이다.
    [alert show];
    
}


- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}
- (IBAction)pointClick:(id)sender {
    UIStoryboard *storyboard = self.storyboard;
    UIViewController *mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"PointVC"];
    [mainViewController setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    UINavigationController *navCon = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    navCon.navigationBarHidden = YES;
    navCon.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController:navCon animated:YES completion:nil];
}
- (IBAction)couponClick:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"알림"
                                                   message:@"준비중입니다."
                                                  delegate:self
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"확인", nil];
    // alert창을 띄우는 method는 show이다.
    [alert show];
//    UIStoryboard *storyboard = self.storyboard;
//    UIViewController *mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"CouponVC"];
//    [mainViewController setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
//    UINavigationController *navCon = [[UINavigationController alloc] initWithRootViewController:mainViewController];
//    navCon.navigationBarHidden = YES;
//    navCon.modalPresentationStyle = UIModalPresentationFullScreen;
//    
//    [self presentViewController:navCon animated:YES completion:nil];

}
- (IBAction)orderlistClick:(id)sender {
    UIStoryboard *storyboard = self.storyboard;
    UIViewController *mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"OrderlistVC"];
    [mainViewController setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    UINavigationController *navCon = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    navCon.navigationBarHidden = YES;
    navCon.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController:navCon animated:YES completion:nil];
    
}
- (IBAction)centerClick:(id)sender {
    NSURL* url = [[NSURL alloc] initWithString:@"http://plus.kakao.com/home/%40whatshoe"];
    [[UIApplication sharedApplication] openURL:url];

}
- (IBAction)noticeClick:(id)sender {
    NSURL* url = [[NSURL alloc] initWithString:@"http://www.facebook.com/whatshoeman"];
    [[UIApplication sharedApplication] openURL:url];
}
- (IBAction)eventClick:(id)sender {
    UIStoryboard *storyboard = self.storyboard;
    UIViewController *mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"EventVC"];
    [mainViewController setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    UINavigationController *navCon = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    navCon.navigationBarHidden = YES;
    navCon.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController:navCon animated:YES completion:nil];
}
- (IBAction)shareClick:(id)sender {
    [self sendLink];
    
}
- (IBAction)myPageButton:(UIButton *)sender {
    UIStoryboard *storyboard = self.storyboard;
    UIViewController *mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"MyPageVC"];
    [mainViewController setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    UINavigationController *navCon = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    navCon.navigationBarHidden = YES;
    navCon.modalPresentationStyle = UIModalPresentationFullScreen;

    [self presentViewController:navCon animated:YES completion:nil];
    

}

- (NSArray *)dummyLinkObjects {
    KakaoTalkLinkObject *label = [KakaoTalkLinkObject createLabel:@"Manage your fashion!당신을 왓슈로 초대합니다!"];
    //KakaoTalkLinkObject *image = [KakaoTalkLinkObject createImage:@"https://developers.kakao.com/assets/img/link_sample.jpg" width:138 height:80];
    //KakaoTalkLinkObject *webLink = [KakaoTalkLinkObject createWebLink:@"Test Link" url:@"www.whatshoe.co.kr"];
    KakaoTalkLinkAction *androidAppAction
    = [KakaoTalkLinkAction createAppAction:KakaoTalkLinkActionOSPlatformAndroid
                                devicetype:KakaoTalkLinkActionDeviceTypePhone
                                 execparam:nil];
    
    KakaoTalkLinkAction *iphoneAppAction = [KakaoTalkLinkAction createAppAction:KakaoTalkLinkActionOSPlatformIOS devicetype:KakaoTalkLinkActionDeviceTypePhone execparam:@{@"test1" : @"test1", @"test2" : @"test2"}];
    KakaoTalkLinkAction *ipadAppAction = [KakaoTalkLinkAction createAppAction:KakaoTalkLinkActionOSPlatformIOS devicetype:KakaoTalkLinkActionDeviceTypePad execparam:@{@"test1" : @"test1", @"test2" : @"test2"}];
    KakaoTalkLinkObject *appLink = [KakaoTalkLinkObject createAppButton:@"왓슈로 이동" actions:@[androidAppAction, iphoneAppAction, ipadAppAction]];
    //아래줄 리턴안에 이미지와 앱링크 사이에 오른쪽을 넣어야함 webLink,
    return @[label,   appLink];
}

- (void)sendLink {
    if ([KOAppCall canOpenKakaoTalkAppLink]) {
        [KOAppCall openKakaoTalkAppLink:[self dummyLinkObjects]];
    } else {
        NSLog(@"Cannot open kakaotalk.");
    }
}

- (void)drawTopBorder:(UIView*)view border:(int)border
{
    NSInteger borderThickness = border;
    UIColor *color_a1a1a1 = [UIColor colorWithRed:(161.0 / 255.0) green:(161.0 / 255.0) blue:(161.0 / 255.0) alpha: 1];
    UIView *topBorder = [UIView new];
    topBorder.backgroundColor = color_a1a1a1;
    topBorder.alpha = 0.6;
    topBorder.frame = CGRectMake(0, 0, view.frame.size.width, borderThickness);
    [view addSubview:topBorder];

}
- (void)drawBottomBorder:(UIView*)view border:(int)border
{
    NSInteger borderThickness = border;
    UIColor *color_a1a1a1 = [UIColor colorWithRed:(161.0 / 255.0) green:(161.0 / 255.0) blue:(161.0 / 255.0) alpha: 1];
    UIView *bottomBorder = [UIView new];
    bottomBorder.backgroundColor = color_a1a1a1;
    bottomBorder.alpha = 0.6;
    bottomBorder.frame = CGRectMake(0, view.frame.size.height - borderThickness, view.frame.size.width, borderThickness);
    [view addSubview:bottomBorder];
    
}
- (void)drawLeftBorder:(UIView*)view border:(int)border
{
    NSInteger borderThickness = border;
    UIColor *color_a1a1a1 = [UIColor colorWithRed:(161.0 / 255.0) green:(161.0 / 255.0) blue:(161.0 / 255.0) alpha: 1];
    UIView *leftBorder = [UIView new];
    leftBorder.backgroundColor = color_a1a1a1;
    leftBorder.alpha = 0.6;
    leftBorder.frame = CGRectMake(0, 0, borderThickness, view.frame.size.height);
    [view addSubview:leftBorder];
    
}
- (void)drawRightBorder:(UIView*)view border:(int)border
{
    NSInteger borderThickness = border;
    UIColor *color_a1a1a1 = [UIColor colorWithRed:(161.0 / 255.0) green:(161.0 / 255.0) blue:(161.0 / 255.0) alpha: 1];
    UIView *rightBorder = [UIView new];
    rightBorder.backgroundColor = color_a1a1a1;
    rightBorder.alpha = 0.6;
    rightBorder.frame = CGRectMake(view.frame.size.width - borderThickness, 0, borderThickness, view.frame.size.height);
    [view addSubview:rightBorder];
    
}

-(NSString *)nickNameHttp
{
    NSString *result;
    HttpPostManager *nickNameHttp = [[HttpPostManager alloc]init];
    [nickNameHttp setURL:@"iphone_getNickName"];
    order_id = [[NSUserDefaults standardUserDefaults] objectForKey:@"loginId"];
//    NSLog(@"%@",order_id);
    [nickNameHttp addEntity:@"id" over:order_id];
    result = [nickNameHttp startHttp:@"getNickName"];
    return result;
}
@end
