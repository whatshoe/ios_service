//
//  RootViewController.m
//  whatshoe
//
//  Created by whatshoe on 2015. 11. 13..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import "RootViewController.h"
#import "MenuViewController.h"
#import "ServiceViewController.h"
#import <CoreLocation/CoreLocation.h>

@implementation RootViewController{
    IBOutlet UIView *mainView;
    bool isViewWillAppear;
    
}
@synthesize serviceArray;
@synthesize serviceTotalPrice;
- (void)viewDidLoad
{
    [super viewDidLoad];
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
        mainView.frame = CGRectMake(mainView.frame.origin.x*xR, mainView.frame.origin.y*yR, mainView.frame.size.width*xR, mainView.frame.size.height*yR);
        
        self.peakAmount = 264*xR;
        
        
        UIStoryboard *storyboard = self.storyboard;
        
        ServiceViewController *topViewController = [storyboard instantiateViewControllerWithIdentifier:@"TopViewController"];
        topViewController.serviceArray = serviceArray;
        topViewController.serviceTotalPrice = serviceTotalPrice;
        
        self.topViewController = topViewController;
        
        
        MenuViewController *leftViewController = [storyboard instantiateViewControllerWithIdentifier:@"LeftViewController"];
        self.leftSideViewController = leftViewController;

    }
}

@end
