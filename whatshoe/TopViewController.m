//
//  TopViewController.m
//  whatshoe
//
//  Created by whatshoe on 2015. 11. 13..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import "TopViewController.h"


@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)toggleLeftButtonClicked:(id)sender {
    [self.slidingViewController slideRight];

}
@end
