//
//  OrderListViewController.m
//  whatshoe
//
//  Created by comso on 2015. 11. 19..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import "OrderListViewController.h"
#import "HttpPostManager.h"
#import "OrderList.h"
#import "OrderCell.h"
#import "OrderImageViewController.h"
#import "ModalDismissSegue.h"
#import "OrderTable.h"
#import "OrderObject.h"
@interface OrderListViewController ()
{
    NSArray *_feedItems;
    NSString *order_id;
    BOOL isViewWillAppear;

}
@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UILabel *navigationBar;
@property (weak, nonatomic) IBOutlet UIButton *barButton;
@property (weak, nonatomic) IBOutlet UILabel *barLabel;
@property (weak, nonatomic) IBOutlet UIImageView *horse3Image;
@property (weak, nonatomic) IBOutlet UITableView *tableView;



@end

@implementation OrderListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self getOrderList];
    
    //
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"order_list_count"];
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
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
        _horse3Image.frame = CGRectMake(_horse3Image.frame.origin.x*xR, _horse3Image.frame.origin.y*yR, _horse3Image.frame.size.width*xR, _horse3Image.frame.size.height*yR);
        _tableView.frame = CGRectMake(_tableView.frame.origin.x*xR, _tableView.frame.origin.y*yR, _tableView.frame.size.width*xR, _tableView.frame.size.height*yR);
        
        /////+font/////
        //float fontSize13 = 13*yR;
        float fontSize18 = 18*yR;
        
        
        _barLabel.frame = CGRectMake(_barLabel.frame.origin.x*xR, _barLabel.frame.origin.y*yR, _barLabel.frame.size.width*xR, _barLabel.frame.size.height*yR);
        [_barLabel setFont:[UIFont fontWithName:@"System Font Heavy" size:fontSize18]];
    }
    
    

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)itemsDownloaded:(NSArray *)items
{
    // This delegate method will get called when the items are finished downloading
    
    // Set the downloaded items to the array
    _feedItems = items;
    
    // Reload the table view
    [self.tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float yR = [[NSUserDefaults standardUserDefaults] floatForKey:@"yRatio"];
    return 79*yR;
}
#pragma - mark UITableView Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _feedItems.count ;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc] init];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"OrderCell";
    
    OrderCell *cell = (OrderCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"OrderCell" owner:self options:nil];
        cell = [nibArray objectAtIndex:0];
    }
    OrderList *item = _feedItems[indexPath.row];
    cell.timeLabel.text = item.order_time;
    cell.addressLabel.text = item.order_address;
    cell.titleLabel.text = [self titleFromOrderCode:item.order_code];
//    [cell.beforeButton addTarget:self action:@selector(beforeButtonpress:)forControlEvents:UIControlEventTouchUpInside];
//    [cell.afterButton addTarget:self action:@selector(afterButtonpress:) forControlEvents:UIControlEventTouchUpInside];
//    [cell.beforeButton setTag:indexPath.row];
//    [cell.afterButton setTag:indexPath.row];

//    NSString *urlString = @"http://whatshoe.co.kr/whatshoe/img/member_p01.jpg";
//    NSURL *url = [NSURL URLWithString:urlString];
//    [self loadImageFromURL:url imageView:cell.beforeImage];
//    [self loadImageFromURL:url imageView:cell.afterImage];
    return cell;
    
}

- (NSString *)titleFromOrderCode:(NSString*)order_code
{
    NSMutableArray *array = [OrderTable table_manager:order_code];
    OrderObject *tempObject = [array objectAtIndex:0];
    NSString *title = [[NSString alloc]init];
    NSString *code = [[NSString alloc]init];
    code = [code stringByAppendingString:order_code];
    NSString *version = [code substringToIndex:3];
    if([version isEqualToString:@"#01"])
    {
        code = [code stringByReplacingOccurrencesOfString:version withString:@""];
        NSString *temp = [code substringWithRange:NSMakeRange(0, 1)];
        if([temp isEqualToString:@"1"])
        {
            title = [title stringByAppendingString:@"남자구두 "];
        }
        else if([temp isEqualToString:@"2"])
        {
            title = [title stringByAppendingString:@"여자구두 "];
        }
        else if([temp isEqualToString:@"3"])
        {
            title = [title stringByAppendingString:@"남자명품구두 "];
        }
        else if([temp isEqualToString:@"4"])
        {
            title = [title stringByAppendingString:@"여자명품구두 "];
        }
    }
    else if([version isEqualToString:@"#02"])
    {
        code = [code stringByReplacingOccurrencesOfString:version withString:@""];
        NSString *temp = [code substringWithRange:NSMakeRange(0, 1)];
        if([temp isEqualToString:@"1"])
        {
            title = [title stringByAppendingString:@"남자구두 "];
        }
        else if([temp isEqualToString:@"2"])
        {
            title = [title stringByAppendingString:@"여자구두 "];
        }
        else if([temp isEqualToString:@"3"])
        {
            title = [title stringByAppendingString:@"남자명품구두 "];
        }
        else if([temp isEqualToString:@"4"])
        {
            title = [title stringByAppendingString:@"여자명품구두 "];
        }

    }
    else if([version isEqualToString:@"#03"])
    {
        code = [code stringByReplacingOccurrencesOfString:version withString:@""];
        NSString *temp = [code substringWithRange:NSMakeRange(0, 1)];
        if([temp isEqualToString:@"1"])
        {
            title = [title stringByAppendingString:@"남자구두 "];
        }
        else if([temp isEqualToString:@"2"])
        {
            title = [title stringByAppendingString:@"여자구두 "];
        }
        else if([temp isEqualToString:@"3"])
        {
            title = [title stringByAppendingString:@"남자명품구두 "];
        }
        else if([temp isEqualToString:@"4"])
        {
            title = [title stringByAppendingString:@"여자명품구두 "];
        }
        else if([temp isEqualToString:@"5"])
        {
            title = [title stringByAppendingString:@"가방 "];
        }
        else if([temp isEqualToString:@"6"])
        {
            title = [title stringByAppendingString:@"벨트 "];
        }
        else if([temp isEqualToString:@"7"])
        {
            title = [title stringByAppendingString:@"지갑 "];
        }
    }
    else
    {
        NSLog(@"else : %@",version);
    }
    title = [title stringByAppendingString:tempObject.order_name];
    if(array.count >1)
    {
        NSString *etc_order = [NSString stringWithFormat:@" 외 %tu건",array.count-1];
        title = [title stringByAppendingString:etc_order];
    }
    return title;
}

- (IBAction)cancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)beforeButtonpress:(UIButton*)sender
{
    UIStoryboard *storyboard = self.storyboard;
    OrderImageViewController *modalView = [storyboard instantiateViewControllerWithIdentifier:@"OrderImage"];
    NSString *imageName = @"";
    imageName = [NSString stringWithFormat:@"before %ld",(long)sender.tag];
    modalView.segueData_1 = imageName; // before name
    modalView.segueData_2 = @"Before";
    [modalView setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    UINavigationController *navCon = [[UINavigationController alloc] initWithRootViewController:modalView];
    navCon.navigationBarHidden = YES;
    navCon.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:navCon animated:YES completion:nil];
    
}
- (void)afterButtonpress:(UIButton*)sender
{
    UIStoryboard *storyboard = self.storyboard;
    OrderImageViewController *modalView = [storyboard instantiateViewControllerWithIdentifier:@"OrderImage"];
    NSString *imageName = @"";
    imageName = [NSString stringWithFormat:@"after %ld",(long)sender.tag];
    modalView.segueData_1 = imageName; // atfer name
    modalView.segueData_2 = @"After";
    [modalView setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    UINavigationController *navCon = [[UINavigationController alloc] initWithRootViewController:modalView];
    navCon.navigationBarHidden = YES;
    navCon.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:navCon animated:YES completion:nil];
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
- (void)getOrderList
{
    NSMutableArray *tableCellList = [[NSMutableArray alloc] init];
    
    order_id = [[NSUserDefaults standardUserDefaults] objectForKey:@"loginId"];

    HttpPostManager *orderlistHttp = [[HttpPostManager alloc]init];
    [orderlistHttp setURL:@"iphone_order_history"];
    [orderlistHttp addEntity:@"id" over:order_id];
    
    NSMutableArray *result = (NSMutableArray*)[orderlistHttp startHttp:@"orderHistory"];
    
    for(int i=0; i<result.count;i++)
    {
        OrderList *tempOrderList = result[i];
        [tableCellList addObject:tempOrderList];
    }

    [self itemsDownloaded:tableCellList];
}

- (void)drawBottomBorder:(UIView*)view border:(int)border
{
    NSInteger borderThickness = border;
    UIColor *color_a1a1a1 = [UIColor colorWithRed:(161.0 / 255.0) green:(161.0 / 255.0) blue:(161.0 / 255.0) alpha: 1];
    UIView *bottomBorder = [UIView new];
    bottomBorder.backgroundColor = color_a1a1a1;
    bottomBorder.alpha = 0.6;
    bottomBorder.frame = CGRectMake(0, view.frame.size.height - borderThickness, view.frame.size.width, borderThickness);
    [view addSubview:bottomBorder];
    
}


@end