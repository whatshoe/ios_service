//
//  MyshoeViewController.m
//  whatshoe
//
//  Created by whatshoe on 2015. 11. 17..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import "Myshoe1ViewController.h"
#import "HttpPostManager.h"
#import "ServiceViewController.h"
#import "ModalDismissSegue.h"

@interface Myshoe1ViewController (){
    Boolean isSelectGift;
    NSString *order_time;
    NSString *order_id;
    NSString *order_code;
    NSString *order_state;
    bool isServiceCancel;
}

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UIView *myshoebox;

@property (weak, nonatomic) IBOutlet UILabel *serviceLabel;

@property (weak, nonatomic) IBOutlet UIImageView *backImage;
@property (weak, nonatomic) IBOutlet UIButton *backButton;

@property (weak, nonatomic) IBOutlet UIImageView *shoeImage;

@property (weak, nonatomic) IBOutlet UIImageView *option_04Image;
@property (weak, nonatomic) IBOutlet UIImageView *option_03Image;
@property (weak, nonatomic) IBOutlet UIImageView *option_02Image;
@property (weak, nonatomic) IBOutlet UIImageView *option_01Image;

@property (weak, nonatomic) IBOutlet UIImageView *pickupImage;
@property (weak, nonatomic) IBOutlet UIImageView *fixImage;
@property (weak, nonatomic) IBOutlet UIImageView *deliveryImage;

@property (weak, nonatomic) IBOutlet UIImageView *serviceCancelImage;

@property (weak, nonatomic) IBOutlet UILabel *pickupLabel;
@property (weak, nonatomic) IBOutlet UILabel *fixLabel;
@property (weak, nonatomic) IBOutlet UILabel *deliveryLabel;
@property (weak, nonatomic) IBOutlet UILabel *pickupMin;
@property (weak, nonatomic) IBOutlet UILabel *fixMin;
@property (weak, nonatomic) IBOutlet UILabel *deliveryMin;

@property (weak, nonatomic) IBOutlet UIButton *serviceCancel;


@end

@implementation Myshoe1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _myshoebox.layer.cornerRadius = 10.f;
    
    
    order_time = [[NSUserDefaults standardUserDefaults]stringForKey:@"order_time"];
    order_code = [[NSUserDefaults standardUserDefaults]stringForKey:@"order_code"];
    
    order_id = [[NSUserDefaults standardUserDefaults]stringForKey:@"loginId"];
    order_state = [self getOrderState];
    
    
    
    int int_order_state = [order_state intValue];
    
    if(int_order_state == 0)
    {
        printf("현재 상태 : %d \n",int_order_state);
        _pickupImage.image = [UIImage imageNamed:@"myshoe_pickup_check.png"];
        _fixImage.image = [UIImage imageNamed:@"myshoe_fix.png"];
        _deliveryImage.image = [UIImage imageNamed:@"myshoe_delivery.png"];
    }
    else if(int_order_state == 1)
    {
        printf("현재 상태 : %d \n",int_order_state);
        _pickupImage.image = [UIImage imageNamed:@"myshoe_pickup.png"];
        _fixImage.image = [UIImage imageNamed:@"myshoe_fix_check.png"];
        _deliveryImage.image = [UIImage imageNamed:@"myshoe_delivery.png"];
    }
    else if(int_order_state == 2)
    {
        printf("현재 상태 : %d \n",int_order_state);
        _pickupImage.image = [UIImage imageNamed:@"myshoe_pickup.png"];
        _fixImage.image = [UIImage imageNamed:@"myshoe_fix.png"];
        _deliveryImage.image = [UIImage imageNamed:@"myshoe_delivery_check.png"];
    }
    [self codeToImage:order_code];
    
    
    
    //myshoe alarm push
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"order_myshoe_alarm"])
    {
        printf("=======abcadf=====\n");
        [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"order_myshoe_alarm"];
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:NO];
    float xR = [[NSUserDefaults standardUserDefaults] floatForKey:@"xRatio"];
    float yR = [[NSUserDefaults standardUserDefaults] floatForKey:@"yRatio"];
    
    
    //////////////////////////컨포넌트 재설정/////////////////////////////////
    _backgroundImage.frame = CGRectMake(_backgroundImage.frame.origin.x*xR, _backgroundImage.frame.origin.y*yR, _backgroundImage.frame.size.width*xR, _backgroundImage.frame.size.height*yR);
    _myshoebox.frame = CGRectMake(_myshoebox.frame.origin.x*xR, _myshoebox.frame.origin.y*yR, _myshoebox.frame.size.width*xR, _myshoebox.frame.size.height*yR);
    _backImage.frame = CGRectMake(_backImage.frame.origin.x*xR, _backImage.frame.origin.y*yR, _backImage.frame.size.width*xR, _backImage.frame.size.height*yR);
    _backButton.frame = CGRectMake(_backButton.frame.origin.x*xR, _backButton.frame.origin.y*yR, _backButton.frame.size.width*xR, _backButton.frame.size.height*yR);
    _shoeImage.frame = CGRectMake(_shoeImage.frame.origin.x*xR, _shoeImage.frame.origin.y*yR, _shoeImage.frame.size.width*xR, _shoeImage.frame.size.height*yR);
    _option_04Image.frame = CGRectMake(_option_04Image.frame.origin.x*xR, _option_04Image.frame.origin.y*yR, _option_04Image.frame.size.width*xR, _option_04Image.frame.size.height*yR);
    _option_03Image.frame = CGRectMake(_option_03Image.frame.origin.x*xR, _option_03Image.frame.origin.y*yR, _option_03Image.frame.size.width*xR, _option_03Image.frame.size.height*yR);
    _option_02Image.frame = CGRectMake(_option_02Image.frame.origin.x*xR, _option_02Image.frame.origin.y*yR, _option_02Image.frame.size.width*xR, _option_02Image.frame.size.height*yR);
    _option_01Image.frame = CGRectMake(_option_01Image.frame.origin.x*xR, _option_01Image.frame.origin.y*yR, _option_01Image.frame.size.width*xR, _option_01Image.frame.size.height*yR);
    
    _pickupImage.frame = CGRectMake(_pickupImage.frame.origin.x*xR, _pickupImage.frame.origin.y*yR, _pickupImage.frame.size.width*xR, _pickupImage.frame.size.height*yR);
    _fixImage.frame = CGRectMake(_fixImage.frame.origin.x*xR, _fixImage.frame.origin.y*yR, _fixImage.frame.size.width*xR, _fixImage.frame.size.height*yR);
    _deliveryImage.frame = CGRectMake(_deliveryImage.frame.origin.x*xR, _deliveryImage.frame.origin.y*yR, _deliveryImage.frame.size.width*xR, _deliveryImage.frame.size.height*yR);
    _serviceCancelImage.frame = CGRectMake(_serviceCancelImage.frame.origin.x*xR, _serviceCancelImage.frame.origin.y*yR, _serviceCancelImage.frame.size.width*xR, _serviceCancelImage.frame.size.height*yR);
    _serviceCancel.frame = CGRectMake(_serviceCancel.frame.origin.x*xR, _serviceCancel.frame.origin.y*yR, _serviceCancel.frame.size.width*xR, _serviceCancel.frame.size.height*yR);
    
    
    /////+font/////
    
    float fontSize13 = 13*yR;
    
    float fontSize16 = 16*yR;
    
    _serviceLabel.frame = CGRectMake(_serviceLabel.frame.origin.x*xR, _serviceLabel.frame.origin.y*yR, _serviceLabel.frame.size.width*xR, _serviceLabel.frame.size.height*yR);
    [_serviceLabel setFont:[UIFont fontWithName:@"System Font Heavy" size:fontSize16]];
    
    
    _pickupLabel.frame = CGRectMake(_pickupLabel.frame.origin.x*xR, _pickupLabel.frame.origin.y*yR, _pickupLabel.frame.size.width*xR, _pickupLabel.frame.size.height*yR);
    [_pickupLabel setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
    
    _fixLabel.frame = CGRectMake(_fixLabel.frame.origin.x*xR, _fixLabel.frame.origin.y*yR, _fixLabel.frame.size.width*xR, _fixLabel.frame.size.height*yR);
    [_fixLabel setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
    
    _deliveryLabel.frame = CGRectMake(_deliveryLabel.frame.origin.x*xR, _deliveryLabel.frame.origin.y*yR, _deliveryLabel.frame.size.width*xR, _deliveryLabel.frame.size.height*yR);
    [_deliveryLabel setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
    
    _pickupMin.frame = CGRectMake(_pickupMin.frame.origin.x*xR, _pickupMin.frame.origin.y*yR, _pickupMin.frame.size.width*xR, _pickupMin.frame.size.height*yR);
    [_pickupMin setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
    
    _fixMin.frame = CGRectMake(_fixMin.frame.origin.x*xR, _fixMin.frame.origin.y*yR, _fixMin.frame.size.width*xR, _fixMin.frame.size.height*yR);
    [_fixMin setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
    
    _deliveryMin.frame = CGRectMake(_deliveryMin.frame.origin.x*xR, _deliveryMin.frame.origin.y*yR, _deliveryMin.frame.size.width*xR, _deliveryMin.frame.size.height*yR);
    [_deliveryMin setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)cancelButton:(id)sender {
    if(!isSelectGift)
    {
        isSelectGift = true;
        _backImage.image = [UIImage imageNamed:@"myshoe_cancle_press.png"];
    }
    
    UIStoryboard *storyboard = self.storyboard;
    UIViewController *mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"ServiceVC"];
    ModalDismissSegue *segue = [[ModalDismissSegue alloc] initWithIdentifier:@"" source:self destination:mainViewController];
    [self prepareForSegue:segue sender:sender];
    [segue perform];
    
}


- (NSString *)getOrderState
{
    NSString *result;
    HttpPostManager *orderStateHttp = [[HttpPostManager alloc]init];
    [orderStateHttp setURL:@"iphone_getorderstate"];
    [orderStateHttp addEntity:@"id" over:order_id];
    [orderStateHttp addEntity:@"order_time" over:order_time];
    [orderStateHttp addEntity:@"order_code" over:order_code];
    result = [orderStateHttp startHttp:@"order_state"];
    
    return result;
}
- (IBAction)serviceCancel:(UIButton *)sender {
    
    if(!isServiceCancel)
    {
        isServiceCancel = true;
        _serviceCancelImage.image = [UIImage imageNamed:@"myshoe_servicecancle_press.png"];
    }
    [self performSelector:@selector(cancelPress) withObject:nil afterDelay:0.3];
    
    
    
    NSDate *now = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy.MM.dd hh:mm:ss"];
    NSString *current_time = [formatter stringFromDate:now];
    
    
    int relativeTime = [self calTime:order_time current_time:current_time];
    
    printf("relativeTime %d\n",relativeTime);
    
    if(relativeTime>15)
    {
        //상대시간을 구해서 15분차이 이상이면 취소 못하게 막아야합니다.
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"알림"
                                                       message:@"주문 후 15분 내에만 취소 할 수 있습니다."
                                                      delegate:self
                                             cancelButtonTitle:nil    /* nil 로 지정할 경우 cancel button 없음 */
                                             otherButtonTitles:@"확인", nil];
        // alert창을 띄우는 method는 show이다.
        [alert show];
    }
    else
    {
        //취소 메소드
        HttpPostManager *updateStateHttp = [[HttpPostManager alloc]init];
        [updateStateHttp setURL:@"iphone_stateupdate"];
        [updateStateHttp addEntity:@"id" over:order_id];
        [updateStateHttp addEntity:@"order_time" over:order_time];
        [updateStateHttp addEntity:@"order_code" over:order_code];
        [updateStateHttp addEntity:@"order_state" over:@"4"];
        [updateStateHttp startHttp:@"stateUpdate"];
        
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"알림"
                                                       message:@"주문이 취소되었습니다."
                                                      delegate:self
                                             cancelButtonTitle:nil    /* nil 로 지정할 경우 cancel button 없음 */
                                             otherButtonTitles:@"확인", nil];
        // alert창을 띄우는 method는 show이다.
        [alert show];
        UIStoryboard *storyboard = self.storyboard;
        UIViewController *modalViewController = [storyboard instantiateViewControllerWithIdentifier:@"ServiceVC"];
        [self presentViewController:modalViewController animated:NO completion:nil];
        
    }
}

-(int)calTime:(NSString*)temp_order_time current_time:(NSString*)current_time
{
    
    NSString *result;
    HttpPostManager *calTimeHttp = [[HttpPostManager alloc]init];
    [calTimeHttp setURL:@"iphone_relativetime"];
    [calTimeHttp addEntity:@"first_time" over:temp_order_time];
    [calTimeHttp addEntity:@"second_time" over:current_time];
    
    result = [calTimeHttp startHttp:@"relativetime"];
    int time = [result intValue];
    
    return time;
}
-(void)cancelPress {
    if(isServiceCancel)
    {
        isServiceCancel = false;
        _serviceCancelImage.image = [UIImage imageNamed:@"myshoe_servicecancle.png"];
    }
}

-(void)codeToImage:(NSString* )temp_order_code
{
    NSString* temp_code;
    NSString* temp_code_firstStr;
    for(int i = 0; i<temp_order_code.length/3;i++)
    {
        temp_code = [temp_order_code substringWithRange:NSMakeRange(i*3, 3)];
        temp_code_firstStr = [temp_code substringToIndex:1];
        if([temp_code_firstStr isEqualToString:@"1"])
        {
            _shoeImage.image = [UIImage imageNamed:@"myshoe_men.png"];
            _shoeImage.hidden = false;
            // _option_01Image.image = [UIImage imageNamed:@"myshoe_men1.png"];
            //_option_01Image.hidden = false;
        }
        else if([temp_code_firstStr isEqualToString:@"2"])
        {
            _shoeImage.image = [UIImage imageNamed:@"myshoe_women.png"];
            _shoeImage.hidden = false;
            //_option_01Image.image = [UIImage imageNamed:@"myshoe_women1.png"];
            //_option_01Image.hidden = false;
            
        }
        else if([temp_code_firstStr isEqualToString:@"3"])
        {
            _shoeImage.image = [UIImage imageNamed:@"myshoe_pre_men.png"];
            _shoeImage.hidden = false;
            // _option_01Image.image = [UIImage imageNamed:@"myshoe_men1.png"];
            //_option_01Image.hidden = false;
            _pickupMin.numberOfLines = 0;
            _pickupMin.text = @"오후 2시 이전 당일 픽업";
            [_pickupMin sizeToFit];
            _fixMin.numberOfLines = 0;
            _fixMin.text = @"약 3일 소요";
            [_fixMin sizeToFit];
            _deliveryMin.numberOfLines = 0;
            _deliveryMin.text = @"약 1일 소요";
            [_deliveryMin sizeToFit];
            
        }
        else if([temp_code_firstStr isEqualToString:@"4"])
        {
            _shoeImage.image = [UIImage imageNamed:@"myshoe_pre_women.png"];
            _shoeImage.hidden = false;
            //_option_01Image.image = [UIImage imageNamed:@"myshoe_women1.png"];
            //_option_01Image.hidden = false;
            _pickupMin.numberOfLines = 0;
            _pickupMin.text = @"오후 2시 이전 당일 픽업";
            [_pickupMin sizeToFit];
            _fixMin.numberOfLines = 0;
            _fixMin.text = @"약 3일 소요";
            [_fixMin sizeToFit];
            _deliveryMin.numberOfLines = 0;
            _deliveryMin.text = @"약 1일 소요";
            [_deliveryMin sizeToFit];
            
        }
    }
}
@end
