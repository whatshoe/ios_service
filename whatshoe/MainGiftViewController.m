//
//  MainGiftViewController.m
//  whatshoe
//
//  Created by comso on 2015. 11. 6..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import "MainGiftViewController.h"

@interface MainGiftViewController ()

@end

@implementation MainGiftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cancelButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)giftButton01:(UIButton *)sender {
    UIStoryboard *storyboard = self.storyboard;
    UIViewController *modalViewController = [storyboard instantiateViewControllerWithIdentifier:@"Gift01VC"];
    [self presentViewController:modalViewController animated:YES completion:nil];
}
- (IBAction)giftButton02:(UIButton *)sender {
    UIStoryboard *storyboard = self.storyboard;
    UIViewController *modalViewController = [storyboard instantiateViewControllerWithIdentifier:@"Gift02VC"];
    [self presentViewController:modalViewController animated:YES completion:nil];
}
- (IBAction)giftButton03:(UIButton *)sender {
    UIStoryboard *storyboard = self.storyboard;
    UIViewController *modalViewController = [storyboard instantiateViewControllerWithIdentifier:@"Gift03VC"];
    [self presentViewController:modalViewController animated:YES completion:nil];
}
- (IBAction)giftButton04:(UIButton *)sender {
    UIStoryboard *storyboard = self.storyboard;
    UIViewController *modalViewController = [storyboard instantiateViewControllerWithIdentifier:@"Gift04VC"];
    [self presentViewController:modalViewController animated:YES completion:nil];
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
