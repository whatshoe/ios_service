//
//  ServiceViewController.h
//  whatshoe
//
//  Created by whatshoe on 2015. 11. 1..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCSlidingViewController.h"
#import <CoreLocation/CoreLocation.h>
@interface ServiceViewController : UIViewController<CLLocationManagerDelegate> {
    
    CLLocationManager *locationManager;
}
- (IBAction)toggleLeftButtonClicked:(id)sender;
@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, retain) NSMutableArray *serviceArray;
@property (nonatomic) int serviceTotalPrice;
@end



