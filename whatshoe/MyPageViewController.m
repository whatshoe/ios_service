//
//  MyPageViewController.m
//  whatshoe
//
//  Created by comso on 2015. 12. 28..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import "MyPageViewController.h"
#import "HttpPostManager.h"
#import "Member.h"

@interface MyPageViewController () <UITextFieldDelegate>
{
    NSString *member_id;
    Member *info;
    float shoeSize_uk;
    float shoeSize_us;
    float shoeSize_eu;
    float shoeSize_kr;
    Boolean isTrueMan;
    BOOL isViewWillAppear;
    BOOL emailTF_switch;
    BOOL emailTF_switch2;
}
@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UILabel *navigationBar;
@property (weak, nonatomic) IBOutlet UIButton *barButton;
@property (weak, nonatomic) IBOutlet UILabel *barLabel;

@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *middleView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@property (weak, nonatomic) IBOutlet UILabel *label00_Outlet;
@property (weak, nonatomic) IBOutlet UILabel *label01_Outlet;
@property (weak, nonatomic) IBOutlet UILabel *label02_Outlet;
@property (weak, nonatomic) IBOutlet UILabel *label03_Outlet;
@property (weak, nonatomic) IBOutlet UILabel *label04_Outlet;
@property (weak, nonatomic) IBOutlet UILabel *label05_Outlet;
@property (weak, nonatomic) IBOutlet UILabel *label06_Outlet;
@property (weak, nonatomic) IBOutlet UILabel *label07_Outlet;
@property (weak, nonatomic) IBOutlet UILabel *label08_Outlet;

@property (weak, nonatomic) IBOutlet UILabel *label09_Outlet;
@property (weak, nonatomic) IBOutlet UILabel *label10_Outlet;
@property (weak, nonatomic) IBOutlet UILabel *label10_1_Outlet;
@property (weak, nonatomic) IBOutlet UILabel *label11_Outlet;
@property (weak, nonatomic) IBOutlet UILabel *label11_1_Outlet;
@property (weak, nonatomic) IBOutlet UILabel *label12_Outlet;
@property (weak, nonatomic) IBOutlet UILabel *label12_1_Outlet;

@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UILabel *lvLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UITextField *shoeSizeTF;
@property (weak, nonatomic) IBOutlet UIButton *shoeSizeFuncButton;
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *passTF;
@property (weak, nonatomic) IBOutlet UITextField *dateTF;
@property (weak, nonatomic) IBOutlet UITextField *emailTF;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumLabel;

@property (weak, nonatomic) IBOutlet UIButton *womanButton;
@property (weak, nonatomic) IBOutlet UIButton *manButton;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIButton *singoutButton;
@property (weak, nonatomic) IBOutlet UIButton *shoeSizeButton;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation MyPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getMemberInfo];
    [self setMemberInfo];
    [self getfootSize];
    [self transformFucntion];

    /////// textfield tap func
    UITapGestureRecognizer *tapScroll=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped)];
    tapScroll.cancelsTouchesInView = NO;
    [_scrollView addGestureRecognizer:tapScroll];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        _mainView.frame = CGRectMake(_mainView.frame.origin.x*xR, _mainView.frame.origin.y*yR, _mainView.frame.size.width*xR, _mainView.frame.size.height*yR);
        _navigationBar.frame = CGRectMake(_navigationBar.frame.origin.x*xR, _navigationBar.frame.origin.y*yR, _navigationBar.frame.size.width*xR, _navigationBar.frame.size.height*yR);
        _barButton.frame = CGRectMake(_barButton.frame.origin.x*xR, _barButton.frame.origin.y*yR, _barButton.frame.size.width*xR, _barButton.frame.size.height*yR);
        
        float fontSize12 = 12*yR;
        float fontSize13 = 13*yR;
        float fontSize15 = 15*yR;
        float fontSize18 = 18*yR;
        
        _barLabel.frame = CGRectMake(_barLabel.frame.origin.x*xR, _barLabel.frame.origin.y*yR, _barLabel.frame.size.width*xR, _barLabel.frame.size.height*yR);
        [_barLabel setFont:[UIFont fontWithName:@"System Font Heavy" size:fontSize18]];
        
        _topView.frame = CGRectMake(_topView.frame.origin.x*xR, _topView.frame.origin.y*yR, _topView.frame.size.width*xR, _topView.frame.size.height*yR);
        _middleView.frame = CGRectMake(_middleView.frame.origin.x*xR, _middleView.frame.origin.y*yR, _middleView.frame.size.width*xR, _middleView.frame.size.height*yR);
        _bottomView.frame = CGRectMake(_bottomView.frame.origin.x*xR, _bottomView.frame.origin.y*yR, _bottomView.frame.size.width*xR, _bottomView.frame.size.height*yR);
        
        _label00_Outlet.frame = CGRectMake(_label00_Outlet.frame.origin.x*xR, _label00_Outlet.frame.origin.y*yR, _label00_Outlet.frame.size.width*xR, _label00_Outlet.frame.size.height*yR);
        [_label00_Outlet setFont:[UIFont fontWithName:@"System Font Bold" size:fontSize15]];
        _label01_Outlet.frame = CGRectMake(_label01_Outlet.frame.origin.x*xR, _label01_Outlet.frame.origin.y*yR, _label01_Outlet.frame.size.width*xR, _label01_Outlet.frame.size.height*yR);
        [_label01_Outlet setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
        _label02_Outlet.frame = CGRectMake(_label02_Outlet.frame.origin.x*xR, _label02_Outlet.frame.origin.y*yR, _label02_Outlet.frame.size.width*xR, _label02_Outlet.frame.size.height*yR);
        [_label02_Outlet setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
        _label03_Outlet.frame = CGRectMake(_label03_Outlet.frame.origin.x*xR, _label03_Outlet.frame.origin.y*yR, _label03_Outlet.frame.size.width*xR, _label03_Outlet.frame.size.height*yR);
        [_label03_Outlet setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
        _label04_Outlet.frame = CGRectMake(_label04_Outlet.frame.origin.x*xR, _label04_Outlet.frame.origin.y*yR, _label04_Outlet.frame.size.width*xR, _label04_Outlet.frame.size.height*yR);
        [_label04_Outlet setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
        _label05_Outlet.frame = CGRectMake(_label05_Outlet.frame.origin.x*xR, _label05_Outlet.frame.origin.y*yR, _label05_Outlet.frame.size.width*xR, _label05_Outlet.frame.size.height*yR);
        [_label05_Outlet setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
        _label06_Outlet.frame = CGRectMake(_label06_Outlet.frame.origin.x*xR, _label06_Outlet.frame.origin.y*yR, _label06_Outlet.frame.size.width*xR, _label06_Outlet.frame.size.height*yR);
        [_label06_Outlet setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
        _label07_Outlet.frame = CGRectMake(_label07_Outlet.frame.origin.x*xR, _label07_Outlet.frame.origin.y*yR, _label07_Outlet.frame.size.width*xR, _label07_Outlet.frame.size.height*yR);
        [_label07_Outlet setFont:[UIFont fontWithName:@"System Font" size:fontSize15]];
        _label08_Outlet.frame = CGRectMake(_label08_Outlet.frame.origin.x*xR, _label08_Outlet.frame.origin.y*yR, _label08_Outlet.frame.size.width*xR, _label08_Outlet.frame.size.height*yR);
        [_label08_Outlet setFont:[UIFont fontWithName:@"System Font" size:fontSize15]];
        _label09_Outlet.frame = CGRectMake(_label09_Outlet.frame.origin.x*xR, _label09_Outlet.frame.origin.y*yR, _label09_Outlet.frame.size.width*xR, _label09_Outlet.frame.size.height*yR);
        [_label09_Outlet setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
        _label10_Outlet.frame = CGRectMake(_label10_Outlet.frame.origin.x*xR, _label10_Outlet.frame.origin.y*yR, _label10_Outlet.frame.size.width*xR, _label10_Outlet.frame.size.height*yR);
        [_label10_Outlet setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
        _label10_1_Outlet.frame = CGRectMake(_label10_1_Outlet.frame.origin.x*xR, _label10_1_Outlet.frame.origin.y*yR, _label10_1_Outlet.frame.size.width*xR, _label10_1_Outlet.frame.size.height*yR);
        [_label10_1_Outlet setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
        [self drawBottomBorder:_label10_1_Outlet border:1];
        _label11_Outlet.frame = CGRectMake(_label11_Outlet.frame.origin.x*xR, _label11_Outlet.frame.origin.y*yR, _label11_Outlet.frame.size.width*xR, _label11_Outlet.frame.size.height*yR);
        [_label11_Outlet setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
        
        _label11_1_Outlet.frame = CGRectMake(_label11_1_Outlet.frame.origin.x*xR, _label11_1_Outlet.frame.origin.y*yR, _label11_1_Outlet.frame.size.width*xR, _label11_1_Outlet.frame.size.height*yR);
        [_label11_1_Outlet setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
        [self drawBottomBorder:_label11_1_Outlet border:1];
        _label12_Outlet.frame = CGRectMake(_label12_Outlet.frame.origin.x*xR, _label12_Outlet.frame.origin.y*yR, _label12_Outlet.frame.size.width*xR, _label12_Outlet.frame.size.height*yR);
        [_label12_Outlet setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
        _label12_1_Outlet.frame = CGRectMake(_label12_1_Outlet.frame.origin.x*xR, _label12_1_Outlet.frame.origin.y*yR, _label12_1_Outlet.frame.size.width*xR, _label12_1_Outlet.frame.size.height*yR);
        [_label12_1_Outlet setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
        [self drawBottomBorder:_label12_1_Outlet border:1];
        _profileImageView.frame = CGRectMake(_profileImageView.frame.origin.x*xR, _profileImageView.frame.origin.y*yR, _profileImageView.frame.size.width*xR, _profileImageView.frame.size.height*yR);
        
        [_shoeSizeTF setFont:[UIFont fontWithName:@"System Font" size:fontSize15]];
        _shoeSizeTF.frame = CGRectMake(_shoeSizeTF.frame.origin.x*xR, _shoeSizeTF.frame.origin.y*yR, _shoeSizeTF.frame.size.width*xR, _shoeSizeTF.frame.size.height*yR);
        _shoeSizeTF.delegate = self;
        [_nameTF setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
        _nameTF.frame = CGRectMake(_nameTF.frame.origin.x*xR, _nameTF.frame.origin.y*yR, _nameTF.frame.size.width*xR, _nameTF.frame.size.height*yR);
        _nameTF.delegate = self;
        
        [_passTF setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
        _passTF.frame = CGRectMake(_passTF.frame.origin.x*xR, _passTF.frame.origin.y*yR, _passTF.frame.size.width*xR, _passTF.frame.size.height*yR);
        _passTF.delegate = self;
        [_dateTF setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
        _dateTF.frame = CGRectMake(_dateTF.frame.origin.x*xR, _dateTF.frame.origin.y*yR, _dateTF.frame.size.width*xR, _dateTF.frame.size.height*yR);
        _dateTF.delegate = self;
        [_emailTF setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
        _emailTF.frame = CGRectMake(_emailTF.frame.origin.x*xR, _emailTF.frame.origin.y*yR, _emailTF.frame.size.width*xR, _emailTF.frame.size.height*yR);
        _emailTF.delegate = self;
        [_idLabel setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
        _idLabel.frame = CGRectMake(_idLabel.frame.origin.x*xR, _idLabel.frame.origin.y*yR, _idLabel.frame.size.width*xR, _idLabel.frame.size.height*yR);
        [_lvLabel setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
        _lvLabel.frame = CGRectMake(_lvLabel.frame.origin.x*xR, _lvLabel.frame.origin.y*yR, _lvLabel.frame.size.width*xR, _lvLabel.frame.size.height*yR);
        [_phoneLabel setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
        _phoneLabel.frame = CGRectMake(_phoneLabel.frame.origin.x*xR, _phoneLabel.frame.origin.y*yR, _phoneLabel.frame.size.width*xR, _phoneLabel.frame.size.height*yR);
        [_phoneNumLabel setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
        _phoneNumLabel.frame = CGRectMake(_phoneNumLabel.frame.origin.x*xR, _phoneNumLabel.frame.origin.y*yR, _phoneNumLabel.frame.size.width*xR, _phoneNumLabel.frame.size.height*yR);
        
        _shoeSizeFuncButton.frame = CGRectMake(_shoeSizeFuncButton.frame.origin.x*xR, _shoeSizeFuncButton.frame.origin.y*yR, _shoeSizeFuncButton.frame.size.width*xR, _shoeSizeFuncButton.frame.size.height*yR);
        _womanButton.frame = CGRectMake(_womanButton.frame.origin.x*xR, _womanButton.frame.origin.y*yR, _womanButton.frame.size.width*xR, _womanButton.frame.size.height*yR);
        _manButton.frame = CGRectMake(_manButton.frame.origin.x*xR, _manButton.frame.origin.y*yR, _manButton.frame.size.width*xR, _manButton.frame.size.height*yR);
        _saveButton.frame = CGRectMake(_saveButton.frame.origin.x*xR, _saveButton.frame.origin.y*yR, _saveButton.frame.size.width*xR, _saveButton.frame.size.height*yR);
        _singoutButton.frame = CGRectMake(_singoutButton.frame.origin.x*xR, _singoutButton.frame.origin.y*yR, _singoutButton.frame.size.width*xR, _singoutButton.frame.size.height*yR);
        _singoutButton.titleLabel.font = [UIFont fontWithName:@"System Font" size:fontSize13];
        _shoeSizeButton.frame = CGRectMake(_shoeSizeButton.frame.origin.x*xR, _shoeSizeButton.frame.origin.y*yR, _shoeSizeButton.frame.size.width*xR, _shoeSizeButton.frame.size.height*yR);
        _shoeSizeButton.titleLabel.font = [UIFont fontWithName:@"System Font" size:fontSize15];
        
        _scrollView.frame = CGRectMake(_scrollView.frame.origin.x*xR, _scrollView.frame.origin.y*yR, _scrollView.frame.size.width*xR, _scrollView.frame.size.height*yR);
        _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width, 610*yR);
        _scrollView.showsVerticalScrollIndicator = YES;
        _scrollView.scrollEnabled=YES;
        
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillShow:)
                                                     name:@"UIKeyboardWillShowNotification"
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardDidHide:)
                                                     name:@"UIKeyboardDidHideNotification"
                                                   object:nil];
    }
    
    
}
/////////////////////////터치했을때 텍스트에서 벗어나는 메소드//////////////////////////
-(void)tapped
{
    [self.view endEditing:YES];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [_shoeSizeTF endEditing:YES];
    [_nameTF endEditing:YES];
    [_passTF endEditing:YES];
    [_emailTF endEditing:YES];
    [_dateTF endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField.returnKeyType == UIReturnKeyNext) {
        if(textField == _nameTF)
        {
            [_nameTF resignFirstResponder];
            [_passTF becomeFirstResponder];
        }
        else if(textField == _passTF)
        {
            [_passTF resignFirstResponder];
            [_dateTF becomeFirstResponder];
        }
        else if(textField == _dateTF)
        {
            [_dateTF resignFirstResponder];
            [_emailTF becomeFirstResponder];
        }
    }
    else if(textField.returnKeyType == UIReturnKeyDone)
    {
        if(textField == _shoeSizeTF)
        {
            [_shoeSizeTF resignFirstResponder];
            [self shoeSizeFuncButton:_shoeSizeFuncButton];
            
        }
        else if(textField == _emailTF)
        {
            [_emailTF resignFirstResponder];
        }
    }
    return YES;
}

- (IBAction)cancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)womanSelButton:(UIButton *)sender {
    if(isTrueMan)
    {
        [_manButton setImage:[UIImage imageNamed:@"mypage_checkbox.png"] forState:UIControlStateNormal];
        [_womanButton setImage:[UIImage imageNamed:@"mypage_checkbox_push.png"] forState:UIControlStateNormal];
        info.gender = @"여";
        [self transformFucntion];
        isTrueMan = false;
    }
}
- (IBAction)manSelButton:(UIButton *)sender {
    if(!isTrueMan)
    {
        [_manButton setImage:[UIImage imageNamed:@"mypage_checkbox_push.png"] forState:UIControlStateNormal];
        [_womanButton setImage:[UIImage imageNamed:@"mypage_checkbox.png"] forState:UIControlStateNormal];
        info.gender = @"남";
        [self transformFucntion];
        isTrueMan = true;
    }
}
- (IBAction)saveInfoButton:(UIButton *)sender {
    [self getMemberInfoSave];
    [[NSUserDefaults standardUserDefaults] setObject:_nameTF.text forKey:@"nickName"];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"알림"
                                                   message:@"정보가 저장되었습니다."
                                                  delegate:self
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"확인", nil];
    [alert show];
    
}
- (IBAction)signoutButton:(UIButton *)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"알림"
                                                   message:@"준비중입니다."
                                                  delegate:self
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"확인", nil];
    // alert창을 띄우는 method는 show이다.
    [alert show];
}


- (IBAction)emailTF_begin:(UITextField *)sender {
    emailTF_switch = true;
    emailTF_switch2 = false;
}

- (IBAction)emailTF_end:(UITextField *)sender {

}

- (IBAction)exit:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"알림"
                                                   message:@"준비중입니다."
                                                  delegate:self
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"확인", nil];
    // alert창을 띄우는 method는 show이다.
    [alert show];
}


- (void) keyboardWillShow:(NSNotification *)note {
    if(!emailTF_switch2)
    {
        emailTF_switch2 = true;
        if(emailTF_switch)
        {
            
            NSDictionary *userInfo = [note userInfo];
            CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
            
            CGSize scroll_contentSize = _scrollView.contentSize;
            scroll_contentSize.height += kbSize.height;
            
            float scroll_point_y = _scrollView.contentOffset.y;
            float scroll_point_x = _scrollView.contentOffset.x;
            scroll_point_y += kbSize.height;
            [UIView animateWithDuration:0.4 animations:^{
                _scrollView.contentSize = scroll_contentSize;
                [_scrollView setContentOffset:CGPointMake(scroll_point_x,scroll_point_y)];
            }];
        }
    }
}
- (void) keyboardDidHide:(NSNotification *)note {
    if(emailTF_switch)
    {
        NSDictionary *userInfo = [note userInfo];
        CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
        
        CGSize scroll_contentSize = _scrollView.contentSize;
        scroll_contentSize.height -= kbSize.height;
        
        float scroll_point_y = _scrollView.contentOffset.y;
        float scroll_point_x = _scrollView.contentOffset.x;
        scroll_point_y -= kbSize.height;
        [UIView animateWithDuration:0.2 animations:^{
            _scrollView.contentSize = scroll_contentSize;
            [_scrollView setContentOffset:CGPointMake(scroll_point_x,scroll_point_y)];
            
        }];
        emailTF_switch = false;
        emailTF_switch2 = false;
    }
}
- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (IBAction)showShoeSizeButton:(UIButton *)sender {
    UIStoryboard *storyboard = self.storyboard;
    UIViewController *mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"ShoeSizeVC"];
    [mainViewController setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    UINavigationController *navCon = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    navCon.navigationBarHidden = YES;
    navCon.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController:navCon animated:YES completion:nil];
}
//발사이즈
- (IBAction)shoeSizeFuncButton:(UIButton *)sender {
    NSString *size = _shoeSizeTF.text;
    int size_int = [size intValue];
    if(size.length == 3)
    {
        if((size_int >=210)&&(size_int <=300))
        {
            [self transformFucntion];
            [self footSizehttp];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"알림"
                                                           message:@"발 사이즈 입력을 정확히 해주세요."
                                                          delegate:self
                                                 cancelButtonTitle:nil
                                                 otherButtonTitles:@"확인", nil];
            [alert show];
            _shoeSizeTF.text = @"";
        }
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"알림"
                                                       message:@"발 사이즈 입력을 정확히 해주세요."
                                                      delegate:self
                                             cancelButtonTitle:nil
                                             otherButtonTitles:@"확인", nil];
        [alert show];
        _shoeSizeTF.text = @"";
    }
}


-(void)transformFucntion
{
    if(![_shoeSizeTF.text isEqualToString:@""])
    {
        shoeSize_kr = [_shoeSizeTF.text floatValue];;
        [self shoeSizeTransform];
        _label10_1_Outlet.text = [NSString stringWithFormat:@"%.1f", shoeSize_us];
        _label11_1_Outlet.text = [NSString stringWithFormat:@"%.1f", shoeSize_eu];
        _label12_1_Outlet.text = [NSString stringWithFormat:@"%.1f", shoeSize_uk];
    }
    else
    {
        _label10_1_Outlet.text = @"";
        _label11_1_Outlet.text = @"";
        _label12_1_Outlet.text = @"";
    }
}

-(void)shoeSizeTransform
{
    if([info.gender isEqualToString:@"여"])
    {
        shoeSize_us = shoeSize_kr/10.0 - 17;
        shoeSize_uk = shoeSize_us - 2;
        shoeSize_eu = shoeSize_us + 31;
        
    }
    else if([info.gender isEqualToString:@"남"])
    {
        shoeSize_us = shoeSize_kr/10.0 - 18;
        shoeSize_uk = shoeSize_us - 0.5;
        shoeSize_eu = shoeSize_us + 33;
    }
}
-(void)setMemberInfo
{
    _label00_Outlet.text = info.name;
    _idLabel.text = member_id;
    _nameTF.text = info.name;
    _dateTF.text = info.date;
    _emailTF.text = info.email;
    NSString *phoneNumber = [[info.phone substringFromIndex : 0] substringToIndex : 3];
    phoneNumber = [phoneNumber stringByAppendingString:@" - "];
    phoneNumber = [phoneNumber stringByAppendingString:[[info.phone substringFromIndex : 3] substringToIndex : 4]];
    phoneNumber = [phoneNumber stringByAppendingString:@" - "];
    phoneNumber = [phoneNumber stringByAppendingString:[[info.phone substringFromIndex : 7] substringToIndex : 4]];
    _phoneNumLabel.text = phoneNumber;
    
    if([info.gender isEqualToString:@"남"])
    {
        isTrueMan = true;
    }
    
    if(isTrueMan) // 남자
    {
        [_manButton setImage:[UIImage imageNamed:@"mypage_checkbox_push.png"] forState:UIControlStateNormal];
        [_womanButton setImage:[UIImage imageNamed:@"mypage_checkbox.png"] forState:UIControlStateNormal];
    }
    else // 여자
    {
        info.gender = @"여";
        [_manButton setImage:[UIImage imageNamed:@"mypage_checkbox.png"] forState:UIControlStateNormal];
        [_womanButton setImage:[UIImage imageNamed:@"mypage_checkbox_push.png"] forState:UIControlStateNormal];
    }
}
- (void)getMemberInfo //정보 가져오기
{
    member_id = [[NSUserDefaults standardUserDefaults] objectForKey:@"loginId"];
    HttpPostManager *orderStateHttp = [[HttpPostManager alloc]init];
    [orderStateHttp setURL:@"iphone_getmemberinfo"];
    [orderStateHttp addEntity:@"id" over:member_id];

    info = (Member*)[orderStateHttp startHttp:@"getMemberInfo"];
}

- (void)getMemberInfoSave //정보 수정
{
    NSString *result;
    HttpPostManager *orderStateHttp = [[HttpPostManager alloc]init];
    [orderStateHttp setURL:@"iphone_getmemberinfoSave"];
    [orderStateHttp addEntity:@"id" over:member_id];
    [orderStateHttp addEntity:@"name" over:_nameTF.text];
    [orderStateHttp addEntity:@"password" over:_passTF.text];
    [orderStateHttp addEntity:@"date" over:[info dateFormatCoding2:_dateTF.text]];
    [orderStateHttp addEntity:@"email" over:_emailTF.text];
    [orderStateHttp addEntity:@"gender" over:[info genderFormatCoding2:info.gender]];
    
    result = [orderStateHttp startHttp:@"getMemberInfo"];
}

- (void)drawBottomBorder:(UIView*)view border:(int)border
{
    NSInteger borderThickness = border;
    UIColor *color_a1a1a1 = [UIColor colorWithRed:(110.0 / 255.0) green:(110.0 / 255.0) blue:(110.0 / 255.0) alpha: 1];
    UIView *bottomBorder = [UIView new];
    bottomBorder.backgroundColor = color_a1a1a1;
    bottomBorder.alpha = 1;
    bottomBorder.frame = CGRectMake(0, view.frame.size.height - borderThickness, view.frame.size.width, borderThickness);
    [view addSubview:bottomBorder];
    
}
-(void)footSizehttp{
    NSString *result;
    member_id = [[NSUserDefaults standardUserDefaults] objectForKey:@"loginId"];
    NSString *size = _shoeSizeTF.text;
    HttpPostManager *footSizehttp = [[HttpPostManager alloc]init];
    [footSizehttp setURL:@"iphone_footsize"];
    [footSizehttp addEntity:@"id" over:member_id];
    [footSizehttp addEntity:@"foot_size" over:size];
    result = [footSizehttp startHttp:@"iphone_footsize"];
    
}
-(void)getfootSize{
    NSString *result;
    member_id = [[NSUserDefaults standardUserDefaults] objectForKey:@"loginId"];

    HttpPostManager *footSizehttp = [[HttpPostManager alloc]init];
    [footSizehttp setURL:@"iphone_getfootsize"];
    [footSizehttp addEntity:@"id" over:member_id];
    result = [footSizehttp startHttp:@"iphone_footsize"];
    _shoeSizeTF.text=result;
}
@end
