//
//  MapViewController.h
//  whatshoe
//
//  Created by whatshoe on 2015. 11. 2..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

///////델리게이트를 이용한 값넘기기
@protocol VCDelegate <NSObject>
-(void) vcDelegateMsg:(NSString *)str;
@end
static double Latitude;
static double Longitude;
////////////////뷰컨트롤러 생성
@interface MapViewController : UIViewController<CLLocationManagerDelegate>

@property (weak, nonatomic) id<VCDelegate> delegate;
@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic,retain) NSMutableArray *serviceArray;
@property (nonatomic) int serviceTotalPrice;
@end
