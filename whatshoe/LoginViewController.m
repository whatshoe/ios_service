//
//  LoginViewController.m
//  whatshoe
//
//  Created by whatshoe on 2015. 10. 31..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import "LoginViewController.h"
#import "RootViewController.h"
#import "HttpPostManager.h"
#import "LeftSwipeSegue.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <KakaoOpenSDK/KakaoOpenSDK.h>
#import "MenuViewController.h"
#import "SmsIndentifyViewController.h"

@interface LoginViewController () <UITextFieldDelegate>
{
    NSString *send_id;
//    UIButton* kakaoLoginButton;
    bool isviewWillAppear;
}


@property (weak, nonatomic) IBOutlet UIImageView *logoImage;
@property (weak, nonatomic) IBOutlet UIImageView *idImage;
@property (weak, nonatomic) IBOutlet UIImageView *pwImage;
@property (weak, nonatomic) IBOutlet UIImageView *pwBarImage;
@property (weak, nonatomic) IBOutlet UIImageView *idBarImage;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (weak, nonatomic) IBOutlet UIButton *findpwButton;
@property (weak, nonatomic) IBOutlet UIButton *loginbtOutlet;
@property (weak, nonatomic) IBOutlet UIButton *facebookbtOutlet;
@property (weak, nonatomic) IBOutlet UIButton *kakaoButton;
@property (weak, nonatomic) IBOutlet UITextField *idTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;



- (IBAction)registerButton:(UIButton *)sender;
- (IBAction)passwordFindButton:(UIButton *)sender;
- (IBAction)loginButton:(UIButton *)sender;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
/////////////////////////send_id 생성//////////////
    send_id = [[NSString alloc]init];
//////////////////////////facebook//////////////////////////

    // Handle clicks on the button
    [_facebookbtOutlet
     addTarget:self
     action:@selector(FBloginButtonClicked) forControlEvents:UIControlEventTouchUpInside];
}


-(void)viewWillAppear:(BOOL)animated
{
    if(!isviewWillAppear)
    {
        isviewWillAppear = true;
        [super viewWillAppear:NO];
        float xR = [[NSUserDefaults standardUserDefaults] floatForKey:@"xRatio"];
        float yR = [[NSUserDefaults standardUserDefaults] floatForKey:@"yRatio"];
        
        //////////////////////////컨포넌트 재설정/////////////////////////////////
        _logoImage.frame = CGRectMake(_logoImage.frame.origin.x*xR, _logoImage.frame.origin.y*yR, _logoImage.frame.size.width*xR, _logoImage.frame.size.height*yR);
        _idImage.frame = CGRectMake(_idImage.frame.origin.x*xR, _idImage.frame.origin.y*yR, _idImage.frame.size.width*xR, _idImage.frame.size.height*yR);
        _pwImage.frame = CGRectMake(_pwImage.frame.origin.x*xR, _pwImage.frame.origin.y*yR, _pwImage.frame.size.width*xR, _pwImage.frame.size.height*yR);
        _pwBarImage.frame = CGRectMake(_pwBarImage.frame.origin.x*xR, _pwBarImage.frame.origin.y*yR, _pwBarImage.frame.size.width*xR, _pwBarImage.frame.size.height);
        _idBarImage.frame = CGRectMake(_idBarImage.frame.origin.x*xR, _idBarImage.frame.origin.y*yR, _idBarImage.frame.size.width*xR, _idBarImage.frame.size.height);
        _loginbtOutlet.frame = CGRectMake(_loginbtOutlet.frame.origin.x*xR, _loginbtOutlet.frame.origin.y*yR, _loginbtOutlet.frame.size.width*xR, _loginbtOutlet.frame.size.height*yR);
        _facebookbtOutlet.frame = CGRectMake(_facebookbtOutlet.frame.origin.x*xR, _facebookbtOutlet.frame.origin.y*yR, _facebookbtOutlet.frame.size.width*xR, _facebookbtOutlet.frame.size.height*yR);
        _kakaoButton.frame = CGRectMake(_kakaoButton.frame.origin.x*xR, _kakaoButton.frame.origin.y*yR, _kakaoButton.frame.size.width*xR, _kakaoButton.frame.size.height*yR);
        
        
        /////+font/////
        float fontSize = 14*yR;
        _registerButton.frame = CGRectMake(_registerButton.frame.origin.x*xR, _registerButton.frame.origin.y*yR, _registerButton.frame.size.width*xR, _registerButton.frame.size.height*yR);
        [_registerButton.titleLabel setFont:[UIFont systemFontOfSize:fontSize]];
        _findpwButton.frame = CGRectMake(_findpwButton.frame.origin.x*xR, _findpwButton.frame.origin.y*yR, _findpwButton.frame.size.width*xR, _findpwButton.frame.size.height*yR);
        [_findpwButton.titleLabel setFont:[UIFont systemFontOfSize:fontSize]];
        _idTextField.frame = CGRectMake(_idTextField.frame.origin.x*xR, _idTextField.frame.origin.y*yR, _idTextField.frame.size.width*xR, _idTextField.frame.size.height*yR);
        [_idTextField setFont:[UIFont systemFontOfSize:fontSize]];
        _idTextField.delegate = self;
        _passwordTextField.frame = CGRectMake(_passwordTextField.frame.origin.x*xR, _passwordTextField.frame.origin.y*yR, _passwordTextField.frame.size.width*xR, _passwordTextField.frame.size.height*yR);
        [_passwordTextField setFont:[UIFont systemFontOfSize:fontSize]];
        _passwordTextField.delegate = self;
        
    }

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField.returnKeyType == UIReturnKeyNext) {
        [_idTextField resignFirstResponder];
        [_passwordTextField becomeFirstResponder];
    }
    else if(textField.returnKeyType == UIReturnKeyDone)
    {
        [_passwordTextField resignFirstResponder];
    }
    return YES;
}

///////////페이스북 버튼을 클릭했을때 실행되는 메소드////////////
-(void)FBloginButtonClicked
{
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logInWithReadPermissions:@[@"public_profile",@"email"] handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            // Process error
        } else if (result.isCancelled) {
            // Handle cancellations
        } else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            
            if ([result.grantedPermissions containsObject:@"email"]) {
                if ([FBSDKAccessToken currentAccessToken]) {
                    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields" : @"id,email,name,gender,birthday"}]
                     startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id   result, NSError *error) {
                         if (!error) {
                             
                             
                             NSString *namestr = [result objectForKey:@"name"];
                             NSString *email = [result objectForKey:@"email"];
                             NSString *gender = [result objectForKey:@"gender"];
                             NSString *birthday = [result objectForKey:@"birthday"];
                             NSString *name = [NSString stringWithUTF8String:[namestr cStringUsingEncoding:NSUTF8StringEncoding]];
                             
                             [[NSUserDefaults standardUserDefaults] setObject:email forKey:@"loginId"];
                             
                             NSString *checkId_result;
                             HttpPostManager *checkIdHttp = [[HttpPostManager alloc]init];
                             [checkIdHttp setURL:@"iphone_checkIdDup"];
                             [checkIdHttp addEntity:@"id" over:email];
                             checkId_result = [checkIdHttp startHttp:@"getCheckIdDup"];
                             
                             if([checkId_result isEqualToString:@"suc"])
                             {
                                 UIStoryboard *storyboard = self.storyboard;
                                 SmsIndentifyViewController *nextViewController = [storyboard instantiateViewControllerWithIdentifier:@"smsphoneVC"];
                                 nextViewController.login_id = email;
                                 nextViewController.name = name;
                                 nextViewController.gender = gender;
                                 nextViewController.birthday = birthday;
                                 nextViewController.mail = email;
                                 nextViewController.root = @"facebook";
                                 
                                 [self presentViewController:nextViewController animated:NO completion:nil];
                             }
                             else
                             {
                                 UIStoryboard *storyboard = self.storyboard;
                                 RootViewController *mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"ServiceVC"];
                                 [self presentViewController:mainViewController animated:NO completion:nil];
                             }
                         }
                     }];
                }
            }
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//////////////////////////왼쪽으로 드래그하면 화면이동 //////////////////////////////
- (IBAction)leftSwipeAction:(UISwipeGestureRecognizer *)sender {
    UIStoryboard *storyboard = self.storyboard;
    UIViewController *mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"Page06"];
    LeftSwipeSegue *segue = [[LeftSwipeSegue alloc] initWithIdentifier:@"" source:self destination:mainViewController];
    [self prepareForSegue:segue sender:sender];
    [segue perform];
}
///////////////////////////터치했을때 텍스트에서 벗어나는 메소드//////////////////////////
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    printf("touchesBegan");
    [_passwordTextField endEditing:YES];
    [_idTextField endEditing:YES];
}
///////////////////////////////터치하면 회원가입으로 화면이동//////////////////////////////////
- (IBAction)registerButton:(UIButton *)sender {
    UIStoryboard *storyboard = self.storyboard;
    UIViewController *mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"RegisterVC"];
    [self presentViewController:mainViewController animated:NO completion:nil];
}

- (IBAction)passwordFindButton:(UIButton *)sender {
}
////////////////////////////////일반 로그인 버튼////////////////////////////////////////////
- (IBAction)loginButton:(UIButton *)sender {
    NSString *result = [[NSString alloc]init];
    HttpPostManager *loginHttp = [[HttpPostManager alloc]init];
    [loginHttp setURL:@"iphone_login"];
    [loginHttp addEntity:@"id" over:_idTextField.text];
    [loginHttp addEntity:@"pass" over:_passwordTextField.text];
    result = [loginHttp startHttp:@"getLogin"];
    if ([result isEqualToString:@"suc"])
    {
        [[NSUserDefaults standardUserDefaults] setObject:_idTextField.text forKey:@"loginId"];
        [self getPhoneNumber];
        UIStoryboard *storyboard = self.storyboard;
        RootViewController *mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"ServiceVC"];
       
        send_id = [send_id stringByAppendingString:_idTextField.text];
        [self presentViewController:mainViewController animated:NO completion:nil];

    }
    else if ([result isEqualToString:@"fail"])
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"알림"
                                                       message:@"아이디와 비밀번호가 일치하지 않습니다."
                                                      delegate:self
                                             cancelButtonTitle:nil
                                             otherButtonTitles:@"확인", nil];
        [alert show];
    }
    else
    {
        NSLog(@"error");
    }

}

- (IBAction)kakaoLoginButton:(UIButton *)sender {
    
    [[KOSession sharedSession] close];

    [[KOSession sharedSession] openWithCompletionHandler:^(NSError *error) {
        
        if ([[KOSession sharedSession] isOpen]) {
            //login시 휴대폰 번호의 정보를 가져와야함.
            [KOSessionTask meTaskWithCompletionHandler:^(KOUser* result, NSError *error) {
                if (result) {
                    
                    NSString *kakao_id = [result.ID stringValue];
                    [[NSUserDefaults standardUserDefaults] setObject:kakao_id forKey:@"loginId"];
                    
                    NSString *checkId_result;
                    HttpPostManager *checkIdHttp = [[HttpPostManager alloc]init];
                    [checkIdHttp setURL:@"iphone_checkIdDup"];
                    [checkIdHttp addEntity:@"id" over:[result.ID stringValue]];
                    checkId_result = [checkIdHttp startHttp:@"getCheckIdDup"];
                    if([checkId_result isEqualToString:@"suc"])
                    {
                        //화면전환
                        UIStoryboard *storyboard = self.storyboard;
                        SmsIndentifyViewController *nextViewController = [storyboard instantiateViewControllerWithIdentifier:@"smsphoneVC"];
                        nextViewController.login_id = [result.ID stringValue];
                        NSString *kakaoName = [result propertyForKey:@"nickname"];
                        if(kakaoName == NULL)
                        {
                            nextViewController.name = @"이름 없음";
                        }
                        else
                        {
                            nextViewController.name = kakaoName;
                        }
                        
                        nextViewController.root = @"kakao";
                        
                        [self presentViewController:nextViewController animated:NO completion:nil];
                    }
                    else
                    {

                        
                        UIStoryboard *storyboard = self.storyboard;
                        RootViewController *mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"ServiceVC"];
                        [self presentViewController:mainViewController animated:NO completion:nil];
                    }
                    
                    
                    
                } else {
                    NSLog(@"카카오 로그인은 성공햇으나 결과값 불러오는데는 실패!!");
                    // failed
                }
            }];
            
            
           
            
        } else {
            // failed
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"카카오 로그인 실패"
                                                           message:@"카카오 로그인에 실패했습니다. \n다시 시도해 주세요."
                                                          delegate:self
                                                 cancelButtonTitle:nil    /* nil 로 지정할 경우 cancel button 없음 */
                                                 otherButtonTitles:@"확인", nil];
            // alert창을 띄우는 method는 show이다.
            [alert show];
        }
    }];
    
    
}

- (void)getPhoneNumber
{
    NSString *result;
    HttpPostManager *phoneHttp = [[HttpPostManager alloc]init];
    [phoneHttp setURL:@"iphone_phone"];
    [phoneHttp addEntity:@"id" over:_idTextField.text];
    [phoneHttp addEntity:@"pass" over:_passwordTextField.text];
    result = [phoneHttp startHttp:@"getPhoneNumber"];
    [[NSUserDefaults standardUserDefaults] setObject:result forKey:@"loginPhoneNum"];
}



@end
