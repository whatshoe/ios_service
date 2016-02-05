//
//  RightSwipeSegue.m
//  whatshoe
//
//  Created by comso on 2015. 11. 6..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import "RightSwipeSegue.h"

@implementation RightSwipeSegue

-(void)perform
{
    UIViewController* source = (UIViewController *)self.sourceViewController;
    UIViewController* destination = (UIViewController *)self.destinationViewController;
    
    CGRect sourceFrame = source.view.frame;
    sourceFrame.origin.x = -sourceFrame.size.width;
    
    CGRect destFrame = destination.view.frame;
    destFrame.origin.x = destination.view.frame.size.width;
    destination.view.frame = destFrame;
    
    destFrame.origin.x = 0;
    
    
    [source.view.superview addSubview:destination.view];
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         source.view.frame = sourceFrame;
                         destination.view.frame = destFrame;
                     }
                     completion:^(BOOL finished) {
                         UIWindow *window = source.view.window;
                         [window setRootViewController:destination];
                     }];
}

@end
