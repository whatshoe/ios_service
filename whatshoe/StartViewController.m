//
//  StartViewController.m
//  whatshoe
//
//  Created by comso on 2015. 11. 5..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import "StartViewController.h"
#import "HttpPostManager.h"

@interface StartViewController ()
{
    NSString *version;
}
@property (weak, nonatomic) IBOutlet UIImageView *startImage;


@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", [[NSUserDefaults standardUserDefaults] dictionaryRepresentation]);
    version = [[NSString alloc]init];

    
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:NO];
    float xR = [[NSUserDefaults standardUserDefaults] floatForKey:@"xRatio"];
    float yR = [[NSUserDefaults standardUserDefaults] floatForKey:@"yRatio"];
    


    
    //////////////////////////컨포넌트 재설정/////////////////////////////////
    _startImage.frame = CGRectMake(_startImage.frame.origin.x*xR, _startImage.frame.origin.y*yR, _startImage.frame.size.width*xR, _startImage.frame.size.height*yR);
    //데이터 저장하기
    
    
    version = @"ios_1.4";
    NSString *result = [self versionCheckHttp];
    if([result isEqualToString:@"update"])
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"새로운 버전이 출시했습니다. \n업데이트 하시겠습니까?"
                                                       message:nil
                                                      delegate:self
                                             cancelButtonTitle:@"아니요"
                                             otherButtonTitles:@"업데이트", nil];
        
        alert.tag = 100;
        // alert창을 띄우는 method는 show이다.
        [alert show];
    }
    else
    {
        if([[NSUserDefaults standardUserDefaults] stringForKey:@"loginId"] != NULL)
        {
            UIStoryboard *storyboard = self.storyboard;
            UIViewController *StartPage01ViewController = [storyboard instantiateViewControllerWithIdentifier:@"ServiceVC"];
            [self presentViewController:StartPage01ViewController animated:NO completion:nil];
        }
        else
        {
            UIStoryboard *storyboard = self.storyboard;
            UIViewController *StartPage01ViewController = [storyboard instantiateViewControllerWithIdentifier:@"Page01"];
            [self presentViewController:StartPage01ViewController animated:NO completion:nil];
        }
    }

    
}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (alertView.tag == 100)
    {
        if (buttonIndex == 1)
        {
            NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/app/id1053784663"];
            [[UIApplication sharedApplication] openURL:url];
        }
        else
        {
            if([[NSUserDefaults standardUserDefaults] stringForKey:@"loginId"] != NULL)
            {
                UIStoryboard *storyboard = self.storyboard;
                UIViewController *StartPage01ViewController = [storyboard instantiateViewControllerWithIdentifier:@"ServiceVC"];
                [self presentViewController:StartPage01ViewController animated:NO completion:nil];
            }
            else
            {
                UIStoryboard *storyboard = self.storyboard;
                UIViewController *StartPage01ViewController = [storyboard instantiateViewControllerWithIdentifier:@"Page01"];
                [self presentViewController:StartPage01ViewController animated:NO completion:nil];
            }
        }
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *)versionCheckHttp
{
    NSString *result;
    HttpPostManager *versionCheckHttp = [[HttpPostManager alloc]init];
    [versionCheckHttp setURL:@"iphone_version"];
    [versionCheckHttp addEntity:@"version" over:version];
    result = [versionCheckHttp startHttp:@"version_check"];
    return result;
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
