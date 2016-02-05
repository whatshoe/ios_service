//
//  PayDetailViewController.m
//  whatshoe
//
//  Created by comso on 2016. 1. 25..
//  Copyright © 2016년 whatshoe. All rights reserved.
//

#import "PayDetailViewController.h"
#import "SelectCode.h"
#import "OrderTable.h"
#import "OrderObject.h"
#import "PayDetailCell.h"

@interface PayDetailViewController ()
{
    NSMutableArray *detailArray;
    NSArray *_feedItems;
}
@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UIView *popupBoxView;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *bgImage;
@property (weak, nonatomic) IBOutlet UIImageView *popupBar;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *wonLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation PayDetailViewController
@synthesize serviceArray;
@synthesize serviceTotalPrice;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    detailArray = [[NSMutableArray alloc]init];
    for(SelectCode *temp in serviceArray)
    {
        NSMutableArray *tempArray = [OrderTable table_manager:temp.order_code];

        [detailArray addObjectsFromArray:tempArray];
    }

    [self itemsDownloaded:detailArray];
    
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc]init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *num = [NSNumber numberWithInt:serviceTotalPrice];
    NSString *won = [numberFormatter stringFromNumber:num];
    _priceLabel.text = won;

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
    
    
    float fontSize15 = 15*yR;
    //////////////////////////컨포넌트 재설정/////////////////////////////////
    _mainView.frame = CGRectMake(_mainView.frame.origin.x*xR, _mainView.frame.origin.y*yR, _mainView.frame.size.width*xR, _mainView.frame.size.height*yR);
    _backgroundImage.frame = CGRectMake(_backgroundImage.frame.origin.x*xR, _backgroundImage.frame.origin.y*yR, _backgroundImage.frame.size.width*xR, _backgroundImage.frame.size.height*yR);
    _popupBoxView.frame = CGRectMake(_popupBoxView.frame.origin.x*xR, _popupBoxView.frame.origin.y*yR, _popupBoxView.frame.size.width*xR, _popupBoxView.frame.size.height*yR);
    _cancelButton.frame = CGRectMake(_cancelButton.frame.origin.x*xR, _cancelButton.frame.origin.y*yR, _cancelButton.frame.size.width*xR, _cancelButton.frame.size.height*yR);
    _tableView.frame = CGRectMake(_tableView.frame.origin.x*xR, _tableView.frame.origin.y*yR, _tableView.frame.size.width*xR, _tableView.frame.size.height*yR);
    
    _bgImage.frame = CGRectMake(_bgImage.frame.origin.x*xR, _bgImage.frame.origin.y*yR, _bgImage.frame.size.width*xR, _bgImage.frame.size.height*yR);
    
    _popupBar.frame = CGRectMake(_popupBar.frame.origin.x*xR, _popupBar.frame.origin.y*yR, _popupBar.frame.size.width*xR, _popupBar.frame.size.height*yR);
    _titleLabel.frame = CGRectMake(_titleLabel.frame.origin.x*xR, _titleLabel.frame.origin.y*yR, _titleLabel.frame.size.width*xR, _titleLabel.frame.size.height*yR);
    [_titleLabel setFont:[UIFont fontWithName:@"System Font" size:fontSize15]];
    _priceLabel.frame = CGRectMake(_priceLabel.frame.origin.x*xR, _priceLabel.frame.origin.y*yR, _priceLabel.frame.size.width*xR, _priceLabel.frame.size.height*yR);
    [_priceLabel setFont:[UIFont fontWithName:@"System Font" size:fontSize15]];
    _wonLabel.frame = CGRectMake(_wonLabel.frame.origin.x*xR, _wonLabel.frame.origin.y*yR, _wonLabel.frame.size.width*xR, _wonLabel.frame.size.height*yR);
    [_wonLabel setFont:[UIFont fontWithName:@"System Font" size:fontSize15]];
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
    return 43*yR;
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
    static NSString *simpleTableIdentifier = @"PayDetailCell";
    
    PayDetailCell *cell = (PayDetailCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"PayDetailCell" owner:self options:nil];
        cell = [nibArray objectAtIndex:0];
    }
    OrderObject *item = _feedItems[indexPath.row];
    
    BOOL index_switch = true;
    NSMutableArray *tempArray = [[NSMutableArray alloc]init];
    for(SelectCode *temp in serviceArray)
    {
        NSString *code = [[NSString alloc]init];
        code = [code stringByAppendingString:temp.order_code];
        NSString *version = [code substringToIndex:3];
        code = [code stringByReplacingOccurrencesOfString:version withString:@""];
        
        for(int i=0; i<code.length/3;i++)
        {
            NSString *temp = [code substringWithRange:NSMakeRange(i*3, 3)];
            SelectCode *tempObject = [[SelectCode alloc]init];
            tempObject.order_code = temp;
            if(index_switch)
            {
                index_switch = false;
                tempObject.service_index = @"T";
            }
            else
            {
                tempObject.service_index = @"F";
            }
            [tempArray addObject:tempObject];
        }
        index_switch = true;
        
    }
    SelectCode *tempCode = tempArray[indexPath.row];
    if([tempCode.service_index isEqualToString:@"T"])
    {
        NSString *temp = [tempCode.order_code substringWithRange:NSMakeRange(0, 1)];
        if([temp isEqualToString:@"1"])
        {
            cell.categoryImage.image = [UIImage imageNamed:@"category_man.png"];
        }
        else if([temp isEqualToString:@"2"])
        {
            cell.categoryImage.image = [UIImage imageNamed:@"category_woman.png"];
        }
        else if([temp isEqualToString:@"3"])
        {
            cell.categoryImage.image = [UIImage imageNamed:@"category_pre_man.png"];
        }
        else if([temp isEqualToString:@"4"])
        {
            cell.categoryImage.image = [UIImage imageNamed:@"category_pre_woman.png"];
        }
        else if([temp isEqualToString:@"5"])
        {
            cell.categoryImage.image = [UIImage imageNamed:@"category_bag.png"];
        }
        else if([temp isEqualToString:@"6"])
        {
            cell.categoryImage.image = [UIImage imageNamed:@"category_belt.png"];
        }
        else if([temp isEqualToString:@"7"])
        {
            cell.categoryImage.image = [UIImage imageNamed:@"category_wallet.png"];
        }
    }
    else
    {
        cell.categoryImage.image = NULL;
    }
    cell.titleLabel.text = item.order_name;
    cell.priceLabel.text = item.order_price;
    
    return cell;
    
}


- (IBAction)okButton:(UIButton *)sender {

    [self dismissViewControllerAnimated:YES completion:nil];
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
