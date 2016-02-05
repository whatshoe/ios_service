//
//  PayWebViewController.m
//  whatshoe
//
//  Created by comso on 2015. 11. 14..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import "PayWebViewController.h"
#import "PayPageViewController.h"
#import "HttpPostManager.h"
@interface PayWebViewController ()

@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UILabel *navigationBar;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *barButton;
@property (weak, nonatomic) IBOutlet UIWebView *webView;


@end

@implementation PayWebViewController

@synthesize segueData_2;
@synthesize segueData_3;
@synthesize payTitle;
@synthesize loginId;
@synthesize payUrl;
@synthesize order_time;
@synthesize serviceArray;
@synthesize serviceTotalPrice;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _titleLabel.text = payTitle;
    NSURL *url = [NSURL URLWithString:[payUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView setScalesPageToFit:YES];
    [_webView loadRequest:request];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:NO];
    float xR = [[NSUserDefaults standardUserDefaults] floatForKey:@"xRatio"];
    float yR = [[NSUserDefaults standardUserDefaults] floatForKey:@"yRatio"];
    
    //////////////////////////컨포넌트 재설정/////////////////////////////////
    _mainView.frame = CGRectMake(_mainView.frame.origin.x*xR, _mainView.frame.origin.y*yR, _mainView.frame.size.width*xR, _mainView.frame.size.height*yR);
    _navigationBar.frame = CGRectMake(_navigationBar.frame.origin.x*xR, _navigationBar.frame.origin.y*yR, _navigationBar.frame.size.width*xR, _navigationBar.frame.size.height*yR);
    _barButton.frame = CGRectMake(_barButton.frame.origin.x*xR, _barButton.frame.origin.y*yR, _barButton.frame.size.width*xR, _barButton.frame.size.height*yR);
    _webView.frame = CGRectMake(_webView.frame.origin.x*xR, _webView.frame.origin.y*yR, _webView.frame.size.width*xR, _webView.frame.size.height*yR);
    
    ////+font//////
    float fontSize18 = 18*yR;
    _titleLabel.frame = CGRectMake(_titleLabel.frame.origin.x*xR, _titleLabel.frame.origin.y*yR, _titleLabel.frame.size.width*xR, _titleLabel.frame.size.height*yR);
    [_titleLabel setFont:[UIFont fontWithName:@"System Font Heavy" size:fontSize18]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cancelButton:(UIButton*)sender {
//    NSString *currentURL = [_webView stringByEvaluatingJavaScriptFromString:@"window.location.href"];
//    NSLog(@"URL : %@",currentURL);
    

   if([self checkPayComplete])
    {
        UIStoryboard *storyboard = self.storyboard;
        UIViewController *nextViewController = [storyboard instantiateViewControllerWithIdentifier:@"ServiceVC"];
        [self presentViewController:nextViewController animated:NO completion:nil];
    }
    else
    {
        UIStoryboard *storyboard = self.storyboard;
        PayPageViewController *nextViewController = [storyboard instantiateViewControllerWithIdentifier:@"PayVC"];
        nextViewController.segueData_2 = segueData_2;
        nextViewController.segueData_3 = segueData_3;
        nextViewController.serviceArray = serviceArray;
        nextViewController.serviceTotalPrice = serviceTotalPrice;
        [self presentViewController:nextViewController animated:NO completion:nil];

    }
}

- (Boolean)checkPayComplete
{
    NSString *result;
    HttpPostManager *checkHttp = [[HttpPostManager alloc]init];
    [checkHttp setURL:@"iphone_checkPayComplete"];
    [checkHttp addEntity:@"id" over:loginId];
    [checkHttp addEntity:@"order_time" over:order_time];
    [checkHttp addEntity:@"order_state" over:@"0"];
    result = [checkHttp startHttp:@"checkPayCompelete"];
    
    
    if([result isEqualToString:@"suc"])
    {
        return true;
    }
    else
    {
        return false;
    }
    
    
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
