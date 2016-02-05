//
//  FacebookPhoneViewController.m
//  whatshoe
//
//  Created by whatshoe on 2015. 12. 5..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import "SmsIndentifyViewController.h"
#import "HttpPostManager.h"

@interface SmsIndentifyViewController ()
{
    NSString *login_id;
    NSString *mail;
    NSString *name;
    NSString *gender;
    NSString *birthday;
    NSString *idenCode;
    NSString *idenCodeResponse;
    NSString *password;
    NSString *phone;
}
@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *idenTextField;
@property (weak, nonatomic) IBOutlet UIButton *idenButton;
@property (weak, nonatomic) IBOutlet UIButton *commitButton;


@end

@implementation SmsIndentifyViewController
@synthesize login_id; //일반 회원가입 필수 사항 //페이스북 필수 사항  //카카오톡 필수 사항
@synthesize name;  //일반 회원가입 필수 사항 //페이스북 필수 사항 //카카오톡 필수 사항
@synthesize gender; //페이스북 필수 사항
@synthesize birthday;
@synthesize password;
@synthesize mail; //페이스북 필수 사항 //카카오톡 필수 사항
@synthesize phone; //일반 회원가입 필수 사항
@synthesize root; //필수 사항

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(gender == NULL)
    {
        gender = @"선택안함";
    }
    if(birthday == NULL)
    {
        birthday = @"";
    }
    if (password == NULL) {
        password = @"";
    }
    if(mail == NULL)
    {
        mail = @"";
    }
    if(phone == NULL)
    {
        phone = @"";
    }
    
    
    if([root isEqualToString:@"facebook"])
    {
        password = [mail stringByAppendingString :@"whatshoe"];
    }
    else if([root isEqualToString:@"kakao"])
    {
        password = [login_id stringByAppendingString :@"whatshoe"];
    }
    
    if(![phone isEqualToString :@""])
    {
        _phoneTextField.text = phone;
    }
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:NO];
    float xR = [[NSUserDefaults standardUserDefaults] floatForKey:@"xRatio"];
    float yR = [[NSUserDefaults standardUserDefaults] floatForKey:@"yRatio"];
    /////+font/////
    float fontSize20 = 20*yR;
    float fontSize13 = 13*yR;
    float fontSize14 = 14*yR;
    
    
    //////////////////////////컨포넌트 재설정/////////////////////////////////
    
    
    _mainView.frame = CGRectMake(_mainView.frame.origin.x*xR, _mainView.frame.origin.y*yR, _mainView.frame.size.width*xR, _mainView.frame.size.height*yR);
    [_label1 setFont:[UIFont fontWithName:@"System Font" size:fontSize20]];
    _label1.frame = CGRectMake(_label1.frame.origin.x*xR, _label1.frame.origin.y*yR, _label1.frame.size.width*xR, _label1.frame.size.height*yR);
    [_label2 setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
    _label2.frame = CGRectMake(_label2.frame.origin.x*xR, _label2.frame.origin.y*yR, _label2.frame.size.width*xR, _label2.frame.size.height*yR);
    [_phoneTextField setFont:[UIFont fontWithName:@"System Font" size:fontSize14]];
    _phoneTextField.frame = CGRectMake(_phoneTextField.frame.origin.x*xR, _phoneTextField.frame.origin.y*yR, _phoneTextField.frame.size.width*xR, _phoneTextField.frame.size.height*yR);
    [_idenTextField setFont:[UIFont fontWithName:@"System Font" size:fontSize14]];
    _idenTextField.frame = CGRectMake(_idenTextField.frame.origin.x*xR, _idenTextField.frame.origin.y*yR, _idenTextField.frame.size.width*xR, _idenTextField.frame.size.height*yR);
    _idenButton.frame = CGRectMake(_idenButton.frame.origin.x*xR, _idenButton.frame.origin.y*yR, _idenButton.frame.size.width*xR, _idenButton.frame.size.height*yR);
    _commitButton.frame = CGRectMake(_commitButton.frame.origin.x*xR, _commitButton.frame.origin.y*yR, _commitButton.frame.size.width*xR, _commitButton.frame.size.height*yR);
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)IdenButton:(UIButton *)sender {
    phone=_phoneTextField.text;
    
    const char *tmp = [phone cStringUsingEncoding:NSUTF8StringEncoding];
    if (phone.length != strlen(tmp))
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"휴대폰 입력 실패"
                                                       message:@"휴대폰 번호를 정확히 입력해 주세요.(- 없이)"
                                                      delegate:self
                                             cancelButtonTitle:nil    /* nil 로 지정할 경우 cancel button 없음 */
                                             otherButtonTitles:@"확인", nil];
        [alert show];
    }
    NSString *check = @"(010|011|016|017|018|019)([0-9]{3,4})([0-9]{4})";
    NSRange match = [phone rangeOfString:check options:NSRegularExpressionSearch];
    if (NSNotFound == match.location)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"휴대폰 입력 실패"
                                                       message:@"휴대폰 번호를 정확히 입력해 주세요.(- 없이)"
                                                      delegate:self
                                             cancelButtonTitle:nil    /* nil 로 지정할 경우 cancel button 없음 */
                                             otherButtonTitles:@"확인", nil];
        [alert show];
    }
    else
    {
        int idenRandomValue = arc4random() % 9000 + 1000;
        idenCode = [NSString stringWithFormat:@"%d",idenRandomValue];
        
        //// Http 통신 ////
        idenCodeResponse = [self idenSmsPost];
        if([idenCodeResponse isEqualToString:@"suc"])
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"알림"
                                                           message:@"인증번호가 전송되었습니다."
                                                          delegate:self
                                                 cancelButtonTitle:nil    /* nil 로 지정할 경우 cancel button 없음 */
                                                 otherButtonTitles:@"확인", nil];
            [alert show];
            
        }
        else
        {
            NSLog(@"error");
        }
        
    }
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // handle continue alert view
    if (alertView.tag == 1)
    {
        UIStoryboard *storyboard = self.storyboard;
        UIViewController *mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"ServiceVC"];
        [self presentViewController:mainViewController animated:NO completion:nil];
    }
}
- (IBAction)commitButton:(UIButton *)sender {
    if([idenCode isEqualToString:_idenTextField.text])
    {
        NSString *result;
        
        if([root isEqualToString:@"normal"])
        {
            HttpPostManager *registerHttp = [[HttpPostManager alloc]init];
            [registerHttp setURL:@"iphone_register3"];
            
            [registerHttp addEntity:@"id" over:login_id];
            [registerHttp addEntity:@"name" over:name];
            [registerHttp addEntity:@"pass1" over:password];
            [registerHttp addEntity:@"pass2" over:password];
            [registerHttp addEntity:@"sex" over: gender];
            [registerHttp addEntity:@"birth" over:birthday];
            [registerHttp addEntity:@"mail" over:mail];
            [registerHttp addEntity:@"phone" over:_phoneTextField.text];
            result = [registerHttp startHttp:@"ios_register"];

        }
        else if([root isEqualToString:@"facebook"])
        {
            HttpPostManager *registerHttp = [[HttpPostManager alloc]init];
            [registerHttp setURL:@"iphone_register3"];
            
            [registerHttp addEntity:@"id" over:login_id];
            [registerHttp addEntity:@"name" over:name];
            [registerHttp addEntity:@"pass1" over:password];
            [registerHttp addEntity:@"pass2" over:password];
            [registerHttp addEntity:@"sex" over: gender];
            [registerHttp addEntity:@"birth" over:birthday];
            [registerHttp addEntity:@"mail" over:mail];
            [registerHttp addEntity:@"phone" over:_phoneTextField.text];
            result = [registerHttp startHttp:@"ios_register"];
        }
        else if([root isEqualToString:@"kakao"])
        {
            HttpPostManager *registerHttp = [[HttpPostManager alloc]init];
            [registerHttp setURL:@"iphone_register3"];
            
            [registerHttp addEntity:@"id" over:login_id];
            [registerHttp addEntity:@"name" over:name];
            [registerHttp addEntity:@"pass1" over:password];
            [registerHttp addEntity:@"pass2" over:password];
            [registerHttp addEntity:@"sex" over: gender];
            [registerHttp addEntity:@"birth" over:birthday];
            [registerHttp addEntity:@"mail" over:mail];
            [registerHttp addEntity:@"phone" over:_phoneTextField.text];
            result = [registerHttp startHttp:@"ios_register"];
        }
        
        
        if ([result isEqual:@"suc"])
        {
            [[NSUserDefaults standardUserDefaults] setObject:login_id forKey:@"loginId"];
            
            [[NSUserDefaults standardUserDefaults] setObject:_phoneTextField.text forKey:@"loginPhoneNum"];
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"알림"
                                                           message:@"휴대폰 인증이 확인되었습니다."
                                                          delegate:self
                                                 cancelButtonTitle:nil    /* nil 로 지정할 경우 cancel button 없음 */
                                                 otherButtonTitles:@"확인", nil];
            alert.tag = 1;
            [alert show];
        }
        else if ([result isEqual:@"fail"])
        {
            printf("fail");
        }
        else
        {
            printf("error");
        }
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"인증실패"
                                                       message:@"인증번호를 정확히 입력해 주세요."
                                                      delegate:self
                                             cancelButtonTitle:nil    /* nil 로 지정할 경우 cancel button 없음 */
                                             otherButtonTitles:@"확인", nil];
        [alert show];
    }
    
    
}
- (NSString *)idenSmsPost
{
    NSString *result;
    HttpPostManager *smsHttp = [[HttpPostManager alloc]init];
    [smsHttp setURL:@"iphone_smspost"];
    [smsHttp addEntity:@"phone" over:_phoneTextField.text];
    [smsHttp addEntity:@"idencode" over:idenCode];
    result = [smsHttp startHttp:@"getSmsPost"];
    return result;
}

@end
