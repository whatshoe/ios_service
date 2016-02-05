//
//  RightSwipeSegue.m
//  whatshoe
//
//  Created by comso on 2015. 11. 6..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import "ModalDismissSegue.h"

@implementation ModalDismissSegue

-(void)perform
{
    
    UIViewController* source = (UIViewController *)self.sourceViewController;
    //현재 뷰
    UIViewController* destination = (UIViewController *)self.destinationViewController;
    //다음 뷰
    
    [source.view layoutIfNeeded];
    CGRect sourceFrame = source.view.frame;
    
    sourceFrame.origin.y = source.view.frame.size.height;
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         
                         source.view.frame = sourceFrame;
                         
                     }
                     completion:^(BOOL finished) {
                         UIWindow *window = source.view.window;
                         [window setRootViewController:destination];
                     }];
    
}

@end



//modalDismissSegue
