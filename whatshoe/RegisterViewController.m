//
//  RegisterViewController.m
//  whatshoe
//
//  Created by whatshoe on 2015. 11. 1..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import "RegisterViewController.h"
#import "HttpPostManager.h"
#import "RootViewController.h"
#import "SmsIndentifyViewController.h"

@interface RegisterViewController ()

{
    
    Boolean isBoolSelMan;
    Boolean isBoolSelWoman;
    Boolean isBoolSelNone;
    Boolean isBoolSelAgree;
    Boolean isBoolSelInfo;
    NSString *sex;
}


@property (strong, nonatomic) IBOutlet UIView *mainView;

@property (weak, nonatomic) IBOutlet UILabel *navigationBar;
@property (weak, nonatomic) IBOutlet UIButton *barButton;
@property (weak, nonatomic) IBOutlet UILabel *barLabel;



@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UITextField *idTextField;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *password1TextField;

@property (weak, nonatomic) IBOutlet UITextField *password2TextField;
@property (weak, nonatomic) IBOutlet UITextField *birthdayTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;

@property (weak, nonatomic) IBOutlet UILabel *sexselLabel;
@property (weak, nonatomic) IBOutlet UILabel *agreeLabel;
@property (weak, nonatomic) IBOutlet UILabel *agree2Label;
@property (weak, nonatomic) IBOutlet UIImageView *join_infoImage;

@property (weak, nonatomic) IBOutlet UIImageView *join_btnImage;

@property (weak, nonatomic) IBOutlet UIButton *selManButton;
@property (weak, nonatomic) IBOutlet UIButton *selWomanButton;
@property (weak, nonatomic) IBOutlet UIButton *commitButton;
@property (weak, nonatomic) IBOutlet UIButton *selNoButton;
@property (weak, nonatomic) IBOutlet UIButton *selectInfoButton;
@property (weak, nonatomic) IBOutlet UIButton *selectAgreeButton;



@property (weak, nonatomic) IBOutlet UIImageView *selAgreeImage;
@property (weak, nonatomic) IBOutlet UIImageView *selInfoImage;

@property (weak, nonatomic) IBOutlet UIImageView *selManImage;
@property (weak, nonatomic) IBOutlet UIImageView *selWomanImage;
@property (weak, nonatomic) IBOutlet UIImageView *selNoneImage;


@property (weak, nonatomic) IBOutlet UIImageView *line1;
@property (weak, nonatomic) IBOutlet UIImageView *line2;
@property (weak, nonatomic) IBOutlet UIImageView *line3;
@property (weak, nonatomic) IBOutlet UIImageView *line4;
@property (weak, nonatomic) IBOutlet UIImageView *line5;
@property (weak, nonatomic) IBOutlet UIImageView *line6;
@property (weak, nonatomic) IBOutlet UIImageView *line7;

@property (weak, nonatomic) IBOutlet UILabel *necessaryLabel1;
@property (weak, nonatomic) IBOutlet UILabel *necessaryLabel2;
@property (weak, nonatomic) IBOutlet UILabel *necessaryLabel3;
@property (weak, nonatomic) IBOutlet UILabel *necessaryLabel4;




@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tapScroll=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped)];
    tapScroll.cancelsTouchesInView = NO;
    [_scrollview addGestureRecognizer:tapScroll];
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
    
    _logo.frame = CGRectMake(_logo.frame.origin.x*xR, _logo.frame.origin.y*yR, _logo.frame.size.width*xR, _logo.frame.size.height*yR);
   
    _scrollview.frame = CGRectMake(_scrollview.frame.origin.x*xR, _scrollview.frame.origin.y*yR, _scrollview.frame.size.width*xR, (350+_scrollview.frame.size.height)*xR);
    
    
    _join_btnImage.frame = CGRectMake(_join_btnImage.frame.origin.x*xR, _join_btnImage.frame.origin.y*yR, _join_btnImage.frame.size.width*xR, _join_btnImage.frame.size.height*yR);
    _selManButton.frame = CGRectMake(_selManButton.frame.origin.x*xR, _selManButton.frame.origin.y*yR, _selManButton.frame.size.width*xR, _selManButton.frame.size.height*yR);
    _selWomanButton.frame = CGRectMake(_selWomanButton.frame.origin.x*xR, _selWomanButton.frame.origin.y*yR, _selWomanButton.frame.size.width*xR, _selWomanButton.frame.size.height*yR);
    _selectInfoButton.frame = CGRectMake(_selectInfoButton.frame.origin.x*xR, _selectInfoButton.frame.origin.y*yR, _selectInfoButton.frame.size.width*xR, _selectInfoButton.frame.size.height*yR);
    _selectAgreeButton.frame = CGRectMake(_selectAgreeButton.frame.origin.x*xR, _selectAgreeButton.frame.origin.y*yR, _selectAgreeButton.frame.size.width*xR, _selectAgreeButton.frame.size.height*yR);
    _commitButton.frame = CGRectMake(_commitButton.frame.origin.x*xR, _commitButton.frame.origin.y*yR, _commitButton.frame.size.width*xR, _commitButton.frame.size.height*yR);
    _selNoButton.frame = CGRectMake(_selNoButton.frame.origin.x*xR, _selNoButton.frame.origin.y*yR, _selNoButton.frame.size.width*xR, _selNoButton.frame.size.height*yR);
    _selAgreeImage.frame = CGRectMake(_selAgreeImage.frame.origin.x*xR, _selAgreeImage.frame.origin.y*yR, _selAgreeImage.frame.size.width*xR, _selAgreeImage.frame.size.height*yR);
    _selInfoImage.frame =CGRectMake(_selInfoImage.frame.origin.x*xR, _selInfoImage.frame.origin.y*yR, _selInfoImage.frame.size.width*xR, _selInfoImage.frame.size.height*yR);
    _selManImage.frame = CGRectMake(_selManImage.frame.origin.x*xR, _selManImage.frame.origin.y*yR, _selManImage.frame.size.width*xR, _selManImage.frame.size.height*yR);
    _selWomanImage.frame = CGRectMake(_selWomanImage.frame.origin.x*xR, _selWomanImage.frame.origin.y*yR, _selWomanImage.frame.size.width*xR, _selWomanImage.frame.size.height*yR);
    _selNoneImage.frame = CGRectMake(_selNoneImage.frame.origin.x*xR, _selNoneImage.frame.origin.y*yR, _selNoneImage.frame.size.width*xR, _selNoneImage.frame.size.height*yR);

  
    _line1.frame = CGRectMake(_line1.frame.origin.x*xR, _line1.frame.origin.y*yR, _line1.frame.size.width*xR, _line1.frame.size.height*yR);
        _line2.frame = CGRectMake(_line2.frame.origin.x*xR, _line2.frame.origin.y*yR, _line2.frame.size.width*xR, _line2.frame.size.height*yR);
            _line3.frame = CGRectMake(_line3.frame.origin.x*xR, _line3.frame.origin.y*yR, _line3.frame.size.width*xR, _line3.frame.size.height*yR);
        _line4.frame = CGRectMake(_line4.frame.origin.x*xR, _line4.frame.origin.y*yR, _line4.frame.size.width*xR, _line4.frame.size.height*yR);
        _line5.frame = CGRectMake(_line5.frame.origin.x*xR, _line5.frame.origin.y*yR, _line5.frame.size.width*xR, _line5.frame.size.height*yR);
        _line6.frame = CGRectMake(_line6.frame.origin.x*xR, _line6.frame.origin.y*yR, _line6.frame.size.width*xR, _line6.frame.size.height*yR);
        _line7.frame = CGRectMake(_line7.frame.origin.x*xR, _line7.frame.origin.y*yR, _line7.frame.size.width*xR, _line7.frame.size.height*yR);
    /////+font/////
 
    
    float fontSize14 = 14*yR;
    float fontSize18 = 18*yR;
    float fontSize35 = 35*yR;
    
    _barLabel.frame = CGRectMake(_barLabel.frame.origin.x*xR, _barLabel.frame.origin.y*yR, _barLabel.frame.size.width*xR, _barLabel.frame.size.height*yR);
    [_barLabel setFont:[UIFont fontWithName:@"System Font Heavy" size:fontSize18]];
    _idTextField.frame = CGRectMake(_idTextField.frame.origin.x*xR, _idTextField.frame.origin.y*yR, _idTextField.frame.size.width*xR, _idTextField.frame.size.height*yR);
    [_idTextField setFont:[UIFont fontWithName:@"System Font" size:fontSize14]];
    
    _nameTextField.frame = CGRectMake(_nameTextField.frame.origin.x*xR, _nameTextField.frame.origin.y*yR, _nameTextField.frame.size.width*xR, _nameTextField.frame.size.height*yR);
    [_nameTextField setFont:[UIFont fontWithName:@"System Font" size:fontSize14]];
    
    _password1TextField.frame = CGRectMake(_password1TextField.frame.origin.x*xR, _password1TextField.frame.origin.y*yR, _password1TextField.frame.size.width*xR, _password1TextField.frame.size.height*yR);
    [_password1TextField setFont:[UIFont fontWithName:@"System Font" size:fontSize14]];
    
    _password2TextField.frame = CGRectMake(_password2TextField.frame.origin.x*xR, _password2TextField.frame.origin.y*yR, _password2TextField.frame.size.width*xR, _password2TextField.frame.size.height*yR);
    [_password2TextField setFont:[UIFont fontWithName:@"System Font" size:fontSize14]];
    
    _birthdayTextField.frame = CGRectMake(_birthdayTextField.frame.origin.x*xR, _birthdayTextField.frame.origin.y*yR, _birthdayTextField.frame.size.width*xR, _birthdayTextField.frame.size.height*yR);
    [_birthdayTextField setFont:[UIFont fontWithName:@"System Font" size:fontSize14]];
    
    _emailTextField.frame = CGRectMake(_emailTextField.frame.origin.x*xR, _emailTextField.frame.origin.y*yR, _emailTextField.frame.size.width*xR, _emailTextField.frame.size.height*yR);
    [_emailTextField setFont:[UIFont fontWithName:@"System Font" size:fontSize14]];
    
    _phoneTextField.frame = CGRectMake(_phoneTextField.frame.origin.x*xR, _phoneTextField.frame.origin.y*yR, _phoneTextField.frame.size.width*xR, _phoneTextField.frame.size.height*yR);
    [_phoneTextField setFont:[UIFont fontWithName:@"System Font" size:fontSize14]];
    
    _sexselLabel.frame = CGRectMake(_sexselLabel.frame.origin.x*xR, _sexselLabel.frame.origin.y*yR, _sexselLabel.frame.size.width*xR, _sexselLabel.frame.size.height*yR);
    [_sexselLabel setFont:[UIFont fontWithName:@"System Font" size:fontSize14]];
    
    _agreeLabel.frame = CGRectMake(_agreeLabel.frame.origin.x*xR, _agreeLabel.frame.origin.y*yR, _agreeLabel.frame.size.width*xR, _agreeLabel.frame.size.height*yR);
    [_agreeLabel setFont:[UIFont fontWithName:@"System Font" size:fontSize14]];
    
    _agree2Label.frame = CGRectMake(_agree2Label.frame.origin.x*xR, _agree2Label.frame.origin.y*yR, _agree2Label.frame.size.width*xR, _agree2Label.frame.size.height*yR);
    [_agree2Label setFont:[UIFont fontWithName:@"System Font" size:fontSize14]];
    
    _necessaryLabel1.frame = CGRectMake(_necessaryLabel1.frame.origin.x*xR, _necessaryLabel1.frame.origin.y*yR, _necessaryLabel1.frame.size.width*xR, _necessaryLabel1.frame.size.height*yR);
    [_necessaryLabel1 setFont:[UIFont fontWithName:@"System Font" size:fontSize35]];
    _necessaryLabel2.frame = CGRectMake(_necessaryLabel2.frame.origin.x*xR, _necessaryLabel2.frame.origin.y*yR, _necessaryLabel2.frame.size.width*xR, _necessaryLabel2.frame.size.height*yR);
    [_necessaryLabel2 setFont:[UIFont fontWithName:@"System Font" size:fontSize35]];
    _necessaryLabel3.frame = CGRectMake(_necessaryLabel3.frame.origin.x*xR, _necessaryLabel3.frame.origin.y*yR, _necessaryLabel3.frame.size.width*xR, _necessaryLabel3.frame.size.height*yR);
    [_necessaryLabel3 setFont:[UIFont fontWithName:@"System Font" size:fontSize35]];
    _necessaryLabel4.frame = CGRectMake(_necessaryLabel4.frame.origin.x*xR, _necessaryLabel4.frame.origin.y*yR, _necessaryLabel4.frame.size.width*xR, _necessaryLabel4.frame.size.height*yR);
    [_necessaryLabel4 setFont:[UIFont fontWithName:@"System Font" size:fontSize35]];
    
    
    
    _scrollview.showsVerticalScrollIndicator=YES;
    _scrollview.scrollEnabled=YES;
    
    
    [self.view addSubview:_scrollview];
    _scrollview.contentSize = CGSizeMake(_scrollview.frame.size.width, 350*yR+_scrollview.frame.size.height);
    
    
}
-(void)tapped
{
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}





- (IBAction)cancelButton:(UIButton *)sender {
    UIStoryboard *storyboard = self.storyboard;
    UIViewController *mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginVC"];
    [self presentViewController:mainViewController animated:NO completion:nil];
}



- (IBAction)commitButton:(UIButton *)sender {

    if([_idTextField.text isEqual:@""]){
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"아이디를 입력해주세요"
                                  message:nil
                                  delegate:self
                                  cancelButtonTitle: nil
                                  otherButtonTitles:@"OK", nil];
        
        [alertView show];
    }
    else if([_nameTextField.text isEqual:@""]){
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"이름을 입력해주세요"
                                  message:nil
                                  delegate:self
                                  cancelButtonTitle: nil
                                  otherButtonTitles:@"OK", nil];
        
        [alertView show];
    }

    else if([_password1TextField.text isEqual:@""]){
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"비밀번호를 입력해주세요"
                                  message:nil
                                  delegate:self
                                  cancelButtonTitle: nil
                                  otherButtonTitles:@"OK", nil];
        
        [alertView show];
    }
    else if([_password2TextField.text isEqual:@""]){
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"비밀번호 확인을 입력해주세요"
                                  message:nil
                                  delegate:self
                                  cancelButtonTitle: nil
                                  otherButtonTitles:@"OK", nil];
        
        [alertView show];
    }
    else if(isBoolSelInfo==false){
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"이용약관 버튼을 눌러주세요"
                                  message:nil
                                  delegate:self
                                  cancelButtonTitle: nil
                                  otherButtonTitles:@"OK", nil];
        
        [alertView show];
    }
    else if(isBoolSelAgree==false){
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"개인정보 취급방침 버튼을 눌러주세요"
                                  message:nil
                                  delegate:self
                                  cancelButtonTitle: nil
                                  otherButtonTitles:@"OK", nil];
        
        [alertView show];
    }
    else if([_password1TextField.text isEqualToString:_password2TextField.text]==NO){
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"비밀번호 오류"
                                  message:@"비밀번호와 비밀번호 확인에 입력된 텍스트가 다릅니다."
                                  delegate:self
                                  cancelButtonTitle: nil
                                  otherButtonTitles:@"OK", nil];
        
        [alertView show];
    }

    else{
        NSString *result = [self checkIdDup];
        if([result isEqualToString:@"suc"])
        {
            if(sex==nil){
                sex=@"선택 안함";
            }
            else if(_phoneTextField.text==nil){
                _phoneTextField.text=@"";
            }
            else if(_emailTextField.text==nil){
                _emailTextField.text=@"";
            }
            else if(_birthdayTextField.text==nil){
                _birthdayTextField.text=@"";
            }
            
            
            UIStoryboard *storyboard = self.storyboard;
            SmsIndentifyViewController *nextViewController = [storyboard instantiateViewControllerWithIdentifier:@"smsphoneVC"];

            nextViewController.login_id = _idTextField.text;
            nextViewController.name = _nameTextField.text;
            nextViewController.gender = sex;
            nextViewController.birthday = _birthdayTextField.text;
            nextViewController.password = _password1TextField.text;
            nextViewController.mail = _emailTextField.text;
            nextViewController.phone = _phoneTextField.text;
            nextViewController.root = @"normal";
            [self presentViewController:nextViewController animated:NO completion:nil];
        }
        else
        {
            UIAlertView *alertView = [[UIAlertView alloc]
                                      initWithTitle:@"아이디 중복"
                                      message:@"중복된 아이디입니다."
                                      delegate:self
                                      cancelButtonTitle: nil
                                      otherButtonTitles:@"OK", nil];
            
            [alertView show];
        }
    }
    
    
}






- (IBAction)selectMan:(UIButton *)sender {
    isBoolSelMan = true;
    if(isBoolSelMan)
    {
        _selManImage.image = [UIImage imageNamed:@"join_sex_man_press.png"];
        
        sex = @"남";
        
    }
    if(isBoolSelWoman)
    {
        _selWomanImage.image = [UIImage imageNamed:@"join_sex_woman.png"];
        isBoolSelWoman = false;
    }
    if(isBoolSelNone)
    {
        _selNoneImage.image = [UIImage imageNamed:@"join_sex_no.png"];
        isBoolSelNone = false;
    }
    
}
- (IBAction)selectWoman:(UIButton *)sender {
    isBoolSelWoman = true;
    if(isBoolSelMan)
    {
        _selManImage.image = [UIImage imageNamed:@"join_sex_man.png"];
        isBoolSelMan = false;
    }
    if(isBoolSelWoman)
    {
        _selWomanImage.image = [UIImage imageNamed:@"join_sex_woman_press.png"];
        sex = @"여";
    }
    if(isBoolSelNone)
    {
        _selNoneImage.image = [UIImage imageNamed:@"join_sex_no.png"];
        isBoolSelNone = false;
    }
    
}
- (IBAction)selectNo:(UIButton *)sender {
    isBoolSelNone = true;
    if(isBoolSelMan)
    {
        _selManImage.image = [UIImage imageNamed:@"join_sex_man.png"];
        isBoolSelMan = false;
    }
    if(isBoolSelWoman)
    {
        _selWomanImage.image = [UIImage imageNamed:@"join_sex_woman.png"];
        isBoolSelWoman = false;
    }
    if(isBoolSelNone)
    {
        _selNoneImage.image = [UIImage imageNamed:@"join_sex_no_press.png"];
        sex = @"선택 안함";
    }
    
}
- (IBAction)selectAgree:(UIButton *)sender {
    if(isBoolSelAgree)
    {
        _selAgreeImage.image = [UIImage imageNamed:@"join_agree.png"];
        isBoolSelAgree = false;
    }
    else
    {
        _selAgreeImage.image = [UIImage imageNamed:@"join_agree_press.png"];
        isBoolSelAgree = true;
    }
    
}
- (IBAction)selectInfo:(UIButton *)sender {
    if(isBoolSelInfo)
    {
        _selInfoImage.image = [UIImage imageNamed:@"join_agree.png"];
        isBoolSelInfo = false;
    }
    else
    {
        _selInfoImage.image = [UIImage imageNamed:@"join_agree_press.png"];
        isBoolSelInfo = true;
    }
    
}

- (NSString *)checkIdDup
{
    NSString *result;
    HttpPostManager *checkIdHttp = [[HttpPostManager alloc]init];
    [checkIdHttp setURL:@"iphone_checkIdDup"];
    [checkIdHttp addEntity:@"id" over:_idTextField.text];
    result = [checkIdHttp startHttp:@"getCheckIdDup"];
    return result;
}
@end
