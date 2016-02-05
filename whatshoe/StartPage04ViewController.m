//
//  StartPage04ViewController.m
//  whatshoe
//
//  Created by comso on 2015. 11. 6..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import "StartPage04ViewController.h"
#import "LeftSwipeSegue.h"
#import "RightSwipeSegue.h"

@interface StartPage04ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *pageImage;

@end

@implementation StartPage04ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:NO];
    float xR = [[NSUserDefaults standardUserDefaults] floatForKey:@"xRatio"];
    float yR = [[NSUserDefaults standardUserDefaults] floatForKey:@"yRatio"];
    
    //////////////////////////컨포넌트 재설정/////////////////////////////////
    _pageImage.frame = CGRectMake(_pageImage.frame.origin.x*xR, _pageImage.frame.origin.y*yR, _pageImage.frame.size.width*xR, _pageImage.frame.size.height*yR);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)leftSwipeAction:(UISwipeGestureRecognizer *)sender {
    UIStoryboard *storyboard = self.storyboard;
    UIViewController *mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"Page03"];
    LeftSwipeSegue *segue = [[LeftSwipeSegue alloc] initWithIdentifier:@"" source:self destination:mainViewController];
    [self prepareForSegue:segue sender:sender];
    [segue perform];
}
- (IBAction)rightSwipeAction:(UISwipeGestureRecognizer *)sender {
    UIStoryboard *storyboard = self.storyboard;
    UIViewController *mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"Page05"];
    RightSwipeSegue *segue = [[RightSwipeSegue alloc] initWithIdentifier:@"" source:self destination:mainViewController];
    [self prepareForSegue:segue sender:sender];
    [segue perform];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
