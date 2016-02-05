//
//  MyshoeViewController.m
//  whatshoe
//
//  Created by whatshoe on 2015. 11. 17..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import "MyshoeViewController.h"
#import "HttpPostManager.h"
#import "ModalDismissSegue.h"

@interface MyshoeViewController (){
    Boolean isSelectGift;
    bool current_order;
    NSString *order_time;
    NSString *order_id;
    NSString *order_code;
    NSString *order_state;
}
@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UIView *myshoebox;
@property (weak, nonatomic) IBOutlet UIImageView *cancelImage;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIImageView *myshoeImage;
@property (weak, nonatomic) IBOutlet UILabel *myshoeLabel;

@end

@implementation MyshoeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _myshoebox.layer.cornerRadius = 10.f;
    
    current_order = [[NSUserDefaults standardUserDefaults] boolForKey:@"current_order"];
    if(current_order)
    {
        order_time = [[NSUserDefaults standardUserDefaults]stringForKey:@"order_time"];
        order_code = [[NSUserDefaults standardUserDefaults]stringForKey:@"order_code"];
        order_id = [[NSUserDefaults standardUserDefaults]stringForKey:@"loginId"];
        order_state = [self getOrderState];
    }

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
    _backgroundImage.frame = CGRectMake(_backgroundImage.frame.origin.x*xR, _backgroundImage.frame.origin.y*yR, _backgroundImage.frame.size.width*xR, _backgroundImage.frame.size.height*yR);
    _myshoebox.frame = CGRectMake(_myshoebox.frame.origin.x*xR, _myshoebox.frame.origin.y*yR, _myshoebox.frame.size.width*xR, _myshoebox.frame.size.height*yR);
    _cancelButton.frame = CGRectMake(_cancelButton.frame.origin.x*xR, _cancelButton.frame.origin.y*yR, _cancelButton.frame.size.width*xR, _cancelButton.frame.size.height*yR);
    _cancelImage.frame = CGRectMake(_cancelImage.frame.origin.x*xR, _cancelImage.frame.origin.y*yR, _cancelImage.frame.size.width*xR, _cancelImage.frame.size.height*yR);
    _myshoeImage.frame = CGRectMake(_myshoeImage.frame.origin.x*xR, _myshoeImage.frame.origin.y*yR, _myshoeImage.frame.size.width*xR, _myshoeImage.frame.size.height*yR);
    
    /////+font/////
    
    
    
    float fontSize15 = 15*yR;
    
    
    _myshoeLabel.frame = CGRectMake(_myshoeLabel.frame.origin.x*xR, _myshoeLabel.frame.origin.y*yR, _myshoeLabel.frame.size.width*xR, _myshoeLabel.frame.size.height*yR);
    [_myshoeLabel setFont:[UIFont fontWithName:@"System Font Bold" size:fontSize15]];
    
    
}


- (IBAction)cancelButton:(id)sender {
    if(!isSelectGift)
    {
        isSelectGift = true;
        _cancelImage.image = [UIImage imageNamed:@"myshoe_cancle_press.png"];
    }
    
    UIStoryboard *storyboard = self.storyboard;
    UIViewController *mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"ServiceVC"];
    ModalDismissSegue *segue = [[ModalDismissSegue alloc] initWithIdentifier:@"" source:self destination:mainViewController];
    [self prepareForSegue:segue sender:sender];
    [segue perform];
    
}


- (NSString *)getOrderState
{
    NSString *result;
    HttpPostManager *orderStateHttp = [[HttpPostManager alloc]init];
    [orderStateHttp setURL:@"iphone_getorderstate"];
    [orderStateHttp addEntity:@"id" over:order_id];
    [orderStateHttp addEntity:@"order_time" over:order_time];
    [orderStateHttp addEntity:@"order_code" over:order_code];
    result = [orderStateHttp startHttp:@"order_state"];
    
    return result;
}

@end
