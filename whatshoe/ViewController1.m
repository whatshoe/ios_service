//
//  ViewController1.m
//  whatshoe
//
//  Created by whatshoe on 2015. 10. 29..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
     [super viewDidLoad];
     [scroller setScrollEnabled:YES];
    [scroller setContentSize:CGSizeMake(320, 720)];
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

@end
