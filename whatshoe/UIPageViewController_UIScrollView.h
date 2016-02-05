//
//  UIPageViewController_UIScrollView.h
//  whatshoe
//
//  Created by whatshoe on 2015. 10. 30..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIPageViewController ()
- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
     return NO;
}
@end
