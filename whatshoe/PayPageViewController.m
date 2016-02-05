

//
//  PayPageViewController.m
//  whatshoe
//
//  Created by comso on 2015. 11. 7..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import "PayPageViewController.h"
#import "PayWebViewController.h"
#import "payCompleteViewController.h"
#import "PayDetailViewController.h"
#import "HttpPostManager.h"
#import "AppDelegate.h"
#import "MapViewController.h"
#import "RootViewController.h"
#import "SelectCode.h"

@interface PayPageViewController () <UITextFieldDelegate>
{
    NSString *order_code;
    NSString *order_name; //ID
    NSString *message;
    NSString *order_state;  //0
    NSString *order_text;
    NSString *order_with; //결제수단
    NSString *order_phone;
    NSString *order_address;
    NSString *order_time;
    NSString *order_address_basic;
    NSString *order_address_detail;
    NSString *code;
    NSString *order_price;
    NSArray *_feedItems;
    int feedItemNum;
    int order_list_count;
    Boolean isDirectButton;
    BOOL isViewWillAppear;
    
}

@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (weak, nonatomic) IBOutlet UIButton *barButton;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;

@property (weak, nonatomic) IBOutlet UILabel *barLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *servicelistLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *onelineLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalpricenameLabel;

@property (weak, nonatomic) IBOutlet UILabel *total_price;
@property (weak, nonatomic) IBOutlet UILabel *oneLabel;
@property (weak, nonatomic) IBOutlet UILabel *pointLabel;
@property (weak, nonatomic) IBOutlet UILabel *couponLabel;

@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
@property (weak, nonatomic) IBOutlet UITextField *detailTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *oneLineTextField;
@property (weak, nonatomic) IBOutlet UITextField *oneLineTextField2;

@property (weak, nonatomic) IBOutlet UILabel *fifteenLabel;

@property (weak, nonatomic) IBOutlet UIButton *paycancelButton;
@property (weak, nonatomic) IBOutlet UIButton *paydirectButton;
@property (weak, nonatomic) IBOutlet UIButton *paycardButton;
@property (weak, nonatomic) IBOutlet UIButton *payphoneButton;
@property (weak, nonatomic) IBOutlet UIButton *paypointButton;
@property (weak, nonatomic) IBOutlet UIButton *couponButton;

@property (weak, nonatomic) IBOutlet UIImageView *locationImage;
@property (weak, nonatomic) IBOutlet UIImageView *phoneImage;
@property (weak, nonatomic) IBOutlet UIImageView *messageImage;
@property (weak, nonatomic) IBOutlet UIImageView *confirmImage;
@property (weak, nonatomic) IBOutlet UIImageView *pointImage;
@property (weak, nonatomic) IBOutlet UIImageView *couponImage;

@property (weak, nonatomic) IBOutlet UILabel *payInfoLabel;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property (weak, nonatomic) IBOutlet UIButton *detailButton;
@property (weak, nonatomic) IBOutlet UIButton *parcelButton;
@property (weak, nonatomic) IBOutlet UIView *totalPriceView;
@property (weak, nonatomic) IBOutlet UIImageView *totalPriceImageView;
@property (weak, nonatomic) IBOutlet UIImageView *detailLine;



@end

@implementation PayPageViewController
@synthesize segueData_2;
@synthesize segueData_3;
@synthesize serviceArray;
@synthesize serviceTotalPrice;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.activityIndicatorView stopAnimating];

    
    // Do any additional setup after loading the view.
    order_address_basic = segueData_2;
    _addressTextField.text = order_address_basic;
    order_address_detail = segueData_3;
    _detailTextField.text = order_address_detail;
    order_phone = [[NSUserDefaults standardUserDefaults] objectForKey:@"loginPhoneNum"];
    _phoneTextField.text = order_phone;
    
    [self mapTotalCountPrice];
    
    
    
    ///get point
    NSString *point = [self pointHttp];
    
    
    
    
    /////// textfield tap func
    UITapGestureRecognizer *tapScroll=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped)];
    tapScroll.cancelsTouchesInView = NO;
    [_scrollview addGestureRecognizer:tapScroll];
    //////
    
    
    /////현재시간
    order_time = [[NSString alloc]init];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSDate *now = [NSDate date];
    
    [formatter setDateFormat:@"yyyy.MM.dd HH:mm:ss"];
    
    order_time = [formatter stringFromDate:now];
    
    
    
    
    
    //order List count
    order_list_count = (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"order_list_count"] + 1;
    
    ///노티피케이션///
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(showReceivedMessage:)
                                                 name:appDelegate.messageKey
                                               object:nil];
    
    [self.activityIndicatorView layer].zPosition = 1;
}

-(void)viewWillAppear:(BOOL)animated
{
    if(!isViewWillAppear)
    {
        isViewWillAppear = true;
        [super viewWillAppear:NO];
        float xR = [[NSUserDefaults standardUserDefaults] floatForKey:@"xRatio"];
        float yR = [[NSUserDefaults standardUserDefaults] floatForKey:@"yRatio"];
        _activityIndicatorView.frame = CGRectMake(_activityIndicatorView.frame.origin.x*xR, _activityIndicatorView.frame.origin.y*yR, _activityIndicatorView.frame.size.width*xR, _activityIndicatorView.frame.size.height*yR);
        ///테이블에 인자를 넣어준다.///
        
        
        ////+font//////
        float fontSize12 = 12*yR;
        float fontSize13 = 13*yR;
        float fontSize14 = 14*yR;
        float fontSize15 = 15*yR;
        float fontSize18 = 18*yR;
        //////////////////////////컨포넌트 재설정/////////////////////////////////
        _mainView.frame = CGRectMake(_mainView.frame.origin.x*xR, _mainView.frame.origin.y*yR, _mainView.frame.size.width*xR, _mainView.frame.size.height*yR);
        _scrollview.frame = CGRectMake(_scrollview.frame.origin.x*xR, _scrollview.frame.origin.y*yR, _scrollview.frame.size.width*xR, _scrollview.frame.size.height*yR);
        
        _navigationBar.frame = CGRectMake(_navigationBar.frame.origin.x*xR, _navigationBar.frame.origin.y*yR, _navigationBar.frame.size.width*xR, _navigationBar.frame.size.height*yR);
        _barButton.frame = CGRectMake(_barButton.frame.origin.x*xR, _barButton.frame.origin.y*yR, _barButton.frame.size.width*xR, _barButton.frame.size.height*yR);
        _paycancelButton.frame = CGRectMake(_paycancelButton.frame.origin.x*xR, _paycancelButton.frame.origin.y*yR, _paycancelButton.frame.size.width*xR, _paycancelButton.frame.size.height*yR);
        _paycancelButton.titleLabel.font = [UIFont fontWithName:@"System Font Heavy" size:fontSize13];
        _barLabel.frame = CGRectMake(_barLabel.frame.origin.x*xR, _barLabel.frame.origin.y*yR, _barLabel.frame.size.width*xR, _barLabel.frame.size.height*yR);
        [_barLabel setFont:[UIFont fontWithName:@"System Font Heavy" size:fontSize18]];
        _locationLabel.frame = CGRectMake(_locationLabel.frame.origin.x*xR, _locationLabel.frame.origin.y*yR, _locationLabel.frame.size.width*xR, _locationLabel.frame.size.height*yR);
        [_locationLabel setFont:[UIFont fontWithName:@"System Font Heavy" size:fontSize13]];
        _servicelistLabel.frame = CGRectMake(_servicelistLabel.frame.origin.x*xR, _servicelistLabel.frame.origin.y*yR, _servicelistLabel.frame.size.width*xR, _servicelistLabel.frame.size.height*yR);
        [_servicelistLabel setFont:[UIFont fontWithName:@"System Font Heavy" size:fontSize13]];
        _totalpricenameLabel.frame = CGRectMake(_totalpricenameLabel.frame.origin.x*xR, _totalpricenameLabel.frame.origin.y*yR, _totalpricenameLabel.frame.size.width*xR, _totalpricenameLabel.frame.size.height*yR);
        [_totalpricenameLabel setFont:[UIFont fontWithName:@"System Font Heavy" size:fontSize14]];
        _addressTextField.frame = CGRectMake(_addressTextField.frame.origin.x*xR, _addressTextField.frame.origin.y*yR, _addressTextField.frame.size.width*xR, _addressTextField.frame.size.height*yR);
        [_addressTextField setFont:[UIFont fontWithName:@"System Font" size:fontSize14]];
        _addressTextField.delegate = self;
        _detailTextField.frame = CGRectMake(_detailTextField.frame.origin.x*xR, _detailTextField.frame.origin.y*yR, _detailTextField.frame.size.width*xR, _detailTextField.frame.size.height*yR);
        [_detailTextField setFont:[UIFont fontWithName:@"System Font" size:fontSize15]];
        _detailTextField.delegate = self;
        _total_price.frame = CGRectMake(_total_price.frame.origin.x*xR, _total_price.frame.origin.y*yR, _total_price.frame.size.width*xR, _total_price.frame.size.height*yR);
        [_total_price setFont:[UIFont fontWithName:@"System Font Heavy" size:fontSize14]];
        _oneLabel.frame = CGRectMake(_oneLabel.frame.origin.x*xR, _oneLabel.frame.origin.y*yR, _oneLabel.frame.size.width*xR, _oneLabel.frame.size.height*yR);
        [_oneLabel setFont:[UIFont fontWithName:@"System Font Heavy" size:fontSize14]];
        _phoneTextField.frame = CGRectMake(_phoneTextField.frame.origin.x*xR, _phoneTextField.frame.origin.y*yR, _phoneTextField.frame.size.width*xR, _phoneTextField.frame.size.height*yR);
        [_phoneTextField setFont:[UIFont fontWithName:@"System Font" size:fontSize14]];
        _phoneTextField.delegate = self;
        _oneLineTextField.frame = CGRectMake(_oneLineTextField.frame.origin.x*xR, _oneLineTextField.frame.origin.y*yR, _oneLineTextField.frame.size.width*xR, _oneLineTextField.frame.size.height*yR);
        [_oneLineTextField setFont:[UIFont fontWithName:@"System Font" size:fontSize14]];
        _oneLineTextField.delegate = self;
        _oneLineTextField2.frame = CGRectMake(_oneLineTextField2.frame.origin.x*xR, _oneLineTextField2.frame.origin.y*yR, _oneLineTextField2.frame.size.width*xR, _oneLineTextField2.frame.size.height*yR);
        [_oneLineTextField2 setFont:[UIFont fontWithName:@"System Font" size:fontSize14]];
        _oneLineTextField2.delegate = self;
        _phoneLabel.frame = CGRectMake(_phoneLabel.frame.origin.x*xR, _phoneLabel.frame.origin.y*yR, _phoneLabel.frame.size.width*xR, _phoneLabel.frame.size.height*yR);
        [_phoneLabel setFont:[UIFont fontWithName:@"System Font Heavy" size:fontSize13]];
        _onelineLabel.frame = CGRectMake(_onelineLabel.frame.origin.x*xR, _onelineLabel.frame.origin.y*yR, _onelineLabel.frame.size.width*xR, _onelineLabel.frame.size.height*yR);
        [_onelineLabel setFont:[UIFont fontWithName:@"System Font Heavy" size:fontSize13]];
        _payInfoLabel.frame = CGRectMake(_payInfoLabel.frame.origin.x*xR, _payInfoLabel.frame.origin.y*yR, _payInfoLabel.frame.size.width*xR, _payInfoLabel.frame.size.height*yR);
        [_payInfoLabel setFont:[UIFont fontWithName:@"System Font Heavy" size:fontSize15]];
        
        _pointLabel.frame = CGRectMake(_pointLabel.frame.origin.x*xR, _pointLabel.frame.origin.y*yR, _pointLabel.frame.size.width*xR, _pointLabel.frame.size.height*yR);
        [_pointLabel setFont:[UIFont fontWithName:@"System Font Heavy" size:fontSize13]];
        _couponLabel.frame = CGRectMake(_couponLabel.frame.origin.x*xR, _couponLabel.frame.origin.y*yR, _couponLabel.frame.size.width*xR, _couponLabel.frame.size.height*yR);
        [_couponLabel setFont:[UIFont fontWithName:@"System Font Heavy" size:fontSize13]];
        
        
        ///////////////////////////테이블 뷰 늘리기////////////////
        
        _paydirectButton.frame = CGRectMake(_paydirectButton.frame.origin.x*xR, _paydirectButton.frame.origin.y*yR, _paydirectButton.frame.size.width*xR, _paydirectButton.frame.size.height*yR);
        _paycardButton.frame = CGRectMake(_paycardButton.frame.origin.x*xR, _paycardButton.frame.origin.y*yR, _paycardButton.frame.size.width*xR, _paycardButton.frame.size.height*yR);
        _payphoneButton.frame = CGRectMake(_payphoneButton.frame.origin.x*xR, _payphoneButton.frame.origin.y*yR, _payphoneButton.frame.size.width*xR, _payphoneButton.frame.size.height*yR);
        _paypointButton.frame = CGRectMake(_paypointButton.frame.origin.x*xR, _paypointButton.frame.origin.y*yR, _paypointButton.frame.size.width*xR, _paypointButton.frame.size.height*yR);
        _couponButton.frame = CGRectMake(_couponButton.frame.origin.x*xR, _couponButton.frame.origin.y*yR, _couponButton.frame.size.width*xR, _couponButton.frame.size.height*yR);
        _fifteenLabel.frame = CGRectMake(_fifteenLabel.frame.origin.x*xR, _fifteenLabel.frame.origin.y*yR, _fifteenLabel.frame.size.width*xR, _fifteenLabel.frame.size.height*yR);
        [_fifteenLabel setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
        
        _locationImage.frame = CGRectMake(_locationImage.frame.origin.x*xR, _locationImage.frame.origin.y*yR, _locationImage.frame.size.width*xR, _locationImage.frame.size.height*yR);
        _phoneImage.frame = CGRectMake(_phoneImage.frame.origin.x*xR, _phoneImage.frame.origin.y*yR, _phoneImage.frame.size.width*xR, _phoneImage.frame.size.height*yR);
        _messageImage.frame = CGRectMake(_messageImage.frame.origin.x*xR, _messageImage.frame.origin.y*yR, _messageImage.frame.size.width*xR, _messageImage.frame.size.height*yR);
        _confirmImage.frame = CGRectMake(_confirmImage.frame.origin.x*xR, _confirmImage.frame.origin.y*yR, _confirmImage.frame.size.width*xR, _confirmImage.frame.size.height*yR);
        _pointImage.frame = CGRectMake(_pointImage.frame.origin.x*xR, _pointImage.frame.origin.y*yR, _pointImage.frame.size.width*xR, _pointImage.frame.size.height*yR);
        _couponImage.frame = CGRectMake(_couponImage.frame.origin.x*xR, _couponImage.frame.origin.y*yR, _couponImage.frame.size.width*xR, _couponImage.frame.size.height*yR);
        _detailButton.frame = CGRectMake(_detailButton.frame.origin.x*xR, _detailButton.frame.origin.y*yR, _detailButton.frame.size.width*xR, _detailButton.frame.size.height*yR);
        [_detailButton.titleLabel setFont:[UIFont fontWithName:@"System Font" size:fontSize15]];
        _parcelButton.frame = CGRectMake(_parcelButton.frame.origin.x*xR, _parcelButton.frame.origin.y*yR, _parcelButton.frame.size.width*xR, _parcelButton.frame.size.height*yR);
        [_parcelButton.titleLabel setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
        _totalPriceView.frame = CGRectMake(_totalPriceView.frame.origin.x*xR, _totalPriceView.frame.origin.y*yR, _totalPriceView.frame.size.width*xR, _totalPriceView.frame.size.height*yR);
        _totalPriceImageView.frame = CGRectMake(_totalPriceImageView.frame.origin.x*xR, _totalPriceImageView.frame.origin.y*yR, _totalPriceImageView.frame.size.width*xR, _totalPriceImageView.frame.size.height*yR);
        _detailLine.frame = CGRectMake(_detailLine.frame.origin.x*xR, _detailLine.frame.origin.y*yR, _detailLine.frame.size.width*xR, _detailLine.frame.size.height*yR);
        _scrollview.showsVerticalScrollIndicator=YES;
        _scrollview.scrollEnabled=YES;
        
        [self.view addSubview:_scrollview];
        _scrollview.contentSize = CGSizeMake(_scrollview.frame.size.width, 300*yR+_scrollview.frame.size.height);
    }
    
}


-(void)tapped
{
    [self.view endEditing:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [_addressTextField endEditing:YES];
    [_detailTextField endEditing:YES];
    [_phoneTextField endEditing:YES];
    [_oneLineTextField endEditing:YES];
    [_oneLineTextField2 endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField.returnKeyType == UIReturnKeyNext) {
        if(textField == _addressTextField)
        {
            [_addressTextField resignFirstResponder];
            [_detailTextField becomeFirstResponder];
        }
        else if(textField == _oneLineTextField)
        {
            [_oneLineTextField resignFirstResponder];
            [_oneLineTextField2 becomeFirstResponder];
        }
    }
    else if(textField.returnKeyType == UIReturnKeyDone)
    {
        if(textField == _detailTextField)
        {
            [_detailTextField resignFirstResponder];
        }
        else if(textField == _phoneTextField)
        {
            [_phoneTextField resignFirstResponder];
        }
        else if(textField == _oneLineTextField2)
        {
            [_oneLineTextField2 resignFirstResponder];
        }
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cancelButton:(UIButton *)sender {
    UIStoryboard *storyboard = self.storyboard;
    MapViewController *backViewController = [storyboard instantiateViewControllerWithIdentifier:@"MapVC"];
    backViewController.serviceArray = serviceArray;
    backViewController.serviceTotalPrice = serviceTotalPrice;
    [self presentViewController:backViewController animated:NO completion:nil];
}
-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    if (alertView.tag == 100)
    {
        if (buttonIndex == 1)
        {
            UIStoryboard *storyboard = self.storyboard;
            RootViewController *serviceViewController = [storyboard instantiateViewControllerWithIdentifier:@"ServiceVC"];
            [self presentViewController:serviceViewController animated:NO completion:nil];
        }
    }
    
}
- (IBAction)payCancelButton:(UIButton *)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"주문 취소"
                                                   message:@"서비스 취소를 선택하시면 해당 주문 정보가\n 모두 사라집니다."
                                                  delegate:self
                                         cancelButtonTitle:@"취소"
                                         otherButtonTitles:@"확인", nil];
    
    alert.tag = 100;
    // alert창을 띄우는 method는 show이다.
    [alert show];
}
- (IBAction)directPayButton:(UIButton *)sender {
    if(!isDirectButton)
    {
        isDirectButton=true;
        NSString *phone=_phoneTextField.text;
        const char *tmp = [phone cStringUsingEncoding:NSUTF8StringEncoding];
        NSString *check = @"(010|011|016|017|018|019)([0-9]{3,4})([0-9]{4})";
        NSRange match = [phone rangeOfString:check options:NSRegularExpressionSearch];
        if (phone.length != strlen(tmp))
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"주문 실패"
                                                           message:@"연락처를 정확히 입력해 주세요.(- 없이)"
                                                          delegate:self
                                                 cancelButtonTitle:nil    /* nil 로 지정할 경우 cancel button 없음 */
                                                 otherButtonTitles:@"확인", nil];
            [alert show];
            isDirectButton=false;
        }
        else if (NSNotFound == match.location)
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"주문 실패"
                                                           message:@"연락처를 정확히 입력해 주세요.(- 없이)"
                                                          delegate:self
                                                 cancelButtonTitle:nil    /* nil 로 지정할 경우 cancel button 없음 */
                                                 otherButtonTitles:@"확인", nil];
            [alert show];
            isDirectButton=false;
        }
        else if((_addressTextField.text.length == 0)||(_addressTextField.text == NULL))
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"알림"
                                                           message:@"주소를 입력해 주세요."
                                                          delegate:self
                                                 cancelButtonTitle:nil    /* nil 로 지정할 경우 cancel button 없음 */
                                                 otherButtonTitles:@"확인", nil];
            [alert show];
            isDirectButton=false;
        }
        else if((_detailTextField.text.length == 0)||(_detailTextField.text == NULL))
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"알림"
                                                           message:@"상세주소를 입력해 주세요."
                                                          delegate:self
                                                 cancelButtonTitle:nil    /* nil 로 지정할 경우 cancel button 없음 */
                                                 otherButtonTitles:@"확인", nil];
            [alert show];
            isDirectButton=false;
        }
        else
        {
            // Start your spinner animating
            [self.activityIndicatorView startAnimating];
            
            // Create your dispatch queue
            dispatch_queue_t myNewQueue = dispatch_queue_create("my Queue", NULL);
            
            // Dispatch work to your queue
            dispatch_async(myNewQueue, ^{
                
                // Perform long activity here.
                [self androidPushHttp];

                // Dispatch work back to the main queue for your UIKit changes
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    // update your UI here from your changes.
                    [self.activityIndicatorView stopAnimating];

                    SelectCode *temp = [[SelectCode alloc]init];
                    for(temp in serviceArray){
                        order_code=temp.order_code;
                        [self payHttpDirect];
                    }
                    
                    
                    UIStoryboard *storyboard = self.storyboard;
                    UIViewController *nextViewController = [storyboard instantiateViewControllerWithIdentifier:@"PayCompleteVC"];
                    [self presentViewController:nextViewController animated:NO completion:nil];
                });
            });
            
        }

    
    }
}



- (IBAction)cardPayButton:(UIButton *)sender {
    NSString *phone=_phoneTextField.text;
    const char *tmp = [phone cStringUsingEncoding:NSUTF8StringEncoding];
    NSString *check = @"(010|011|016|017|018|019)([0-9]{3,4})([0-9]{4})";
    NSRange match = [phone rangeOfString:check options:NSRegularExpressionSearch];
    if (phone.length != strlen(tmp))
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"주문 실패"
                                                       message:@"연락처를 정확히 입력해 주세요.(- 없이)"
                                                      delegate:self
                                             cancelButtonTitle:nil    /* nil 로 지정할 경우 cancel button 없음 */
                                             otherButtonTitles:@"확인", nil];
        [alert show];
    }
    else if (NSNotFound == match.location)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"주문 실패"
                                                       message:@"연락처를 정확히 입력해 주세요.(- 없이)"
                                                      delegate:self
                                             cancelButtonTitle:nil    /* nil 로 지정할 경우 cancel button 없음 */
                                             otherButtonTitles:@"확인", nil];
        [alert show];
    }
    else if(serviceTotalPrice == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"알림"
                                                       message:@"상담 후 결제는 현장결제를 이용해 주세요."
                                                      delegate:self
                                             cancelButtonTitle:nil    /* nil 로 지정할 경우 cancel button 없음 */
                                             otherButtonTitles:@"확인", nil];
        [alert show];
    }
    else if((_addressTextField.text.length == 0)||(_addressTextField.text == NULL))
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"알림"
                                                       message:@"주소를 입력해 주세요."
                                                      delegate:self
                                             cancelButtonTitle:nil    /* nil 로 지정할 경우 cancel button 없음 */
                                             otherButtonTitles:@"확인", nil];
        [alert show];
        isDirectButton=false;
    }
    else if((_detailTextField.text.length == 0)||(_detailTextField.text == NULL))
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"알림"
                                                       message:@"상세주소를 입력해 주세요."
                                                      delegate:self
                                             cancelButtonTitle:nil    /* nil 로 지정할 경우 cancel button 없음 */
                                             otherButtonTitles:@"확인", nil];
        [alert show];
        isDirectButton=false;
    }
    else
    {
        [[NSUserDefaults standardUserDefaults] setObject:_phoneTextField.text forKey:@"loginPhoneNum"];

        NSString *payUrl = [self payHttpPhoneCard:@"card"];
        UIStoryboard *storyboard = self.storyboard;
        PayWebViewController *nextViewController = [storyboard instantiateViewControllerWithIdentifier:@"PayWebVC"];
        nextViewController.payTitle = @"카드 결제";
        nextViewController.payUrl = payUrl;
        nextViewController.loginId = order_name;
        nextViewController.order_time = order_time;
        nextViewController.serviceArray = serviceArray;
        nextViewController.serviceTotalPrice = serviceTotalPrice;
        nextViewController.segueData_2 = order_address_basic;
        nextViewController.segueData_3 = order_address_detail;
        
        [self presentViewController:nextViewController animated:NO completion:nil];
    }
    
    
}
- (IBAction)phonePayButton:(UIButton *)sender {
    NSString *phone=_phoneTextField.text;
    const char *tmp = [phone cStringUsingEncoding:NSUTF8StringEncoding];
    NSString *check = @"(010|011|016|017|018|019)([0-9]{3,4})([0-9]{4})";
    NSRange match = [phone rangeOfString:check options:NSRegularExpressionSearch];
    if (phone.length != strlen(tmp))
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"주문 실패"
                                                       message:@"연락처를 정확히 입력해 주세요.(- 없이)"
                                                      delegate:self
                                             cancelButtonTitle:nil    /* nil 로 지정할 경우 cancel button 없음 */
                                             otherButtonTitles:@"확인", nil];
        [alert show];
    }
    else if (NSNotFound == match.location)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"주문 실패"
                                                       message:@"연락처를 정확히 입력해 주세요.(- 없이)"
                                                      delegate:self
                                             cancelButtonTitle:nil    /* nil 로 지정할 경우 cancel button 없음 */
                                             otherButtonTitles:@"확인", nil];
        [alert show];
    }
    else if(serviceTotalPrice == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"알림"
                                                       message:@"상담 후 결제는 현장결제를 이용해 주세요."
                                                      delegate:self
                                             cancelButtonTitle:nil    /* nil 로 지정할 경우 cancel button 없음 */
                                             otherButtonTitles:@"확인", nil];
        [alert show];
    }
    else if((_addressTextField.text.length == 0)||(_addressTextField.text == NULL))
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"알림"
                                                       message:@"주소를 입력해 주세요."
                                                      delegate:self
                                             cancelButtonTitle:nil    /* nil 로 지정할 경우 cancel button 없음 */
                                             otherButtonTitles:@"확인", nil];
        [alert show];
        isDirectButton=false;
    }
    else if((_detailTextField.text.length == 0)||(_detailTextField.text == NULL))
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"알림"
                                                       message:@"상세주소를 입력해 주세요."
                                                      delegate:self
                                             cancelButtonTitle:nil    /* nil 로 지정할 경우 cancel button 없음 */
                                             otherButtonTitles:@"확인", nil];
        [alert show];
        isDirectButton=false;
    }
    else
    {
        [[NSUserDefaults standardUserDefaults] setObject:_phoneTextField.text forKey:@"loginPhoneNum"];
        
        NSString *payUrl = [self payHttpPhoneCard:@"phone"];
        
        UIStoryboard *storyboard = self.storyboard;
        PayWebViewController *nextViewController = [storyboard instantiateViewControllerWithIdentifier:@"PayWebVC"];
        nextViewController.payTitle = @"휴대폰 소액 결제";
        nextViewController.payUrl = payUrl;
        nextViewController.loginId = order_name;
        nextViewController.order_time = order_time;
        nextViewController.serviceArray = serviceArray;
        nextViewController.serviceTotalPrice = serviceTotalPrice;
        nextViewController.segueData_2 = order_address_basic;
        nextViewController.segueData_3 = order_address_detail;
        
        [self presentViewController:nextViewController animated:NO completion:nil];
    }
    
}
- (IBAction)pointUseButton:(UIButton *)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"준비중"
                                                   message:@"포인트 결제는 현재 이용할 수 없습니다."
                                                  delegate:self
                                         cancelButtonTitle:nil    /* nil 로 지정할 경우 cancel button 없음 */
                                         otherButtonTitles:@"확인", nil];
    
    // alert창을 띄우는 method는 show이다.
    [alert show];
}
- (IBAction)couponUseButton:(UIButton *)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"준비중"
                                                   message:@"쿠폰 결제는 현재 이용할 수 없습니다."
                                                  delegate:self
                                         cancelButtonTitle:nil    /* nil 로 지정할 경우 cancel button 없음 */
                                         otherButtonTitles:@"확인", nil];
    
    // alert창을 띄우는 method는 show이다.
    [alert show];
}
- (IBAction)detailButton:(UIButton *)sender {
    UIStoryboard *storyboard = self.storyboard;
    PayDetailViewController *popupViewController = [storyboard instantiateViewControllerWithIdentifier:@"PayDetailVC"];
    popupViewController.serviceTotalPrice = serviceTotalPrice;
    popupViewController.serviceArray = serviceArray;
    [popupViewController setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    UINavigationController *navCon = [[UINavigationController alloc] initWithRootViewController:popupViewController];
    navCon.navigationBarHidden = YES;
    navCon.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    
    [self presentViewController:navCon animated:YES completion:nil];
}
- (IBAction)parcelButton:(UIButton *)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"준비중"
                                                   message:@"택배신청은 현재 이용할 수 없습니다."
                                                  delegate:self
                                         cancelButtonTitle:nil    /* nil 로 지정할 경우 cancel button 없음 */
                                         otherButtonTitles:@"확인", nil];
    
    // alert창을 띄우는 method는 show이다.
    [alert show];
}

- (void)mapTotalCountPrice
{
    NSInteger count = 0;
    
    for(SelectCode *temp in serviceArray)
    {
        count = count + (temp.order_code.length/3-1);
    }
    NSString *tempText = @"총 ";
    NSString *totalCount = [NSString stringWithFormat:@"%ld건 ",(long)count];
    
    tempText = [tempText stringByAppendingString:totalCount];
    _totalpricenameLabel.text = tempText;
    
    order_price = [ NSNumberFormatter localizedStringFromNumber:@(serviceTotalPrice) numberStyle:NSNumberFormatterDecimalStyle];
    _total_price.text = order_price;
    
//    _mapTotalLabel.text = tempText;
    
}

-(NSString *)pointHttp
{
    NSString *result;
    
    HttpPostManager *pointHttp = [[HttpPostManager alloc]init];
    [pointHttp setURL:@"iphone_getPoint"];
    order_name = [[NSUserDefaults standardUserDefaults] objectForKey:@"loginId"];
    [pointHttp addEntity:@"id" over:order_name];

    result = [pointHttp startHttp:@"getPoint"];
    return result;
}

-(NSString *)androidPushHttp
{
    NSString *token =[[NSUserDefaults standardUserDefaults] stringForKey:@"registrationToken"];
    if(token != NULL)
    {
        NSString *result = [[NSString alloc]init];
        HttpPostManager *androidpushHttp = [[HttpPostManager alloc]init];
        [androidpushHttp setURL:@"iphone_push_me"];
        order_name = [[NSUserDefaults standardUserDefaults] objectForKey:@"loginId"];
        [androidpushHttp addEntity:@"id" over:order_name];
        [androidpushHttp addEntity:@"token" over:token];
        [androidpushHttp addEntity:@"message" over:@"message"];
        result = [androidpushHttp startHttp:@"getAndroidpush"];
        return result;
    }
    return @"not token";
    
}

-(NSString *)payHttpDirect
{
    NSString *result = [[NSString alloc]init];
    HttpPostManager *PayAppHttp = [[HttpPostManager alloc]init];
    [PayAppHttp setURL:@"iphone_paydirect"];
    order_name = [[NSUserDefaults standardUserDefaults] objectForKey:@"loginId"];
    [PayAppHttp addEntity:@"id" over:order_name];
    [PayAppHttp addEntity:@"order_time" over:order_time];
    [PayAppHttp addEntity:@"order_code" over:order_code];
    order_address_basic = _addressTextField.text;
    order_address_detail = _detailTextField.text;
    order_address = [order_address_basic stringByAppendingString:@" "];
    order_address = [order_address stringByAppendingString:order_address_detail];
    [PayAppHttp addEntity:@"order_address" over:order_address];
    [PayAppHttp addEntity:@"order_phone" over:_phoneTextField.text];
    order_text = @"";
    order_text = [order_text stringByAppendingString:_oneLineTextField.text];
    order_text = [order_text stringByAppendingString:@" "];
    order_text = [order_text stringByAppendingString:_oneLineTextField2.text];
    [PayAppHttp addEntity:@"order_Text" over:order_text];
    [PayAppHttp addEntity:@"with" over:@"direct"];
    
    result = [PayAppHttp startHttp:@"getPayDirect"];
    return result;
    
}

-(NSString *)payHttpPhoneCard:(NSString *)with
{
    order_name = [[NSUserDefaults standardUserDefaults] objectForKey:@"loginId"];
    NSString *result = [[NSString alloc]init];
    HttpPostManager *PayAppHttp = [[HttpPostManager alloc]init];
    [PayAppHttp setURL:@"iphone_payrequest2"];
    
    [PayAppHttp addEntity:@"id" over:order_name];
    [PayAppHttp addEntity:@"order_time" over:order_time];
    order_address_basic = _addressTextField.text;
    order_address_detail = _detailTextField.text;
    order_address = [order_address_basic stringByAppendingString:@" "];
    order_address = [order_address stringByAppendingString:order_address_detail];
    [PayAppHttp addEntity:@"order_address" over:order_address];
    [PayAppHttp addEntity:@"order_phone" over:_phoneTextField.text];
    order_text = @"";
    order_text = [order_text stringByAppendingString:_oneLineTextField.text];
    order_text = [order_text stringByAppendingString:@" "];
    order_text = [order_text stringByAppendingString:_oneLineTextField2.text];
    [PayAppHttp addEntity:@"order_Text" over:order_text];
    [PayAppHttp addEntity:@"with" over:with];
    NSString *price = [NSString stringWithFormat:@"%d",serviceTotalPrice];
    [PayAppHttp addEntity:@"price" over:price];
    NSString *orderCount = [NSString stringWithFormat:@"%lu",(unsigned long)serviceArray.count];
    [PayAppHttp addEntity:@"count" over:orderCount];
    int random_int = arc4random()%10000;
    code = [NSString stringWithFormat:@"%d",random_int];
    [PayAppHttp addEntity:@"code" over:code];
    SelectCode *temp = [[SelectCode alloc]init];
    int i = 0;
    for(temp in serviceArray){
        order_code=temp.order_code;
        NSString *order_code_post = [NSString stringWithFormat:@"order_code%d",i];
        [PayAppHttp addEntity:order_code_post over:order_code];
        i++;
    }
    result = [PayAppHttp startHttp:@"getPayUrl"];
    return result;
    
    
    
}




- (void) showReceivedMessage:(NSNotification *) notification {
    
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



@end
