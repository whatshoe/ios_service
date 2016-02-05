//
//  PayCompleteViewController.m
//  whatshoe
//
//  Created by comso on 2016. 1. 7..
//  Copyright © 2016년 whatshoe. All rights reserved.
//

#import "PayCompleteViewController.h"

@interface PayCompleteViewController ()
@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *completeButton;

@end

@implementation PayCompleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:NO];
    float xR = [[NSUserDefaults standardUserDefaults] floatForKey:@"xRatio"];
    float yR = [[NSUserDefaults standardUserDefaults] floatForKey:@"yRatio"];
    
    //////////////////////////컨포넌트 재설정/////////////////////////////////
    _mainView.frame = CGRectMake(_mainView.frame.origin.x*xR, _mainView.frame.origin.y*yR, _mainView.frame.size.width*xR, _mainView.frame.size.height*yR);
    _imageView.frame = CGRectMake(_imageView.frame.origin.x*xR, _imageView.frame.origin.y*yR, _imageView.frame.size.width*xR, _imageView.frame.size.height*yR);
    _completeButton.frame = CGRectMake(_completeButton.frame.origin.x*xR, _completeButton.frame.origin.y*yR, _completeButton.frame.size.width*xR, _completeButton.frame.size.height*yR);

}
- (IBAction)complete:(UIButton *)sender {
    UIStoryboard *storyboard = self.storyboard;
    UIViewController *serviceViewController = [storyboard instantiateViewControllerWithIdentifier:@"ServiceVC"];
    [self presentViewController:serviceViewController animated:NO completion:nil];
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
