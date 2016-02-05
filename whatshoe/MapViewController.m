//
//  MapViewController.m
//  whatshoe
//
//  Created by whatshoe on 2015. 11. 2..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import "MapViewController.h"
#import "PayPageViewController.h"
#import "RootViewController.h"
#import "HttpPostManager.h"
#import <DaumMap/MTMapView.h>
#import <DaumMap/MTMapCameraUpdate.h>
#import <DaumMap/MTMapReverseGeoCoder.h>


@interface MapViewController () <MTMapViewDelegate, UITextFieldDelegate>
{
    Boolean isPushSave;
    NSString *order_code;
    NSString *order_address;
    NSString *order_address_detail;
    
    MTMapPointGeo mappoint;
    
}

@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UILabel *navigationBar;
@property (weak, nonatomic) IBOutlet UIButton *barButton;
@property (weak, nonatomic) IBOutlet UILabel *barLabel;

@property (weak, nonatomic) IBOutlet UIView *mapView;
@property (weak, nonatomic) IBOutlet UIImageView *circleImage;
@property (weak, nonatomic) IBOutlet UIImageView *middleLine;
@property (weak, nonatomic) IBOutlet UIImageView *middle2Line;
@property (weak, nonatomic) IBOutlet UIImageView *mapsaveImage;
@property (weak, nonatomic) IBOutlet UILabel *mapsaveLabel;

@property (weak, nonatomic) IBOutlet UIView *mapsaveView;
@property (weak, nonatomic) IBOutlet UIButton *mapSaveButton;

@property (weak, nonatomic) IBOutlet UITextField *address1;
@property (weak, nonatomic) IBOutlet UITextField *address2;
@property (weak, nonatomic) IBOutlet UIButton *payButton;

@property (weak, nonatomic) IBOutlet UIButton *resetLocationButton;

@property (weak, nonatomic) IBOutlet UILabel *deliveryLabel;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property (weak, nonatomic) IBOutlet UIImageView *mapImage;


@property (strong, nonatomic) MTMapView *daumMap;
@property (nonatomic, retain) MTMapPoint* mapPoint;
@end

@implementation MapViewController
@synthesize locationManager;

@synthesize serviceArray;
@synthesize serviceTotalPrice;
- (void)viewDidLoad {
    @try
    {
        [super viewDidLoad];
    }
    @catch (NSException *exception)
    {
        NSLog(@"Exception %@",exception);
    }
    order_address = [[NSString alloc]init];
    [self.activityIndicatorView stopAnimating];
    [self.activityIndicatorView layer].zPosition = 1;
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self
                           selector:@selector (textFieldText:)
                               name:UITextFieldTextDidChangeNotification
                             object:_address1];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:NO];
    
    float xR = [[NSUserDefaults standardUserDefaults] floatForKey:@"xRatio"];
    float yR = [[NSUserDefaults standardUserDefaults] floatForKey:@"yRatio"];
    
    _mapImage.frame = CGRectMake(_mapImage.frame.origin.x*xR, _mapImage.frame.origin.y*yR, _mapImage.frame.size.width*xR, _mapImage.frame.size.height*yR);
    _activityIndicatorView.frame = CGRectMake(_activityIndicatorView.frame.origin.x*xR, _activityIndicatorView.frame.origin.y*yR, _activityIndicatorView.frame.size.width*xR, _activityIndicatorView.frame.size.height*yR);
    //////////////////////////컨포넌트 재설정/////////////////////////////////
    _mainView.frame = CGRectMake(_mainView.frame.origin.x*xR, _mainView.frame.origin.y*yR, _mainView.frame.size.width*xR, _mainView.frame.size.height*yR);
    _navigationBar.frame = CGRectMake(_navigationBar.frame.origin.x*xR, _navigationBar.frame.origin.y*yR, _navigationBar.frame.size.width*xR, _navigationBar.frame.size.height*yR);
    _barButton.frame = CGRectMake(_barButton.frame.origin.x*xR, _barButton.frame.origin.y*yR, _barButton.frame.size.width*xR, _barButton.frame.size.height*yR);
    _mapView.frame = CGRectMake(_mapView.frame.origin.x*xR, _mapView.frame.origin.y*yR, _mapView.frame.size.width*xR, _mapView.frame.size.height*yR);
    
    _circleImage.frame = CGRectMake(_circleImage.frame.origin.x*xR, _circleImage.frame.origin.y*yR, _circleImage.frame.size.width*xR, _circleImage.frame.size.height*yR);
    _middleLine.frame = CGRectMake(_middleLine.frame.origin.x*xR, _middleLine.frame.origin.y*yR, _middleLine.frame.size.width*xR, _middleLine.frame.size.height*yR);
    _middle2Line.frame = CGRectMake(_middle2Line.frame.origin.x*xR, _middle2Line.frame.origin.y*yR, _middle2Line.frame.size.width*xR, _middle2Line.frame.size.height*yR);
    
    _payButton.frame = CGRectMake(_payButton.frame.origin.x*xR, _payButton.frame.origin.y*yR, _payButton.frame.size.width*xR, _payButton.frame.size.height*yR);
    _resetLocationButton.frame = CGRectMake(_resetLocationButton.frame.origin.x*xR, _resetLocationButton.frame.origin.y*yR, _resetLocationButton.frame.size.width*xR, _resetLocationButton.frame.size.height*yR);
    
    _mapsaveImage.frame = CGRectMake(_mapsaveImage.frame.origin.x*xR, _mapsaveImage.frame.origin.y*yR, _mapsaveImage.frame.size.width*xR, _mapsaveImage.frame.size.height*yR);
    _mapsaveView.frame = CGRectMake(_mapsaveView.frame.origin.x*xR, _mapsaveView.frame.origin.y*yR, _mapsaveView.frame.size.width*xR, _mapsaveView.frame.size.height*yR);
    
    _mapSaveButton.frame = CGRectMake(_mapSaveButton.frame.origin.x*xR, _mapSaveButton.frame.origin.y*yR, _mapSaveButton.frame.size.width*xR, _mapSaveButton.frame.size.height*yR);
    /////+font/////
    
    float fontSize14 = 14*yR;
    float fontSize13 = 13*yR;
    float fontSize18 = 18*yR;
    
    _barLabel.frame = CGRectMake(_barLabel.frame.origin.x*xR, _barLabel.frame.origin.y*yR, _barLabel.frame.size.width*xR, _barLabel.frame.size.height*yR);
    [_barLabel setFont:[UIFont fontWithName:@"System Font Heavy" size:fontSize18]];
    
    _mapsaveLabel.frame = CGRectMake(_mapsaveLabel.frame.origin.x*xR, _mapsaveLabel.frame.origin.y*yR, _mapsaveLabel.frame.size.width*xR, _mapsaveLabel.frame.size.height*yR);
    [_mapsaveLabel setFont:[UIFont fontWithName:@"System Font" size:fontSize14]];
    
    _address1.frame = CGRectMake(_address1.frame.origin.x*xR, _address1.frame.origin.y*yR, _address1.frame.size.width*xR, _address1.frame.size.height*yR);
    [_address1 setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
    _address1.delegate = self;
    
    _address2.frame = CGRectMake(_address2.frame.origin.x*xR, _address2.frame.origin.y*yR, _address2.frame.size.width*xR, _address2.frame.size.height*yR);
    [_address2 setFont:[UIFont fontWithName:@"System Font" size:fontSize13]];
    _address2.delegate = self;
    _deliveryLabel.frame = CGRectMake(_deliveryLabel.frame.origin.x*xR, _deliveryLabel.frame.origin.y*yR, _deliveryLabel.frame.size.width*xR, _deliveryLabel.frame.size.height*yR);
    [_deliveryLabel setFont:[UIFont fontWithName:@"System Font Light" size:fontSize14]];
    
    
    
    ////자주 쓰는 주소로 지정 되어있을 시 불러와줌
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isBoolGPS"])
    {
        isPushSave = true;
        _mapsaveImage.image = [UIImage imageNamed:@"map_adress_push.png"];
        Latitude = [[NSUserDefaults standardUserDefaults] doubleForKey:@"lat"];
        Longitude = [[NSUserDefaults standardUserDefaults] doubleForKey:@"lon"];
        order_address_detail = [[NSUserDefaults standardUserDefaults] objectForKey:@"detail"];
        _address2.text = order_address_detail;
        
        if((Latitude==0)&&(Longitude==0))
        {
            [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"isBoolGPS"];
            [self getGPS];
        }
    }
    else
    {
        [self getGPS];
        
    }
    [self findMap];
    
}
- (IBAction)findWithAddress:(UITextField *)sender {
    
    [self getGeoHttp];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [_address1 endEditing:YES];
    [_address2 endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField.returnKeyType == UIReturnKeyNext) {
        [_address1 resignFirstResponder];
        [_address2 becomeFirstResponder];
    }
    else if(textField.returnKeyType == UIReturnKeyDone)
    {
        [_address2 resignFirstResponder];
    }
    return YES;
}


- (void) textFieldText:(id)notification
{
    //주소1에서 모든 키값을 눌렀을때 테스트 로그가 나온다. ->특정 키값을 눌럿을때로 바꿔야 한다. (키코드)

    
}

-(void)getGPS
{
    self.locationManager = [[CLLocationManager alloc] init];
    
    self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    self.locationManager.delegate = self;
    
    [self.locationManager startUpdatingLocation];
    [self.locationManager startUpdatingHeading];
    
    CLLocation *curPos = self.locationManager.location;
    NSNumber *nLatitude = [NSNumber numberWithDouble:curPos.coordinate.latitude]; // 위도
    NSNumber *nLongitude = [NSNumber numberWithDouble:curPos.coordinate.longitude]; // 경도
    
    NSString *sPosition1 = [NSString stringWithFormat:@"%.9f",
                            [nLatitude doubleValue]];
    NSString *sPosition2 = [NSString stringWithFormat:@"%.9f",
                            [nLongitude doubleValue]];
    /// lat lon 이 널값일 때 오류..
    Latitude = [sPosition1 doubleValue];
    Longitude = [sPosition2 doubleValue];
    
}

-(void)findMap
{
    
    {
        // Start your spinner animating
        
        [self.activityIndicatorView startAnimating];
        _mapImage.hidden=YES;
        // Create your dispatch queue
        dispatch_queue_t myNewQueue = dispatch_queue_create("my Queue", NULL);
        
        // Dispatch work to your queue
        dispatch_async(myNewQueue, ^{
            
            // Perform long activity here.
            
            
            // Dispatch work back to the main queue for your UIKit changes
            dispatch_async(dispatch_get_main_queue(), ^{
                
                // update your UI here from your changes.
                [self.activityIndicatorView stopAnimating];
                _mapImage.hidden=NO;
                
                float xR = [[NSUserDefaults standardUserDefaults] floatForKey:@"xRatio"];
                float yR = [[NSUserDefaults standardUserDefaults] floatForKey:@"yRatio"];
                int x = roundf(320.0*xR);
                int y = roundf(247.0*yR);
                
                _daumMap = [[MTMapView alloc] initWithFrame:CGRectMake(0, 0, x, y)];
                
                [_daumMap setDaumMapApiKey:@"8190bbc9252568d18d980f73bcf109a2"];
                _daumMap.delegate = self;
                _daumMap.baseMapType = MTMapTypeStandard;
                [_daumMap setMapCenterPoint:[MTMapPoint mapPointWithGeoCoord:MTMapPointGeoMake(Latitude, Longitude)] animated:NO];
                [_daumMap setZoomLevel:0 animated:NO];
                
                [_mapView addSubview:_daumMap];
                
                MTMapPoint *mapPoint1 = [MTMapPoint mapPointWithGeoCoord:MTMapPointGeoMake(Latitude, Longitude)];
                
                NSString* address = [MTMapReverseGeoCoder findAddressForMapPoint:mapPoint1 withOpenAPIKey:@"8190bbc9252568d18d980f73bcf109a2"];
                
                if(address==nil){
                    _address1.text=[NSString stringWithFormat:@"%@",@""];
                }else{
                    _address1.text=[NSString stringWithFormat:@"%@",address];
                }
            });
        });
        
    }
    
    
    
    
    
    
}
- (void)MTMapView:(MTMapView*)mapView dragEndedOnMapPoint:(MTMapPoint*)mapPoint{
    
    mappoint = mapPoint.mapPointGeo;

    
    NSString* address = [MTMapReverseGeoCoder findAddressForMapPoint:mapPoint withOpenAPIKey:@"8190bbc9252568d18d980f73bcf109a2"];
    
    if(address==nil){
        _address1.text=[NSString stringWithFormat:@"%@",@""];
    }else{
        _address1.text=[NSString stringWithFormat:@"%@",address];
    }
}



- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    
}


////////////////////////////////////메모리경고//////////////////////////////////////
- (void)didReceiveMemoryWarning {
    @try
    {
        [super didReceiveMemoryWarning];
    }
    @catch (NSException *exception)
    {
        NSLog(@"Exception %@",exception);
    }
}
////////////////////////////////////뒤로가기 버튼//////////////////////////////////////
- (IBAction)cancelButton:(UIButton *)sender {
    UIStoryboard *storyboard = self.storyboard;
    RootViewController *backViewController = [storyboard instantiateViewControllerWithIdentifier:@"ServiceVC"];
    backViewController.serviceArray = serviceArray;
    backViewController.serviceTotalPrice = serviceTotalPrice;
    
    [self presentViewController:backViewController animated:NO completion:nil];
    
}
////////////////////////////////////결제하기 버튼//////////////////////////////////////
- (IBAction)payButton:(UIButton *)sender {
    if(_address2.text.length!=0)
    {
        UIStoryboard *storyboard = self.storyboard;
        PayPageViewController *nextViewController = [storyboard instantiateViewControllerWithIdentifier:@"PayVC"];
        
        order_address = [order_address stringByAppendingString:_address1.text];
        nextViewController.segueData_2 = order_address;
        nextViewController.segueData_3 = _address2.text;
        nextViewController.serviceArray = serviceArray;
        nextViewController.serviceTotalPrice = serviceTotalPrice;
        
        
        [self presentViewController:nextViewController animated:NO completion:nil];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"알림"
                                                       message:@"상세주소가 입력되지 않았습니다. 상세주소를 입력해 주세요."
                                                      delegate:self
                                             cancelButtonTitle:nil    /* nil 로 지정할 경우 cancel button 없음 */
                                             otherButtonTitles:@"확인", nil];
        // alert창을 띄우는 method는 show이다.
        [alert show];
    }
    
    
}



//재탐색 버튼
- (IBAction)refindButton:(UIButton *)sender {
    
    [self getGPS];
    [self findMap];
    
    
}

- (IBAction)saveCurrentGPS:(UIButton *)sender {
    if(!isPushSave)
    {
        isPushSave = true;
        _mapsaveImage.image = [UIImage imageNamed:@"map_adress_push.png"];
        [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"isBoolGPS"];
        [[NSUserDefaults standardUserDefaults] setDouble:mappoint.latitude forKey:@"lat"];
        [[NSUserDefaults standardUserDefaults] setDouble:mappoint.longitude forKey:@"lon"];
        [[NSUserDefaults standardUserDefaults] setObject:_address2.text forKey:@"detail"];
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"알림"
                                                       message:@"현재 주소가 기본 주소로 저장되었습니다."
                                                      delegate:self
                                             cancelButtonTitle:nil    /* nil 로 지정할 경우 cancel button 없음 */
                                             otherButtonTitles:@"확인", nil];
        // alert창을 띄우는 method는 show이다.
        [alert show];
    }
    else
    {
        isPushSave = false;
        _mapsaveImage.image = [UIImage imageNamed:@"map_adress.png"];
        [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"isBoolGPS"];
        
    }
    
    
}

-(void)getGeoHttp
{
    NSString *appurl;
    NSString *temp =@"https://apis.daum.net/local/geo/addr2coord?apikey=8190bbc9252568d18d980f73bcf109a2&q=";
    NSString *temp1 =@"&output=json";
    appurl = [NSString stringWithFormat:@"%@%@%@",temp,_address1.text,temp1];
    appurl = [appurl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:appurl]];
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse: nil error: nil ];
    
    NSString *responseData = [[NSString alloc]initWithData:returnData encoding:NSUTF8StringEncoding];
    
    responseData = [responseData stringByReplacingOccurrencesOfString:@"[" withString:@""];
    responseData = [responseData stringByReplacingOccurrencesOfString:@"]" withString:@""];
    
    
    NSError *e;
    NSData *data = [responseData dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&e];
    
    
    NSDictionary  *temp_channel = [jsonData objectForKey:@"channel"];
    
    
    NSDictionary  *temp_item = [temp_channel objectForKey:@"item"];
    
    
    NSString  *lat = [temp_item objectForKey:@"lat"];
    NSString  *lng = [temp_item objectForKey:@"lng"];
    
    double Latitude= [lat doubleValue];
    double Longitude= [lng doubleValue];

    [_daumMap setMapCenterPoint:[MTMapPoint mapPointWithGeoCoord:MTMapPointGeoMake(Latitude, Longitude)] animated:NO];
    
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

@end
