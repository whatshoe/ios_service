//
//  EventViewController.m
//  whatshoe
//
//  Created by whatshoe on 2015. 11. 16..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import "EventViewController.h"
#import "HttpPostManager.h"
#import "EventDetailViewController.h"

@interface EventViewController () <UIScrollViewDelegate>
{
    bool isViewWillAppear;
}
@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UILabel *navigationBar;
@property (weak, nonatomic) IBOutlet UIButton *barButton;
@property (weak, nonatomic) IBOutlet UILabel *barLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation EventViewController

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
    if(!isViewWillAppear)
    {
        isViewWillAppear = true;
        [super viewWillAppear:NO];
        float xR = [[NSUserDefaults standardUserDefaults] floatForKey:@"xRatio"];
        float yR = [[NSUserDefaults standardUserDefaults] floatForKey:@"yRatio"];
        
        
        
        //////////////////////////컨포넌트 재설정/////////////////////////////////
        _mainView.frame = CGRectMake(_mainView.frame.origin.x*xR, _mainView.frame.origin.y*yR, _mainView.frame.size.width*xR, _mainView.frame.size.height*yR);
        _navigationBar.frame = CGRectMake(_navigationBar.frame.origin.x*xR, _navigationBar.frame.origin.y*yR, _navigationBar.frame.size.width*xR, _navigationBar.frame.size.height*yR);
        _barButton.frame = CGRectMake(_barButton.frame.origin.x*xR, _barButton.frame.origin.y*yR, _barButton.frame.size.width*xR, _barButton.frame.size.height*yR);
        _scrollView.frame = CGRectMake(_scrollView.frame.origin.x*xR, _scrollView.frame.origin.y*yR, _scrollView.frame.size.width*xR, _scrollView.frame.size.height*yR);
        
//        _scrollView.delegate = self;
        /////+font/////
        
        
        
        float fontSize18 = 18*yR;
        
        
        _barLabel.frame = CGRectMake(_barLabel.frame.origin.x*xR, _barLabel.frame.origin.y*yR, _barLabel.frame.size.width*xR, _barLabel.frame.size.height*yR);
        [_barLabel setFont:[UIFont fontWithName:@"System Font Heavy" size:fontSize18]];
        
        
        [self eventThumbnail];
    }
}



- (IBAction)cancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)eventButton:(UIButton*)sender
{
    NSInteger buttonTag = sender.tag;
//    NSLog(@"%ld",(long)buttonTag);
    
    UIStoryboard *storyboard = self.storyboard;
    EventDetailViewController *mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"EventDetailVC"];
    [mainViewController setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    
    NSString *urlString = @"http://whatshoe.co.kr/event/";
    NSString *tempString = [NSString stringWithFormat:@"event_detail_%ld.png",(long)buttonTag];
    urlString = [urlString stringByAppendingString:tempString];
    mainViewController.imageUrl = urlString;
    
    UINavigationController *navCon = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    navCon.navigationBarHidden = YES;
    navCon.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController:navCon animated:YES completion:nil];
    
}
- (void)eventThumbnail
{
    float xR = [[NSUserDefaults standardUserDefaults] floatForKey:@"xRatio"];
    float yR = [[NSUserDefaults standardUserDefaults] floatForKey:@"yRatio"];
    NSString *result = [self eventCountHttp];
    int eventCount = [result intValue];
    for(int i=0; i<eventCount ; i++)
    {
        NSString *urlString = @"http://whatshoe.co.kr/event/";
        NSString *tempString = [NSString stringWithFormat:@"event_%d.png",i+1];
        urlString = [urlString stringByAppendingString:tempString];
        NSURL *url = [NSURL URLWithString:urlString];
//        NSLog(@"%@",url);
        UIButton *mybutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        mybutton.tag = i+1;
        mybutton.frame = CGRectMake(0, 0, 320*xR, 80*yR);
        
        UIImageView *myImageView =[[UIImageView alloc]init];
        myImageView.frame = CGRectMake(0, 0, 320*xR, 80*yR);
        [self loadImageFromURL:url imageView:myImageView];
        [mybutton addSubview:myImageView];
        [mybutton addTarget:self action:@selector(eventButton:) forControlEvents:UIControlEventTouchUpInside];
        [_scrollView addSubview:mybutton];
    }
}
-(NSString *)eventCountHttp
{
    NSString *result;
    HttpPostManager *eventCountHttp = [[HttpPostManager alloc]init];
    [eventCountHttp setURL:@"iphone_event_count"];
    NSString *order_name = [[NSUserDefaults standardUserDefaults] objectForKey:@"loginId"];
    [eventCountHttp addEntity:@"id" over:order_name];
    
    result = [eventCountHttp startHttp:@"popupCount"];
    return result;
}
-(void)loadImageFromURL:(NSURL*)url imageView:(UIImageView*)imageView
{
    dispatch_async( dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0 ), ^(void)
                   {
                       NSData * data = [[NSData alloc] initWithContentsOfURL:url];
                       UIImage * image = [[UIImage alloc] initWithData:data];
                       dispatch_async( dispatch_get_main_queue(), ^(void)
                                      {
                                          if( image != nil )
                                          {
//                                              NSLog(@"%@",imageView);
                                              imageView.image = image;
                                          } else {
                                              UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"알림"
                                                                                             message:@"이미지를 불러오는데 실패했습니다.\n인터넷 연결상태를 확인해주세요."
                                                                                            delegate:self
                                                                                   cancelButtonTitle:nil
                                                                                   otherButtonTitles:@"확인", nil];
                                              [alert show];
                                          }
                                      });
                   });
}
@end
