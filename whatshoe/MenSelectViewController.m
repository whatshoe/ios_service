//
//  MenSelectViewController.m
//  whatshoe
//
//  Created by whatshoe on 2015. 11. 1..
//  Copyright © 2015년 whatshoe. All rights reserved.
//

#import "MenSelectViewController.h"
#import "RootViewController.h"
#import "ServiceViewController.h"
#import "SelectCode.h"

@interface MenSelectViewController ()
{
    Boolean bool_100;
    Boolean bool_101;
    Boolean bool_102;
    Boolean bool_103;
    Boolean bool_104;
    Boolean bool_105;
    Boolean bool_106;
    Boolean bool_107;
    Boolean bool_108;
    Boolean bool_109;
    Boolean bool_110;
    Boolean bool_111;
    
    
    Boolean bool_300;
    Boolean bool_301;
    Boolean bool_302;
    Boolean bool_303;
    Boolean bool_304;
    Boolean bool_305;
    Boolean bool_306;
    Boolean bool_307;
    Boolean bool_308;
    Boolean bool_309;
    Boolean bool_310;
    Boolean bool_311;
    Boolean bool_312;
    Boolean bool_313;
    Boolean bool_314;
    Boolean bool_315;
    
    int tabCount;
    int selectedTab;
    
    int tempServiceTotalPrice;
    UIButton *plusButton;
    UIButton *deleteButton;
    UIButton *selectTabButton;
    NSMutableArray *manShoeArray;
    NSMutableArray *tempServiceArray;
    
    NSMutableArray *shoe1_codeArray;
    NSMutableArray *shoe2_codeArray;
    NSMutableArray *shoe3_codeArray;
    NSMutableArray *shoe4_codeArray;
    
}
@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UILabel *navigationBar;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *barButton;

@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIImageView *manImage;

@property (weak, nonatomic) IBOutlet UIView *middleView;
@property (weak, nonatomic) IBOutlet UILabel *zeroLabel;
@property (weak, nonatomic) IBOutlet UILabel *wonLabel;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIButton *selectButton;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView2;


@property (weak, nonatomic) IBOutlet UIView *man100View;
@property (weak, nonatomic) IBOutlet UIButton *man100Button;
@property (weak, nonatomic) IBOutlet UILabel *man100Label;

@property (weak, nonatomic) IBOutlet UIView *man101View;
@property (weak, nonatomic) IBOutlet UIButton *man101Button;
@property (weak, nonatomic) IBOutlet UILabel *man101Label;

@property (weak, nonatomic) IBOutlet UIView *man102View;
@property (weak, nonatomic) IBOutlet UIButton *man102Button;
@property (weak, nonatomic) IBOutlet UILabel *man102Label;

@property (weak, nonatomic) IBOutlet UIView *man103View;
@property (weak, nonatomic) IBOutlet UIButton *man103Button;
@property (weak, nonatomic) IBOutlet UILabel *man103Label;

@property (weak, nonatomic) IBOutlet UIView *man104View;
@property (weak, nonatomic) IBOutlet UIButton *man104Button;
@property (weak, nonatomic) IBOutlet UILabel *man104Label;

@property (weak, nonatomic) IBOutlet UIView *man105View;
@property (weak, nonatomic) IBOutlet UIButton *man105Button;
@property (weak, nonatomic) IBOutlet UILabel *man105Label;

@property (weak, nonatomic) IBOutlet UIView *man106View;
@property (weak, nonatomic) IBOutlet UIButton *man106Button;
@property (weak, nonatomic) IBOutlet UILabel *man106Label;

@property (weak, nonatomic) IBOutlet UIView *man107View;
@property (weak, nonatomic) IBOutlet UIButton *man107Button;
@property (weak, nonatomic) IBOutlet UILabel *man107Label;

@property (weak, nonatomic) IBOutlet UIView *man108View;
@property (weak, nonatomic) IBOutlet UIButton *man108Button;
@property (weak, nonatomic) IBOutlet UILabel *man108Label;

@property (weak, nonatomic) IBOutlet UIView *man109View;
@property (weak, nonatomic) IBOutlet UIButton *man109Button;
@property (weak, nonatomic) IBOutlet UILabel *man109Label;

@property (weak, nonatomic) IBOutlet UIView *man110View;
@property (weak, nonatomic) IBOutlet UIButton *man110Button;
@property (weak, nonatomic) IBOutlet UILabel *man110Label;

@property (weak, nonatomic) IBOutlet UIView *man111View;
@property (weak, nonatomic) IBOutlet UIButton *man111Button;
@property (weak, nonatomic) IBOutlet UILabel *man111Label;

@property (weak, nonatomic) IBOutlet UIView *man300View;
@property (weak, nonatomic) IBOutlet UILabel *man300Label;
@property (weak, nonatomic) IBOutlet UIButton *man300Button;

@property (weak, nonatomic) IBOutlet UIView *man301View;
@property (weak, nonatomic) IBOutlet UILabel *man301Label;
@property (weak, nonatomic) IBOutlet UIButton *man301Button;

@property (weak, nonatomic) IBOutlet UIView *man302View;
@property (weak, nonatomic) IBOutlet UILabel *man302Label;
@property (weak, nonatomic) IBOutlet UIButton *man302Button;

@property (weak, nonatomic) IBOutlet UIView *man303View;
@property (weak, nonatomic) IBOutlet UILabel *man303Label;
@property (weak, nonatomic) IBOutlet UIButton *man303Button;

@property (weak, nonatomic) IBOutlet UIView *man304View;
@property (weak, nonatomic) IBOutlet UILabel *man304Label;
@property (weak, nonatomic) IBOutlet UIButton *man304Button;

@property (weak, nonatomic) IBOutlet UIView *man305View;
@property (weak, nonatomic) IBOutlet UILabel *man305Label;
@property (weak, nonatomic) IBOutlet UIButton *man305Button;

@property (weak, nonatomic) IBOutlet UIView *man306View;
@property (weak, nonatomic) IBOutlet UILabel *man306Label;
@property (weak, nonatomic) IBOutlet UIButton *man306Button;

@property (weak, nonatomic) IBOutlet UIView *man307View;
@property (weak, nonatomic) IBOutlet UIButton *man307Button;
@property (weak, nonatomic) IBOutlet UILabel *man307Label;

@property (weak, nonatomic) IBOutlet UIView *man308View;
@property (weak, nonatomic) IBOutlet UIButton *man308Button;
@property (weak, nonatomic) IBOutlet UILabel *man308Label;

@property (weak, nonatomic) IBOutlet UIView *man309View;
@property (weak, nonatomic) IBOutlet UIButton *man309Button;
@property (weak, nonatomic) IBOutlet UILabel *man309Label;

@property (weak, nonatomic) IBOutlet UIView *man310View;
@property (weak, nonatomic) IBOutlet UIButton *man310Button;
@property (weak, nonatomic) IBOutlet UILabel *man310Label;

@property (weak, nonatomic) IBOutlet UIView *man311View;
@property (weak, nonatomic) IBOutlet UIButton *man311Button;
@property (weak, nonatomic) IBOutlet UILabel *man311Label;

@property (weak, nonatomic) IBOutlet UIView *man312View;
@property (weak, nonatomic) IBOutlet UIButton *man312Button;
@property (weak, nonatomic) IBOutlet UILabel *man312Label;

@property (weak, nonatomic) IBOutlet UIView *man313View;
@property (weak, nonatomic) IBOutlet UIButton *man313Button;
@property (weak, nonatomic) IBOutlet UILabel *man313Label;

@property (weak, nonatomic) IBOutlet UIView *man314View;
@property (weak, nonatomic) IBOutlet UIButton *man314Button;
@property (weak, nonatomic) IBOutlet UILabel *man314Label;

@property (weak, nonatomic) IBOutlet UIView *man315View;
@property (weak, nonatomic) IBOutlet UIButton *man315Button;
@property (weak, nonatomic) IBOutlet UILabel *man315Label;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *normalButton;
@property (weak, nonatomic) IBOutlet UIImageView *normalImage;
@property (weak, nonatomic) IBOutlet UILabel *normalLabel;

@property (weak, nonatomic) IBOutlet UIButton *premiumButton;
@property (weak, nonatomic) IBOutlet UIImageView *premiumImage;
@property (weak, nonatomic) IBOutlet UILabel *premiumLabel;

@property (weak, nonatomic) IBOutlet UIView *tabView1;
@property (weak, nonatomic) IBOutlet UIView *tabView2;
@property (weak, nonatomic) IBOutlet UIView *tabView3;
@property (weak, nonatomic) IBOutlet UIView *tabView4;
@property (weak, nonatomic) IBOutlet UIView *tabView5;
@property (weak, nonatomic) IBOutlet UIButton *tabButton1;
@property (weak, nonatomic) IBOutlet UIButton *tabButton2;
@property (weak, nonatomic) IBOutlet UIButton *tabButton3;
@property (weak, nonatomic) IBOutlet UIButton *tabButton4;
@property (weak, nonatomic) IBOutlet UIButton *tabCancel1;
@property (weak, nonatomic) IBOutlet UIButton *tabCancel2;
@property (weak, nonatomic) IBOutlet UIButton *tabCancel3;
@property (weak, nonatomic) IBOutlet UIButton *tabCancel4;
@property (weak, nonatomic) IBOutlet UIButton *tabPlus;
@property (weak, nonatomic) IBOutlet UIView *tabCollectionView;

@end

@implementation MenSelectViewController
@synthesize serviceArray;
@synthesize serviceTotalPrice;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    tabCount = 1;
    selectedTab = 1;
    shoe1_codeArray = [[NSMutableArray alloc]init];
    shoe2_codeArray = [[NSMutableArray alloc]init];
    shoe3_codeArray = [[NSMutableArray alloc]init];
    shoe4_codeArray = [[NSMutableArray alloc]init];
    
    tempServiceTotalPrice = serviceTotalPrice;
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:NO];
    float xR = [[NSUserDefaults standardUserDefaults] floatForKey:@"xRatio"];
    float yR = [[NSUserDefaults standardUserDefaults] floatForKey:@"yRatio"];
    /////+font/////
    float fontSize12 = 12*yR;
    float fontSize14 = 14*yR;
    float fontSize15 = 15*yR;
    float fontSize17 = 17*yR;
    float fontSize18 = 18*yR;
    
    //////////////////////////컨포넌트 재설정/////////////////////////////////
    
    _mainView.frame = CGRectMake(_mainView.frame.origin.x*xR, _mainView.frame.origin.y*yR, _mainView.frame.size.width*xR, _mainView.frame.size.height*yR);
    _navigationBar.frame = CGRectMake(_navigationBar.frame.origin.x*xR, _navigationBar.frame.origin.y*yR, _navigationBar.frame.size.width*xR, _navigationBar.frame.size.height*yR);
    _barButton.frame = CGRectMake(_barButton.frame.origin.x*xR, _barButton.frame.origin.y*yR, _barButton.frame.size.width*xR, _barButton.frame.size.height*yR);
    _topView.frame = CGRectMake(_topView.frame.origin.x*xR, _topView.frame.origin.y*yR, _topView.frame.size.width*xR, _topView.frame.size.height*yR);
    _manImage.frame = CGRectMake(_manImage.frame.origin.x*xR, _manImage.frame.origin.y*yR, _manImage.frame.size.width*xR, _manImage.frame.size.height*yR);
    _middleView.frame = CGRectMake(_middleView.frame.origin.x*xR, _middleView.frame.origin.y*yR, _middleView.frame.size.width*xR, _middleView.frame.size.height*yR);
    [_zeroLabel setFont:[UIFont fontWithName:@"System Font Heavy" size:fontSize17]];
    _zeroLabel.frame = CGRectMake(_zeroLabel.frame.origin.x*xR, _zeroLabel.frame.origin.y*yR, _zeroLabel.frame.size.width*xR, _zeroLabel.frame.size.height*yR);
    [_wonLabel setFont:[UIFont fontWithName:@"System Font Heavy" size:fontSize17]];
    _wonLabel.frame = CGRectMake(_wonLabel.frame.origin.x*xR, _wonLabel.frame.origin.y*yR, _wonLabel.frame.size.width*xR, _wonLabel.frame.size.height*yR);
    [_textLabel setFont:[UIFont fontWithName:@"System Font Heavy" size:fontSize14]];
    _textLabel.frame = CGRectMake(_textLabel.frame.origin.x*xR, _textLabel.frame.origin.y*yR, _textLabel.frame.size.width*xR, _textLabel.frame.size.height*yR);
    
    _bottomView.frame = CGRectMake(_bottomView.frame.origin.x*xR, _bottomView.frame.origin.y*yR, _bottomView.frame.size.width*xR, _bottomView.frame.size.height*yR);
    
    _selectButton.frame = CGRectMake(_selectButton.frame.origin.x*xR, _selectButton.frame.origin.y*yR, _selectButton.frame.size.width*xR, _selectButton.frame.size.height*yR);
    
    //////////////스크롤 뷰 컴포넌트 재설정//////////////
    _scrollView.frame = CGRectMake(_scrollView.frame.origin.x*xR, _scrollView.frame.origin.y*yR, _scrollView.frame.size.width*xR, _scrollView.frame.size.height*yR);
    _scrollView.showsVerticalScrollIndicator=YES;
    _scrollView.scrollEnabled=YES;
    [self.view addSubview:_scrollView];
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width, 140*yR+_scrollView.frame.size.height);
    
    _scrollView2.frame = CGRectMake(_scrollView2.frame.origin.x*xR, _scrollView2.frame.origin.y*yR, _scrollView2.frame.size.width*xR, _scrollView2.frame.size.height*yR);
    _scrollView2.showsVerticalScrollIndicator=YES;
    _scrollView2.scrollEnabled=YES;
    [self.view addSubview:_scrollView2];
    _scrollView2.contentSize = CGSizeMake(_scrollView2.frame.size.width, 250*yR+_scrollView2.frame.size.height);
    
    _man100View.frame = CGRectMake(_man100View.frame.origin.x*xR, _man100View.frame.origin.y*yR, _man100View.frame.size.width*xR, _man100View.frame.size.height*yR);
    [_man100Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _man100Label.frame = CGRectMake(_man100Label.frame.origin.x*xR, _man100Label.frame.origin.y*yR, _man100Label.frame.size.width*xR, _man100Label.frame.size.height*yR);
    _man100Button.frame = CGRectMake(_man100Button.frame.origin.x*xR, _man100Button.frame.origin.y*yR, _man100Button.frame.size.width*xR, _man100Button.frame.size.height*yR);
    
    _man101View.frame = CGRectMake(_man101View.frame.origin.x*xR, _man101View.frame.origin.y*yR, _man101View.frame.size.width*xR, _man101View.frame.size.height*yR);
    [_man101Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _man101Label.frame = CGRectMake(_man101Label.frame.origin.x*xR, _man101Label.frame.origin.y*yR, _man101Label.frame.size.width*xR, _man101Label.frame.size.height*yR);
    _man101Button.frame = CGRectMake(_man101Button.frame.origin.x*xR, _man101Button.frame.origin.y*yR, _man101Button.frame.size.width*xR, _man101Button.frame.size.height*yR);
    
    _man102View.frame = CGRectMake(_man102View.frame.origin.x*xR, _man102View.frame.origin.y*yR, _man102View.frame.size.width*xR, _man102View.frame.size.height*yR);
    [_man102Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _man102Label.frame = CGRectMake(_man102Label.frame.origin.x*xR, _man102Label.frame.origin.y*yR, _man102Label.frame.size.width*xR, _man102Label.frame.size.height*yR);
    _man102Button.frame = CGRectMake(_man102Button.frame.origin.x*xR, _man102Button.frame.origin.y*yR, _man102Button.frame.size.width*xR, _man102Button.frame.size.height*yR);
    
    _man103View.frame = CGRectMake(_man103View.frame.origin.x*xR, _man103View.frame.origin.y*yR, _man103View.frame.size.width*xR, _man103View.frame.size.height*yR);
    [_man103Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _man103Label.frame = CGRectMake(_man103Label.frame.origin.x*xR, _man103Label.frame.origin.y*yR, _man103Label.frame.size.width*xR, _man103Label.frame.size.height*yR);
    _man103Button.frame = CGRectMake(_man103Button.frame.origin.x*xR, _man103Button.frame.origin.y*yR, _man103Button.frame.size.width*xR, _man103Button.frame.size.height*yR);
    
    _man104View.frame = CGRectMake(_man104View.frame.origin.x*xR, _man104View.frame.origin.y*yR, _man104View.frame.size.width*xR, _man104View.frame.size.height*yR);
    [_man104Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _man104Label.frame = CGRectMake(_man104Label.frame.origin.x*xR, _man104Label.frame.origin.y*yR, _man104Label.frame.size.width*xR, _man104Label.frame.size.height*yR);
    _man104Button.frame = CGRectMake(_man104Button.frame.origin.x*xR, _man104Button.frame.origin.y*yR, _man104Button.frame.size.width*xR, _man104Button.frame.size.height*yR);
    
    _man105View.frame = CGRectMake(_man105View.frame.origin.x*xR, _man105View.frame.origin.y*yR, _man105View.frame.size.width*xR, _man105View.frame.size.height*yR);
    [_man105Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _man105Label.frame = CGRectMake(_man105Label.frame.origin.x*xR, _man105Label.frame.origin.y*yR, _man105Label.frame.size.width*xR, _man105Label.frame.size.height*yR);
    _man105Button.frame = CGRectMake(_man105Button.frame.origin.x*xR, _man105Button.frame.origin.y*yR, _man105Button.frame.size.width*xR, _man105Button.frame.size.height*yR);
    
    _man106View.frame = CGRectMake(_man106View.frame.origin.x*xR, _man106View.frame.origin.y*yR, _man106View.frame.size.width*xR, _man106View.frame.size.height*yR);
    [_man106Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _man106Label.frame = CGRectMake(_man106Label.frame.origin.x*xR, _man106Label.frame.origin.y*yR, _man106Label.frame.size.width*xR, _man106Label.frame.size.height*yR);
    _man106Button.frame = CGRectMake(_man106Button.frame.origin.x*xR, _man106Button.frame.origin.y*yR, _man106Button.frame.size.width*xR, _man106Button.frame.size.height*yR);
    
    _man107View.frame = CGRectMake(_man107View.frame.origin.x*xR, _man107View.frame.origin.y*yR, _man107View.frame.size.width*xR, _man107View.frame.size.height*yR);
    [_man107Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _man107Label.frame = CGRectMake(_man107Label.frame.origin.x*xR, _man107Label.frame.origin.y*yR, _man107Label.frame.size.width*xR, _man107Label.frame.size.height*yR);
    _man107Button.frame = CGRectMake(_man107Button.frame.origin.x*xR, _man107Button.frame.origin.y*yR, _man107Button.frame.size.width*xR, _man107Button.frame.size.height*yR);
    
    _man108View.frame = CGRectMake(_man108View.frame.origin.x*xR, _man108View.frame.origin.y*yR, _man108View.frame.size.width*xR, _man108View.frame.size.height*yR);
    [_man108Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _man108Label.frame = CGRectMake(_man108Label.frame.origin.x*xR, _man108Label.frame.origin.y*yR, _man108Label.frame.size.width*xR, _man108Label.frame.size.height*yR);
    _man108Button.frame = CGRectMake(_man108Button.frame.origin.x*xR, _man108Button.frame.origin.y*yR, _man108Button.frame.size.width*xR, _man108Button.frame.size.height*yR);
    
    _man109View.frame = CGRectMake(_man109View.frame.origin.x*xR, _man109View.frame.origin.y*yR, _man109View.frame.size.width*xR, _man109View.frame.size.height*yR);
    [_man109Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _man109Label.frame = CGRectMake(_man109Label.frame.origin.x*xR, _man109Label.frame.origin.y*yR, _man109Label.frame.size.width*xR, _man109Label.frame.size.height*yR);
    _man109Button.frame = CGRectMake(_man109Button.frame.origin.x*xR, _man109Button.frame.origin.y*yR, _man109Button.frame.size.width*xR, _man109Button.frame.size.height*yR);
    
    _man110View.frame = CGRectMake(_man110View.frame.origin.x*xR, _man110View.frame.origin.y*yR, _man110View.frame.size.width*xR, _man110View.frame.size.height*yR);
    [_man110Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _man110Label.frame = CGRectMake(_man110Label.frame.origin.x*xR, _man110Label.frame.origin.y*yR, _man110Label.frame.size.width*xR, _man110Label.frame.size.height*yR);
    _man110Button.frame = CGRectMake(_man110Button.frame.origin.x*xR, _man110Button.frame.origin.y*yR, _man110Button.frame.size.width*xR, _man110Button.frame.size.height*yR);
    
    _man111View.frame = CGRectMake(_man111View.frame.origin.x*xR, _man111View.frame.origin.y*yR, _man111View.frame.size.width*xR, _man111View.frame.size.height*yR);
    [_man111Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _man111Label.frame = CGRectMake(_man111Label.frame.origin.x*xR, _man111Label.frame.origin.y*yR, _man111Label.frame.size.width*xR, _man111Label.frame.size.height*yR);
    _man111Button.frame = CGRectMake(_man111Button.frame.origin.x*xR, _man111Button.frame.origin.y*yR, _man111Button.frame.size.width*xR, _man111Button.frame.size.height*yR);
    
    
    _man300View.frame = CGRectMake(_man300View.frame.origin.x*xR, _man300View.frame.origin.y*yR, _man300View.frame.size.width*xR, _man300View.frame.size.height*yR);
    [_man300Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _man300Label.frame = CGRectMake(_man300Label.frame.origin.x*xR, _man300Label.frame.origin.y*yR, _man300Label.frame.size.width*xR, _man300Label.frame.size.height*yR);
    _man300Button.frame = CGRectMake(_man300Button.frame.origin.x*xR, _man300Button.frame.origin.y*yR, _man300Button.frame.size.width*xR, _man300Button.frame.size.height*yR);
    
    _man301View.frame = CGRectMake(_man301View.frame.origin.x*xR, _man301View.frame.origin.y*yR, _man301View.frame.size.width*xR, _man301View.frame.size.height*yR);
    [_man301Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _man301Label.frame = CGRectMake(_man301Label.frame.origin.x*xR, _man301Label.frame.origin.y*yR, _man301Label.frame.size.width*xR, _man301Label.frame.size.height*yR);
    _man301Button.frame = CGRectMake(_man301Button.frame.origin.x*xR, _man301Button.frame.origin.y*yR, _man301Button.frame.size.width*xR, _man301Button.frame.size.height*yR);
    
    _man302View.frame = CGRectMake(_man302View.frame.origin.x*xR, _man302View.frame.origin.y*yR, _man302View.frame.size.width*xR, _man302View.frame.size.height*yR);
    [_man302Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _man302Label.frame = CGRectMake(_man302Label.frame.origin.x*xR, _man302Label.frame.origin.y*yR, _man302Label.frame.size.width*xR, _man302Label.frame.size.height*yR);
    _man302Button.frame = CGRectMake(_man302Button.frame.origin.x*xR, _man302Button.frame.origin.y*yR, _man302Button.frame.size.width*xR, _man302Button.frame.size.height*yR);
    
    _man303View.frame = CGRectMake(_man303View.frame.origin.x*xR, _man303View.frame.origin.y*yR, _man303View.frame.size.width*xR, _man303View.frame.size.height*yR);
    [_man303Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _man303Label.frame = CGRectMake(_man303Label.frame.origin.x*xR, _man303Label.frame.origin.y*yR, _man303Label.frame.size.width*xR, _man303Label.frame.size.height*yR);
    _man303Button.frame = CGRectMake(_man303Button.frame.origin.x*xR, _man303Button.frame.origin.y*yR, _man303Button.frame.size.width*xR, _man303Button.frame.size.height*yR);
    
    _man304View.frame = CGRectMake(_man304View.frame.origin.x*xR, _man304View.frame.origin.y*yR, _man304View.frame.size.width*xR, _man304View.frame.size.height*yR);
    [_man304Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _man304Label.frame = CGRectMake(_man304Label.frame.origin.x*xR, _man304Label.frame.origin.y*yR, _man304Label.frame.size.width*xR, _man304Label.frame.size.height*yR);
    _man304Button.frame = CGRectMake(_man304Button.frame.origin.x*xR, _man304Button.frame.origin.y*yR, _man304Button.frame.size.width*xR, _man304Button.frame.size.height*yR);
    
    _man305View.frame = CGRectMake(_man305View.frame.origin.x*xR, _man305View.frame.origin.y*yR, _man305View.frame.size.width*xR, _man305View.frame.size.height*yR);
    [_man305Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _man305Label.frame = CGRectMake(_man305Label.frame.origin.x*xR, _man305Label.frame.origin.y*yR, _man305Label.frame.size.width*xR, _man305Label.frame.size.height*yR);
    _man305Button.frame = CGRectMake(_man305Button.frame.origin.x*xR, _man305Button.frame.origin.y*yR, _man305Button.frame.size.width*xR, _man305Button.frame.size.height*yR);
    
    _man306View.frame = CGRectMake(_man306View.frame.origin.x*xR, _man306View.frame.origin.y*yR, _man306View.frame.size.width*xR, _man306View.frame.size.height*yR);
    [_man306Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _man306Label.frame = CGRectMake(_man306Label.frame.origin.x*xR, _man306Label.frame.origin.y*yR, _man306Label.frame.size.width*xR, _man306Label.frame.size.height*yR);
    _man306Button.frame = CGRectMake(_man306Button.frame.origin.x*xR, _man306Button.frame.origin.y*yR, _man306Button.frame.size.width*xR, _man306Button.frame.size.height*yR);
    
    _man307View.frame = CGRectMake(_man307View.frame.origin.x*xR, _man307View.frame.origin.y*yR, _man307View.frame.size.width*xR, _man307View.frame.size.height*yR);
    [_man307Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _man307Label.frame = CGRectMake(_man307Label.frame.origin.x*xR, _man307Label.frame.origin.y*yR, _man307Label.frame.size.width*xR, _man307Label.frame.size.height*yR);
    _man307Button.frame = CGRectMake(_man307Button.frame.origin.x*xR, _man307Button.frame.origin.y*yR, _man307Button.frame.size.width*xR, _man307Button.frame.size.height*yR);
    
    _man308View.frame = CGRectMake(_man308View.frame.origin.x*xR, _man308View.frame.origin.y*yR, _man308View.frame.size.width*xR, _man308View.frame.size.height*yR);
    [_man308Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _man308Label.frame = CGRectMake(_man308Label.frame.origin.x*xR, _man308Label.frame.origin.y*yR, _man308Label.frame.size.width*xR, _man308Label.frame.size.height*yR);
    _man308Button.frame = CGRectMake(_man308Button.frame.origin.x*xR, _man308Button.frame.origin.y*yR, _man308Button.frame.size.width*xR, _man308Button.frame.size.height*yR);
    
    _man309View.frame = CGRectMake(_man309View.frame.origin.x*xR, _man309View.frame.origin.y*yR, _man309View.frame.size.width*xR, _man309View.frame.size.height*yR);
    [_man309Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _man309Label.frame = CGRectMake(_man309Label.frame.origin.x*xR, _man309Label.frame.origin.y*yR, _man309Label.frame.size.width*xR, _man309Label.frame.size.height*yR);
    _man309Button.frame = CGRectMake(_man309Button.frame.origin.x*xR, _man309Button.frame.origin.y*yR, _man309Button.frame.size.width*xR, _man309Button.frame.size.height*yR);
    
    _man310View.frame = CGRectMake(_man310View.frame.origin.x*xR, _man310View.frame.origin.y*yR, _man310View.frame.size.width*xR, _man310View.frame.size.height*yR);
    [_man310Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _man310Label.frame = CGRectMake(_man310Label.frame.origin.x*xR, _man310Label.frame.origin.y*yR, _man310Label.frame.size.width*xR, _man310Label.frame.size.height*yR);
    _man310Button.frame = CGRectMake(_man310Button.frame.origin.x*xR, _man310Button.frame.origin.y*yR, _man310Button.frame.size.width*xR, _man310Button .frame.size.height*yR);
    
    _man311View.frame = CGRectMake(_man311View.frame.origin.x*xR, _man311View.frame.origin.y*yR, _man311View.frame.size.width*xR, _man311View.frame.size.height*yR);
    [_man311Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _man311Label.frame = CGRectMake(_man311Label.frame.origin.x*xR, _man311Label.frame.origin.y*yR, _man311Label.frame.size.width*xR, _man311Label.frame.size.height*yR);
    _man311Button.frame = CGRectMake(_man311Button.frame.origin.x*xR, _man311Button.frame.origin.y*yR, _man311Button.frame.size.width*xR, _man311Button .frame.size.height*yR);
    
    _man312View.frame = CGRectMake(_man312View.frame.origin.x*xR, _man312View.frame.origin.y*yR, _man312View.frame.size.width*xR, _man312View.frame.size.height*yR);
    [_man312Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _man312Label.frame = CGRectMake(_man312Label.frame.origin.x*xR, _man312Label.frame.origin.y*yR, _man312Label.frame.size.width*xR, _man312Label.frame.size.height*yR);
    _man312Button.frame = CGRectMake(_man312Button.frame.origin.x*xR, _man312Button.frame.origin.y*yR, _man312Button.frame.size.width*xR, _man312Button .frame.size.height*yR);
    
    _man313View.frame = CGRectMake(_man313View.frame.origin.x*xR, _man313View.frame.origin.y*yR, _man313View.frame.size.width*xR, _man313View.frame.size.height*yR);
    [_man313Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _man313Label.frame = CGRectMake(_man313Label.frame.origin.x*xR, _man313Label.frame.origin.y*yR, _man313Label.frame.size.width*xR, _man313Label.frame.size.height*yR);
    _man313Button.frame = CGRectMake(_man313Button.frame.origin.x*xR, _man313Button.frame.origin.y*yR, _man313Button.frame.size.width*xR, _man313Button .frame.size.height*yR);
    
    _man314View.frame = CGRectMake(_man314View.frame.origin.x*xR, _man314View.frame.origin.y*yR, _man314View.frame.size.width*xR, _man314View.frame.size.height*yR);
    [_man314Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _man314Label.frame = CGRectMake(_man314Label.frame.origin.x*xR, _man314Label.frame.origin.y*yR, _man314Label.frame.size.width*xR, _man314Label.frame.size.height*yR);
    _man314Button.frame = CGRectMake(_man314Button.frame.origin.x*xR, _man314Button.frame.origin.y*yR, _man314Button.frame.size.width*xR, _man314Button .frame.size.height*yR);
    
    _man315View.frame = CGRectMake(_man315View.frame.origin.x*xR, _man315View.frame.origin.y*yR, _man315View.frame.size.width*xR, _man315View.frame.size.height*yR);
    [_man315Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _man315Label.frame = CGRectMake(_man315Label.frame.origin.x*xR, _man315Label.frame.origin.y*yR, _man315Label.frame.size.width*xR, _man315Label.frame.size.height*yR);
    _man315Button.frame = CGRectMake(_man315Button.frame.origin.x*xR, _man315Button.frame.origin.y*yR, _man315Button.frame.size.width*xR, _man315Button .frame.size.height*yR);
    
    _titleLabel.frame = CGRectMake(_titleLabel.frame.origin.x*xR, _titleLabel.frame.origin.y*yR, _titleLabel.frame.size.width*xR, _titleLabel.frame.size.height*yR);
    [_titleLabel setFont:[UIFont fontWithName:@"System Font Heavy" size:fontSize18]];
    
    _premiumButton.frame = CGRectMake(_premiumButton.frame.origin.x*xR, _premiumButton.frame.origin.y*yR, _premiumButton.frame.size.width*xR, _premiumButton.frame.size.height*yR);
    _premiumImage.frame = CGRectMake(_premiumImage.frame.origin.x*xR, _premiumImage.frame.origin.y*yR, _premiumImage.frame.size.width*xR, _premiumImage.frame.size.height*yR);
    _premiumLabel.frame = CGRectMake(_premiumLabel.frame.origin.x*xR, _premiumLabel.frame.origin.y*yR, _premiumLabel.frame.size.width*xR, _premiumLabel.frame.size.height*yR);
    [_premiumLabel setFont:[UIFont fontWithName:@"System Font" size:fontSize14]];
    
    _normalButton.frame = CGRectMake(_normalButton.frame.origin.x*xR, _normalButton.frame.origin.y*yR, _normalButton.frame.size.width*xR, _normalButton.frame.size.height*yR);
    _normalImage.frame = CGRectMake(_normalImage.frame.origin.x*xR, _normalImage.frame.origin.y*yR, _normalImage.frame.size.width*xR, _normalImage.frame.size.height*yR);
    _normalLabel.frame = CGRectMake(_normalLabel.frame.origin.x*xR, _normalLabel.frame.origin.y*yR, _normalLabel.frame.size.width*xR, _normalLabel.frame.size.height*yR);
    [_normalLabel setFont:[UIFont fontWithName:@"System Font" size:fontSize14]];
    
    _contentLabel.frame = CGRectMake(_contentLabel.frame.origin.x*xR, _contentLabel.frame.origin.y*yR, _contentLabel.frame.size.width*xR, _contentLabel.frame.size.height*yR);
    [_contentLabel setFont:[UIFont fontWithName:@"System Font" size:fontSize15]];
    
    _tabView1.frame = CGRectMake(_tabView1.frame.origin.x*xR, _tabView1.frame.origin.y*yR, _tabView1.frame.size.width*xR, _tabView1.frame.size.height*yR);
    //    _tabView1.layer.borderWidth = 1.f;
    _tabView2.frame = CGRectMake(_tabView2.frame.origin.x*xR, _tabView2.frame.origin.y*yR, _tabView2.frame.size.width*xR, _tabView2.frame.size.height*yR);
    //    _tabView2.layer.borderWidth = 1.f;
    _tabView3.frame = CGRectMake(_tabView3.frame.origin.x*xR, _tabView3.frame.origin.y*yR, _tabView3.frame.size.width*xR, _tabView3.frame.size.height*yR);
    //    _tabView3.layer.borderWidth = 1.f;
    _tabView4.frame = CGRectMake(_tabView4.frame.origin.x*xR, _tabView4.frame.origin.y*yR, _tabView4.frame.size.width*xR, _tabView4.frame.size.height*yR);
    //    _tabView4.layer.borderWidth = 1.f;
    _tabView5.frame = CGRectMake(_tabView5.frame.origin.x*xR, _tabView5.frame.origin.y*yR, _tabView5.frame.size.width*xR, _tabView5.frame.size.height*yR);
    //    _tabView5.layer.borderWidth = 1.f;
    _tabButton1.frame = CGRectMake(_tabButton1.frame.origin.x*xR, _tabButton1.frame.origin.y*yR, _tabButton1.frame.size.width*xR, _tabButton1.frame.size.height*yR);
    [_tabButton1.titleLabel setFont:[UIFont fontWithName:@"System Font" size:fontSize15]];
    _tabButton2.frame = CGRectMake(_tabButton2.frame.origin.x*xR, _tabButton2.frame.origin.y*yR, _tabButton2.frame.size.width*xR, _tabButton2.frame.size.height*yR);
    [_tabButton2.titleLabel setFont:[UIFont fontWithName:@"System Font" size:fontSize15]];
    _tabButton3.frame = CGRectMake(_tabButton3.frame.origin.x*xR, _tabButton3.frame.origin.y*yR, _tabButton3.frame.size.width*xR, _tabButton3.frame.size.height*yR);
    [_tabButton3.titleLabel setFont:[UIFont fontWithName:@"System Font" size:fontSize15]];
    _tabButton4.frame = CGRectMake(_tabButton4.frame.origin.x*xR, _tabButton4.frame.origin.y*yR, _tabButton4.frame.size.width*xR, _tabButton4.frame.size.height*yR);
    [_tabButton4.titleLabel setFont:[UIFont fontWithName:@"System Font" size:fontSize15]];
    _tabCancel1.frame = CGRectMake(_tabCancel1.frame.origin.x*xR, _tabCancel1.frame.origin.y*yR, _tabCancel1.frame.size.width*xR, _tabCancel1.frame.size.height*yR);
    _tabCancel2.frame = CGRectMake(_tabCancel2.frame.origin.x*xR, _tabCancel2.frame.origin.y*yR, _tabCancel2.frame.size.width*xR, _tabCancel2.frame.size.height*yR);
    _tabCancel3.frame = CGRectMake(_tabCancel3.frame.origin.x*xR, _tabCancel3.frame.origin.y*yR, _tabCancel3.frame.size.width*xR, _tabCancel3.frame.size.height*yR);
    _tabCancel4.frame = CGRectMake(_tabCancel4.frame.origin.x*xR, _tabCancel4.frame.origin.y*yR, _tabCancel4.frame.size.width*xR, _tabCancel4.frame.size.height*yR);
    _tabPlus.frame = CGRectMake(_tabPlus.frame.origin.x*xR, _tabPlus.frame.origin.y*yR, _tabPlus.frame.size.width*xR, _tabPlus.frame.size.height*yR);
    _tabCollectionView.frame = CGRectMake(_tabCollectionView.frame.origin.x*xR, _tabCollectionView.frame.origin.y*yR, _tabCollectionView.frame.size.width*xR, _tabCollectionView.frame.size.height*yR);
    int loadShoeCount = 0;
    NSMutableArray *tempArray = [[NSMutableArray alloc]init];
    tempServiceArray = [[NSMutableArray alloc]init];
    [tempServiceArray addObjectsFromArray:serviceArray];
    for(SelectCode *temp in serviceArray){
        if([temp.service_index isEqualToString:@"2"])
        {
            loadShoeCount++;
            if(loadShoeCount == 1)
            {
                for(int j = 0; j<temp.order_code.length/3;j++)
                {
                    NSString* temp_code = [temp.order_code substringWithRange:NSMakeRange(j*3, 3)];
                    if(j == 0)
                        continue;
                    [shoe1_codeArray addObject:temp_code];
                }
                int price = [self tapArrayTotolPrice:shoe1_codeArray];
                _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
                [self selectedButtonColorEffect:1];
            }
            else if(loadShoeCount == 2)
            {
                for(int j = 0; j<temp.order_code.length/3;j++)
                {
                    NSString* temp_code = [temp.order_code substringWithRange:NSMakeRange(j*3, 3)];
                    if(j == 0)
                        continue;
                    [shoe2_codeArray addObject:temp_code];
                    
                }
                [self plusButton:_tabPlus];
                int price = [self tapArrayTotolPrice:shoe2_codeArray];
                _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
                [self selectedButtonColorEffect:2];
            }
            else if(loadShoeCount == 3)
            {
                for(int j = 0; j<temp.order_code.length/3;j++)
                {
                    NSString* temp_code = [temp.order_code substringWithRange:NSMakeRange(j*3, 3)];
                    if(j == 0)
                        continue;
                    [shoe3_codeArray addObject:temp_code];
                }
                [self plusButton:_tabPlus];
                int price = [self tapArrayTotolPrice:shoe3_codeArray];
                _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
                [self selectedButtonColorEffect:3];
            }
            else if(loadShoeCount == 4)
            {
                for(int j = 0; j<temp.order_code.length/3;j++)
                {
                    NSString* temp_code = [temp.order_code substringWithRange:NSMakeRange(j*3, 3)];
                    if(j == 0)
                        continue;
                    [shoe4_codeArray addObject:temp_code];
                }
                [self plusButton:_tabPlus];
                int price = [self tapArrayTotolPrice:shoe4_codeArray];
                _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
                [self selectedButtonColorEffect:4];
            }
        }
        else
        {
            [tempArray addObject:temp];
        }
    }
    [serviceArray removeAllObjects];
    [serviceArray addObjectsFromArray:tempArray];
    
    serviceTotalPrice -= [_zeroLabel.text integerValue];
}

- (IBAction)tab1Button:(UIButton *)sender {
    [self selectedButtonColorEffect:1];
}
- (IBAction)tab2Button:(UIButton *)sender {
    [self selectedButtonColorEffect:2];
}
- (IBAction)tab3Button:(UIButton *)sender {
    [self selectedButtonColorEffect:3];
}
- (IBAction)tab4Button:(UIButton *)sender {
    [self selectedButtonColorEffect:4];
}
- (IBAction)tab1Cancel:(UIButton *)sender {
    float xR = [[NSUserDefaults standardUserDefaults] floatForKey:@"xRatio"];
    int price = [self tapArrayTotolPrice:shoe1_codeArray];
    _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
    if(tabCount == 1)
    {
        [shoe1_codeArray removeAllObjects];
        [self clearContentsSelectedColor];
    }
    else if(tabCount == 2)
    {
        [shoe1_codeArray removeAllObjects];
        [shoe1_codeArray addObjectsFromArray:shoe2_codeArray];
        [shoe2_codeArray removeAllObjects];
        _tabView2.hidden = YES;
        CGRect tapView5_frame = _tabView5.frame;
        tapView5_frame.origin.x -= 80*xR;
        _tabView5.frame = tapView5_frame;
        tabCount--;
        if(selectedTab == 1)
        {
            [self selectedButtonColorEffect:1];
        }
        else if(selectedTab == 2)
        {
            [self selectedButtonColorEffect:1];
        }
        
    }
    else if(tabCount == 3)
    {
        [shoe1_codeArray removeAllObjects];
        [shoe1_codeArray addObjectsFromArray:shoe2_codeArray];
        [shoe2_codeArray removeAllObjects];
        [shoe2_codeArray addObjectsFromArray:shoe3_codeArray];
        [shoe3_codeArray removeAllObjects];
        _tabView3.hidden = YES;
        CGRect tapView5_frame = _tabView5.frame;
        tapView5_frame.origin.x -= 80*xR;
        _tabView5.frame = tapView5_frame;
        tabCount--;
        if(selectedTab == 1)
        {
            [self selectedButtonColorEffect:1];
        }
        else if(selectedTab == 2)
        {
            [self selectedButtonColorEffect:1];
        }
        else if(selectedTab == 3)
        {
            [self selectedButtonColorEffect:2];
        }
        
    }
    else if(tabCount == 4)
    {
        [shoe1_codeArray removeAllObjects];
        [shoe1_codeArray addObjectsFromArray:shoe2_codeArray];
        [shoe2_codeArray removeAllObjects];
        [shoe2_codeArray addObjectsFromArray:shoe3_codeArray];
        [shoe3_codeArray removeAllObjects];
        [shoe3_codeArray addObjectsFromArray:shoe4_codeArray];
        [shoe4_codeArray removeAllObjects];
        _tabView4.hidden = YES;
        _tabView5.hidden = NO;
        tabCount--;
        if(selectedTab == 1)
        {
            [self selectedButtonColorEffect:1];
        }
        else if(selectedTab == 2)
        {
            [self selectedButtonColorEffect:1];
        }
        else if(selectedTab == 3)
        {
            [self selectedButtonColorEffect:2];
        }
        else if(selectedTab == 4)
        {
            [self selectedButtonColorEffect:3];
        }
    }
}
- (IBAction)tab2Cancel:(UIButton *)sender {
    float xR = [[NSUserDefaults standardUserDefaults] floatForKey:@"xRatio"];
    int price = [self tapArrayTotolPrice:shoe2_codeArray];
    _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
    if(tabCount == 2)
    {
        [shoe2_codeArray removeAllObjects];
        _tabView2.hidden = YES;
        CGRect tapView5_frame = _tabView5.frame;
        tapView5_frame.origin.x -= 80*xR;
        _tabView5.frame = tapView5_frame;
        tabCount--;
        if(selectedTab == 1)
        {
            [self selectedButtonColorEffect:1];
        }
        else if(selectedTab == 2)
        {
            [self selectedButtonColorEffect:1];
        }
    }
    else if(tabCount == 3)
    {
        [shoe2_codeArray removeAllObjects];
        [shoe2_codeArray addObjectsFromArray:shoe3_codeArray];
        [shoe3_codeArray removeAllObjects];
        _tabView3.hidden = YES;
        CGRect tapView5_frame = _tabView5.frame;
        tapView5_frame.origin.x -= 80*xR;
        _tabView5.frame = tapView5_frame;
        tabCount--;
        if(selectedTab == 2)
        {
            [self selectedButtonColorEffect:2];
        }
        else if(selectedTab == 3)
        {
            [self selectedButtonColorEffect:2];
        }
    }
    else if(tabCount == 4)
    {
        [shoe2_codeArray removeAllObjects];
        [shoe2_codeArray addObjectsFromArray:shoe3_codeArray];
        [shoe3_codeArray removeAllObjects];
        [shoe3_codeArray addObjectsFromArray:shoe4_codeArray];
        [shoe4_codeArray removeAllObjects];
        _tabView4.hidden = YES;
        _tabView5.hidden = NO;
        tabCount--;
        if(selectedTab == 2)
        {
            [self selectedButtonColorEffect:2];
        }
        else if(selectedTab == 3)
        {
            [self selectedButtonColorEffect:2];
        }
        else if(selectedTab == 4)
        {
            [self selectedButtonColorEffect:3];
        }
    }
}
- (IBAction)tab3Cancel:(UIButton *)sender {
    float xR = [[NSUserDefaults standardUserDefaults] floatForKey:@"xRatio"];
    int price = [self tapArrayTotolPrice:shoe3_codeArray];
    _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
    if(tabCount == 3)
    {
        [shoe3_codeArray removeAllObjects];
        _tabView3.hidden = YES;
        CGRect tapView5_frame = _tabView5.frame;
        tapView5_frame.origin.x -= 80*xR;
        _tabView5.frame = tapView5_frame;
        tabCount--;
        if(selectedTab == 3)
        {
            [self selectedButtonColorEffect:2];
        }
    }
    else if(tabCount == 4)
    {
        [shoe3_codeArray removeAllObjects];
        [shoe3_codeArray addObjectsFromArray:shoe4_codeArray];
        [shoe4_codeArray removeAllObjects];
        _tabView4.hidden = YES;
        _tabView5.hidden = NO;
        tabCount--;
        if(selectedTab == 3)
        {
            [self selectedButtonColorEffect:2];
        }
        else if(selectedTab == 4)
        {
            [self selectedButtonColorEffect:3];
        }
    }
}
- (IBAction)tab4Cancel:(UIButton *)sender {
    int price = [self tapArrayTotolPrice:shoe4_codeArray];
    _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
    if(tabCount == 4)
    {
        [shoe4_codeArray removeAllObjects];
        _tabView4.hidden = YES;
        _tabView5.hidden = NO;
        tabCount--;
        if(selectedTab == 4)
        {
            [self selectedButtonColorEffect:3];
        }
    }
}
- (IBAction)plusButton:(UIButton *)sender {
    float xR = [[NSUserDefaults standardUserDefaults] floatForKey:@"xRatio"];
    if(tabCount == 1)
    {
        if(shoe1_codeArray.count == 0)
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"알림"
                                                           message:@"서비스를 선택해주세요."
                                                          delegate:self
                                                 cancelButtonTitle:nil    /* nil 로 지정할 경우 cancel button 없음 */
                                                 otherButtonTitles:@"확인", nil];
            
            // alert창을 띄우는 method는 show이다.
            [alert show];
        }
        else
        {
            _tabView2.hidden = NO;
            CGRect tapView5_frame = _tabView5.frame;
            tapView5_frame.origin.x += 80*xR;
            _tabView5.frame = tapView5_frame;
            tabCount++;
            [self selectedButtonColorEffect:2];
            [self normalPremiumColorEffect:1];
        }
    }
    else if(tabCount == 2)
    {
        if(shoe2_codeArray.count == 0)
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"알림"
                                                           message:@"서비스를 선택해주세요."
                                                          delegate:self
                                                 cancelButtonTitle:nil    /* nil 로 지정할 경우 cancel button 없음 */
                                                 otherButtonTitles:@"확인", nil];
            
            // alert창을 띄우는 method는 show이다.
            [alert show];
        }
        else
        {
            _tabView3.hidden = NO;
            CGRect tapView5_frame = _tabView5.frame;
            tapView5_frame.origin.x += 80*xR;
            _tabView5.frame = tapView5_frame;
            tabCount++;
            [self selectedButtonColorEffect:3];
            [self normalPremiumColorEffect:1];
        }
    }
    else if(tabCount == 3)
    {
        if(shoe3_codeArray.count == 0)
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"알림"
                                                           message:@"서비스를 선택해주세요."
                                                          delegate:self
                                                 cancelButtonTitle:nil    /* nil 로 지정할 경우 cancel button 없음 */
                                                 otherButtonTitles:@"확인", nil];
            
            // alert창을 띄우는 method는 show이다.
            [alert show];
        }
        else
        {
            _tabView4.hidden = NO;
            _tabView5.hidden = YES;
            tabCount++;
            [self selectedButtonColorEffect:4];
            [self normalPremiumColorEffect:1];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)normalButton:(id)sender {
    [self normalPremiumColorEffect:1];
    _normalImage.image = [UIImage imageNamed:@"select_whatshoe_btn_push.png"];
    _premiumImage.image = [UIImage imageNamed:@"select_itshoe_btn.png"];
    
}
- (IBAction)premiumButton:(id)sender {
    [self normalPremiumColorEffect:2];
    _normalImage.image = [UIImage imageNamed:@"select_whatshoe_btn.png"];
    _premiumImage.image = [UIImage imageNamed:@"select_itshoe_btn_push.png"];
}

- (IBAction)backButton:(id)sender
{
    UIStoryboard *storyboard = self.storyboard;
    RootViewController *nextViewController = [storyboard instantiateViewControllerWithIdentifier:@"ServiceVC"];
    
    nextViewController.serviceArray = tempServiceArray;
    nextViewController.serviceTotalPrice = tempServiceTotalPrice;
    
    [self presentViewController:nextViewController animated:NO completion:nil];
}
- (IBAction)selectCompleteButton:(UIButton *)sender
{
    UIStoryboard *storyboard = self.storyboard;
    RootViewController *nextViewController = [storyboard instantiateViewControllerWithIdentifier:@"ServiceVC"];
    
    
    if(shoe1_codeArray.count != 0)
    {
        SelectCode *temp_object = [[SelectCode alloc]init];
        NSString *total_order_code = @"#03";
        for(NSString *temp_code in shoe1_codeArray)
        {
            total_order_code = [total_order_code stringByAppendingString:temp_code];
        }
        temp_object.order_code = total_order_code;
        temp_object.service_index = @"2";
        [serviceArray addObject:temp_object];
    }
    if(shoe2_codeArray.count != 0)
    {
        SelectCode *temp_object = [[SelectCode alloc]init];
        NSString *total_order_code = @"#03";
        for(NSString *temp_code in shoe2_codeArray)
        {
            total_order_code = [total_order_code stringByAppendingString:temp_code];
        }
        temp_object.order_code = total_order_code;
        temp_object.service_index = @"2";
        [serviceArray addObject:temp_object];
    }
    if(shoe3_codeArray.count != 0)
    {
        SelectCode *temp_object = [[SelectCode alloc]init];
        NSString *total_order_code = @"#03";
        for(NSString *temp_code in shoe3_codeArray)
        {
            total_order_code = [total_order_code stringByAppendingString:temp_code];
        }
        temp_object.order_code = total_order_code;
        temp_object.service_index = @"2";
        [serviceArray addObject:temp_object];
    }
    if(shoe4_codeArray.count != 0)
    {
        SelectCode *temp_object = [[SelectCode alloc]init];
        NSString *total_order_code = @"#03";
        for(NSString *temp_code in shoe4_codeArray)
        {
            total_order_code = [total_order_code stringByAppendingString:temp_code];
        }
        temp_object.order_code = total_order_code;
        temp_object.service_index = @"2";
        [serviceArray addObject:temp_object];
    }
    
    nextViewController.serviceArray = serviceArray;
    serviceTotalPrice += [_zeroLabel.text integerValue];
    nextViewController.serviceTotalPrice = serviceTotalPrice;
    [self presentViewController:nextViewController animated:NO completion:nil];
}

- (IBAction)man100Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"100";
    int price = 0;
    _contentLabel.text=@"왓슈맨&왓슈걸과 상담 후 결정";
    if(bool_100) //dismiss
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray removeObject:orderCode];
        }
        [self contentsDissmissColorEffect:_man100View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_100 = false;
        
    }
    else //select
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray addObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray addObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray addObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray addObject:orderCode];
        }
        [self contentsSelectColorEffect:_man100View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_100 = true;
    }
}
- (IBAction)man101Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"101";
    int price = 5000;
    _contentLabel.text=@"오염제거 -> 일반 구두약 도포 -> 솔질 및 마무리";
    if(bool_101) //dismiss
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray removeObject:orderCode];
        }
        [self contentsDissmissColorEffect:_man101View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_101 = false;
        
    }
    else //select
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray addObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray addObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray addObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray addObject:orderCode];
        }
        [self contentsSelectColorEffect:_man101View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_101 = true;
    }
    
}
- (IBAction)man102Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"102";
    int price = 15000;
    _contentLabel.text=@"뒷굽이 닳은 경우 비슷한 색으로 교체";
    if(bool_102) //dismiss
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray removeObject:orderCode];
        }
        [self contentsDissmissColorEffect:_man102View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_102 = false;
        
    }
    else //select
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray addObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray addObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray addObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray addObject:orderCode];
        }
        [self contentsSelectColorEffect:_man102View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_102 = true;
    }
    
}

- (IBAction)man103Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"103";
    int price = 18000;
    _contentLabel.text=@"뒷굽 위쪽이 갈린 경우 전체 교체";
    if(bool_103) //dismiss
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray removeObject:orderCode];
        }
        [self contentsDissmissColorEffect:_man103View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_103 = false;
        
    }
    else //select
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray addObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray addObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray addObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray addObject:orderCode];
        }
        [self contentsSelectColorEffect:_man103View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_103 = true;
    }
    
}

- (IBAction)man104Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"104";
    int price = 15000;
    _contentLabel.text=@"구두의 앞창에 덧대어 손상과 미끄럼 방지(일반고무)";
    if(bool_104) //dismiss
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray removeObject:orderCode];
        }
        [self contentsDissmissColorEffect:_man104View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_104 = false;
        
    }
    else //select
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray addObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray addObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray addObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray addObject:orderCode];
        }
        [self contentsSelectColorEffect:_man104View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_104 = true;
    }
    
}

- (IBAction)man105Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"105";
    int price = 29000;
    _contentLabel.text=@"구두의 앞창과 뒷 굽 교체";
    if(bool_105) //dismiss
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray removeObject:orderCode];
        }
        [self contentsDissmissColorEffect:_man105View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_105 = false;
        
    }
    else //select
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray addObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray addObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray addObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray addObject:orderCode];
        }
        [self contentsSelectColorEffect:_man105View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_105 = true;
    }
    
}

- (IBAction)man106Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"106";
    int price = 32000;
    _contentLabel.text=@"구두의 앞창과 전체 굽 교체";
    if(bool_106) //dismiss
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray removeObject:orderCode];
        }
        [self contentsDissmissColorEffect:_man106View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_106 = false;
        
    }
    else //select
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray addObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray addObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray addObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray addObject:orderCode];
        }
        [self contentsSelectColorEffect:_man106View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_106 = true;
    }
}

- (IBAction)man107Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"107";
    int price = 50000;
    _contentLabel.text=@"(우레탄 굽일체형) 구두 바닥 전체 갈이";
    if(bool_107) //dismiss
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray removeObject:orderCode];
        }
        [self contentsDissmissColorEffect:_man107View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_107 = false;
        
    }
    else //select
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray addObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray addObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray addObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray addObject:orderCode];
        }
        [self contentsSelectColorEffect:_man107View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_107 = true;
    }
}

- (IBAction)man108Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"108";
    int price = 15000;
    _contentLabel.text=@"구두 바닥에 맞춰서 깔창 부착";
    if(bool_108) //dismiss
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray removeObject:orderCode];
        }
        [self contentsDissmissColorEffect:_man108View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_108 = false;
        
    }
    else //select
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray addObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray addObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray addObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray addObject:orderCode];
        }
        [self contentsSelectColorEffect:_man108View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_108 = true;
    }
}

- (IBAction)man109Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"109";
    int price = 4000;
    _contentLabel.text=@"서비스 1개 이상 신청시 양말 추가";
    if(bool_109) //dismiss
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray removeObject:orderCode];
        }
        [self contentsDissmissColorEffect:_man109View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_109 = false;
        
    }
    else //select
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray addObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray addObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray addObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray addObject:orderCode];
        }
        [self contentsSelectColorEffect:_man109View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_109 = true;
    }
}

- (IBAction)man110Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"110";
    int price = 0;
    _contentLabel.text=@"담배는 연령 확인 후 현장 결제";
    if(bool_110) //dismiss
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray removeObject:orderCode];
        }
        [self contentsDissmissColorEffect:_man110View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_110 = false;
        
    }
    else //select
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray addObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray addObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray addObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray addObject:orderCode];
        }
        [self contentsSelectColorEffect:_man110View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_110 = true;
    }
}

- (IBAction)man111Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"111";
    int price = 100;
    _contentLabel.text=@"서비스 1개 이상 신청시 라이터 배달 가능";
    if(bool_111) //dismiss
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray removeObject:orderCode];
        }
        [self contentsDissmissColorEffect:_man111View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_111 = false;
        
    }
    else //select
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray addObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray addObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray addObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray addObject:orderCode];
        }
        [self contentsSelectColorEffect:_man111View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_111 = true;
    }
}

- (IBAction)man300Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"300";
    int price = 0;
    _contentLabel.text=@"왓슈맨&왓슈걸과 상담 후 결정";
    if(bool_300) //dismiss
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray removeObject:orderCode];
        }
        [self contentsDissmissColorEffect:_man300View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_300 = false;
        
    }
    else //select
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray addObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray addObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray addObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray addObject:orderCode];
        }
        [self contentsSelectColorEffect:_man300View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_300 = true;
    }
    
}
- (IBAction)man301Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"301";
    int price = 20000;
    _contentLabel.text=@"클렌징 -> 슈크림 도포 -> 솔질 및 마무리(사피르 사용)";
    if(bool_301) //dismiss
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray removeObject:orderCode];
        }
        [self contentsDissmissColorEffect:_man301View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_301 = false;
        
    }
    else //select
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray addObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray addObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray addObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray addObject:orderCode];
        }
        [self contentsSelectColorEffect:_man301View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_301 = true;
    }
}
- (IBAction)man302Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"302";
    int price = 30000;
    _contentLabel.text=@"오염제거 -> 클렌징 -> 슈크림 도포 -> 솔질 및 마무리(사피르 사용)";
    if(bool_302) //dismiss
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray removeObject:orderCode];
        }
        [self contentsDissmissColorEffect:_man302View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_302 = false;
        
    }
    else //select
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray addObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray addObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray addObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray addObject:orderCode];
        }
        [self contentsSelectColorEffect:_man302View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_302 = true;
    }
}
- (IBAction)man303Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"303";
    int price = 40000;
    _contentLabel.text=@"Vibram 제품(갈림이 덜하고 미끄럼 방지 우수)으로 뒷굽교체";
    if(bool_303) //dismiss
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray removeObject:orderCode];
        }
        [self contentsDissmissColorEffect:_man303View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_303 = false;
        
    }
    else //select
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray addObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray addObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray addObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray addObject:orderCode];
        }
        [self contentsSelectColorEffect:_man303View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_303 = true;
    }
}
- (IBAction)man304Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"304";
    int price = 40000;
    _contentLabel.text=@"Vibram 제품(갈림이 덜하고 미끄럼 방지 우수)으로 앞창 덧댐";
    if(bool_304) //dismiss
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray removeObject:orderCode];
        }
        [self contentsDissmissColorEffect:_man304View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_304 = false;
        
    }
    else //select
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray addObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray addObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray addObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray addObject:orderCode];
        }
        [self contentsSelectColorEffect:_man304View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_304 = true;
    }
}
- (IBAction)man305Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"305";
    int price = 30000;
    _contentLabel.text=@"밑창 떨어짐 및 손상 수선";
    if(bool_305) //dismiss
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray removeObject:orderCode];
        }
        [self contentsDissmissColorEffect:_man305View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_305 = false;
        
    }
    else //select
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray addObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray addObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray addObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray addObject:orderCode];
        }
        [self contentsSelectColorEffect:_man305View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_305 = true;
    }
}
- (IBAction)man306Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"306";
    int price = 60000;
    _contentLabel.text=@"앞창덧댐과 뒷굽 교체 및 슈케어";
    if(bool_306) //dismiss
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray removeObject:orderCode];
        }
        [self contentsDissmissColorEffect:_man306View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_306 = false;
        
    }
    else //select
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray addObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray addObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray addObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray addObject:orderCode];
        }
        [self contentsSelectColorEffect:_man306View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_306 = true;
    }
}
- (IBAction)man307Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"307";
    int price = 158000;
    _contentLabel.text=@"Vibram 제품(갈림이 덜하고 미끄럼 방지 우수)으로 전체 창 교체";
    if(bool_307) //dismiss
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray removeObject:orderCode];
        }
        [self contentsDissmissColorEffect:_man307View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_307 = false;
        
    }
    else //select
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray addObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray addObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray addObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray addObject:orderCode];
        }
        [self contentsSelectColorEffect:_man307View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_307 = true;
    }
}

- (IBAction)man308Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"308";
    int price = 15000;
    _contentLabel.text=@"구두 앞코의 까진 부분 동일한 색으로 염색";
    if(bool_308) //dismiss
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray removeObject:orderCode];
        }
        [self contentsDissmissColorEffect:_man308View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_308 = false;
        
    }
    else //select
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray addObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray addObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray addObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray addObject:orderCode];
        }
        [self contentsSelectColorEffect:_man308View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_308 = true;
    }
}

- (IBAction)man309Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"309";
    int price = 75000;
    _contentLabel.text=@"원하는 형태로 앞코의 디자인 변형";
    if(bool_309) //dismiss
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray removeObject:orderCode];
        }
        [self contentsDissmissColorEffect:_man309View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_309 = false;
        
    }
    else //select
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray addObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray addObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray addObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray addObject:orderCode];
        }
        [self contentsSelectColorEffect:_man309View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_309 = true;
    }
}

- (IBAction)man310Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"310";
    int price = 110000;
    _contentLabel.text=@"변색, 오염이 심한 경우 전체 컬러 염색";
    if(bool_310) //dismiss
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray removeObject:orderCode];
        }
        [self contentsDissmissColorEffect:_man310View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_310 = false;
        
    }
    else //select
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray addObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray addObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray addObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray addObject:orderCode];
        }
        [self contentsSelectColorEffect:_man310View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_310 = true;
    }
}

- (IBAction)man311Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"311";
    int price = 15000;
    _contentLabel.text=@"";
    if(bool_311) //dismiss
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray removeObject:orderCode];
        }
        [self contentsDissmissColorEffect:_man311View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_311 = false;
        
    }
    else //select
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray addObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray addObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray addObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray addObject:orderCode];
        }
        [self contentsSelectColorEffect:_man311View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_311 = true;
    }
}
- (IBAction)man312Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"312";
    int price = 30000;
    _contentLabel.text=@"구두 안쪽의 창 동일한 소재와 크기로 교체";
    if(bool_312) //dismiss
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray removeObject:orderCode];
        }
        [self contentsDissmissColorEffect:_man312View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_312 = false;
        
    }
    else //select
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray addObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray addObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray addObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray addObject:orderCode];
        }
        [self contentsSelectColorEffect:_man312View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_312 = true;
    }
}
- (IBAction)man313Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"313";
    int price = 4000;
    _contentLabel.text=@"서비스 1개 이상 신청시 양말 추가";
    if(bool_313) //dismiss
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray removeObject:orderCode];
        }
        [self contentsDissmissColorEffect:_man313View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_313 = false;
        
    }
    else //select
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray addObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray addObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray addObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray addObject:orderCode];
        }
        [self contentsSelectColorEffect:_man313View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_313 = true;
    }
}
- (IBAction)man314Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"314";
    int price = 0;
    _contentLabel.text=@"담배는 연령 확인 후 현장 결제";
    if(bool_314) //dismiss
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray removeObject:orderCode];
        }
        [self contentsDissmissColorEffect:_man314View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_314 = false;
        
    }
    else //select
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray addObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray addObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray addObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray addObject:orderCode];
        }
        [self contentsSelectColorEffect:_man314View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_314 = true;
    }
}
- (IBAction)man315Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"315";
    int price = 100;
    _contentLabel.text=@"서비스 1개 이상 신청시 라이터 배달 가능";
    if(bool_315) //dismiss
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray removeObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray removeObject:orderCode];
        }
        [self contentsDissmissColorEffect:_man315View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_315 = false;
        
    }
    else //select
    {
        if(selectedTab == 1)
        {
            [shoe1_codeArray addObject:orderCode];
        }
        else if(selectedTab == 2)
        {
            [shoe2_codeArray addObject:orderCode];
        }
        else if(selectedTab == 3)
        {
            [shoe3_codeArray addObject:orderCode];
        }
        else if(selectedTab == 4)
        {
            [shoe4_codeArray addObject:orderCode];
        }
        [self contentsSelectColorEffect:_man315View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_315 = true;
    }
}


//탭의 버튼을 눌렀을때 나오는 효과
//색 변경
//만약 선택된 탭이 가지고 있는 배열에 내용이 있을 경우 노말인지 프리미엄인지 자동으로 보여준다.
- (void)selectedButtonColorEffect:(int)tab
{
    selectedTab = tab;
    UIColor *color_ffffff = [UIColor colorWithRed:(255.0 / 255.0) green:(255.0 / 255.0) blue:(255.0 / 255.0) alpha: 1];
    UIColor *color_949494 = [UIColor colorWithRed:(148.0 / 255.0) green:(148.0 / 255.0) blue:(148.0 / 255.0) alpha: 1];
    if(selectedTab == 1)
    {
        if(_tabView1.backgroundColor != color_ffffff)
        {
            _tabView1.backgroundColor = color_ffffff;
        }
        if(_tabView2.backgroundColor != color_949494)
        {
            _tabView2.backgroundColor = color_949494;
        }
        if(_tabView3.backgroundColor != color_949494)
        {
            _tabView3.backgroundColor = color_949494;
        }
        if(_tabView4.backgroundColor != color_949494)
        {
            _tabView4.backgroundColor = color_949494;
        }
        [self loadShoeServiceSelect:shoe1_codeArray];
        
        if(shoe1_codeArray.count !=0)
        {
            if([shoe1_codeArray[0] hasPrefix:@"1"])
            {
                [self normalPremiumColorEffect:1];
            }
            else if([shoe1_codeArray[0] hasPrefix:@"3"])
            {
                [self normalPremiumColorEffect:2];
            }
        }
        else
        {
            [self normalPremiumColorEffect:1];
        }
    }
    else if(selectedTab == 2)
    {
        if(_tabView1.backgroundColor != color_949494)
        {
            _tabView1.backgroundColor = color_949494;
        }
        if(_tabView2.backgroundColor != color_ffffff)
        {
            _tabView2.backgroundColor = color_ffffff;
        }
        if(_tabView3.backgroundColor != color_949494)
        {
            _tabView3.backgroundColor = color_949494;
        }
        if(_tabView4.backgroundColor != color_949494)
        {
            _tabView4.backgroundColor = color_949494;
        }
        [self loadShoeServiceSelect:shoe2_codeArray];
        
        if(shoe2_codeArray.count !=0)
        {
            if([shoe2_codeArray[0] hasPrefix:@"1"])
            {
                [self normalPremiumColorEffect:1];
            }
            else if([shoe2_codeArray[0] hasPrefix:@"3"])
            {
                [self normalPremiumColorEffect:2];
            }
        }
        else
        {
            [self normalPremiumColorEffect:1];
        }
    }
    else if(selectedTab == 3)
    {
        if(_tabView1.backgroundColor != color_949494)
        {
            _tabView1.backgroundColor = color_949494;
        }
        if(_tabView2.backgroundColor != color_949494)
        {
            _tabView2.backgroundColor = color_949494;
        }
        if(_tabView3.backgroundColor != color_ffffff)
        {
            _tabView3.backgroundColor = color_ffffff;
        }
        if(_tabView4.backgroundColor != color_949494)
        {
            _tabView4.backgroundColor = color_949494;
        }
        [self loadShoeServiceSelect:shoe3_codeArray];
        
        if(shoe3_codeArray.count !=0)
        {
            if([shoe3_codeArray[0] hasPrefix:@"1"])
            {
                [self normalPremiumColorEffect:1];
            }
            else if([shoe3_codeArray[0] hasPrefix:@"3"])
            {
                [self normalPremiumColorEffect:2];
            }
        }
        else
        {
            [self normalPremiumColorEffect:1];
        }
    }
    else if(selectedTab == 4)
    {
        if(_tabView1.backgroundColor != color_949494)
        {
            _tabView1.backgroundColor = color_949494;
        }
        if(_tabView2.backgroundColor != color_949494)
        {
            _tabView2.backgroundColor = color_949494;
        }
        if(_tabView3.backgroundColor != color_949494)
        {
            _tabView3.backgroundColor = color_949494;
        }
        if(_tabView4.backgroundColor != color_ffffff)
        {
            _tabView4.backgroundColor = color_ffffff;
        }
        [self loadShoeServiceSelect:shoe4_codeArray];
        
        if(shoe4_codeArray.count !=0)
        {
            if([shoe4_codeArray[0] hasPrefix:@"1"])
            {
                [self normalPremiumColorEffect:1];
            }
            else if([shoe4_codeArray[0] hasPrefix:@"3"])
            {
                [self normalPremiumColorEffect:2];
            }
        }
        else
        {
            [self normalPremiumColorEffect:1];
        }
    }
}


//노말이랑 프리미엄을 선택했을때 나오는 효과
//색 변경 스크롤뷰 변경
- (void)normalPremiumColorEffect:(int)tab
{
    UIColor *color_ffffff = [UIColor colorWithRed:(255.0 / 255.0) green:(255.0 / 255.0) blue:(255.0 / 255.0) alpha: 1];
    UIColor *color_e9e9e9 = [UIColor colorWithRed:(233.0 / 255.0) green:(233.0 / 255.0) blue:(233.0 / 255.0) alpha: 1];
    if(tab == 1)
    {
        _normalButton.backgroundColor = color_ffffff;
        _premiumButton.backgroundColor = color_e9e9e9;
        _scrollView.hidden = NO;
        _scrollView2.hidden = YES;
    }
    else if(tab == 2)
    {
        _normalButton.backgroundColor = color_e9e9e9;
        _premiumButton.backgroundColor = color_ffffff;
        _scrollView.hidden = YES;
        _scrollView2.hidden = NO;
    }
}

// 특정 구두 배열을 읽어와 컨텐츠 버튼들이 눌러진 효과를 만들어 준다.
- (void)loadShoeServiceSelect:(NSMutableArray *)shoe_codeArray
{
    [self clearContentsSelectedColor];
    for(NSString *temp_code in shoe_codeArray)
    {
        if([temp_code isEqual:@"100"])
        {
            [self contentsSelectColorEffect:_man100View];
            bool_100=true;
        }
        else if([temp_code isEqual:@"101"])
        {
            [self contentsSelectColorEffect:_man101View];
            bool_101=true;
        }
        else if([temp_code isEqual:@"102"])
        {
            [self contentsSelectColorEffect:_man102View];
            bool_102=true;
        }
        else if([temp_code isEqual:@"103"])
        {
            [self contentsSelectColorEffect:_man103View];
            bool_103=true;
        }
        else if([temp_code isEqual:@"104"])
        {
            [self contentsSelectColorEffect:_man104View];
            bool_104=true;
        }
        else if([temp_code isEqual:@"105"])
        {
            [self contentsSelectColorEffect:_man105View];
            bool_105=true;
        }
        else if([temp_code isEqual:@"106"])
        {
            [self contentsSelectColorEffect:_man106View];
            bool_106=true;
        }
        else if([temp_code isEqual:@"107"])
        {
            [self contentsSelectColorEffect:_man107View];
            bool_107=true;
        }
        else if([temp_code isEqual:@"108"])
        {
            [self contentsSelectColorEffect:_man108View];
            bool_108=true;
        }
        else if([temp_code isEqual:@"109"])
        {
            [self contentsSelectColorEffect:_man109View];
            bool_109=true;
        }
        else if([temp_code isEqual:@"110"])
        {
            [self contentsSelectColorEffect:_man110View];
            bool_110=true;
        }
        else if([temp_code isEqual:@"111"])
        {
            [self contentsSelectColorEffect:_man111View];
            bool_111=true;
        }
        else if([temp_code isEqual:@"300"])
        {
            [self contentsSelectColorEffect:_man300View];
            bool_300=true;
        }
        else if([temp_code isEqual:@"301"])
        {
            [self contentsSelectColorEffect:_man301View];
            bool_301=true;
        }
        else if([temp_code isEqual:@"302"])
        {
            [self contentsSelectColorEffect:_man302View];
            bool_302=true;
        }
        else if([temp_code isEqual:@"303"])
        {
            [self contentsSelectColorEffect:_man303View];
            bool_303=true;
        }
        else if([temp_code isEqual:@"304"])
        {
            [self contentsSelectColorEffect:_man304View];
            bool_304=true;
        }
        else if([temp_code isEqual:@"305"])
        {
            [self contentsSelectColorEffect:_man305View];
            bool_305=true;
        }
        else if([temp_code isEqual:@"306"])
        {
            [self contentsSelectColorEffect:_man306View];
            bool_306=true;
        }
        else if([temp_code isEqual:@"307"])
        {
            [self contentsSelectColorEffect:_man307View];
            bool_307=true;
        }
        else if([temp_code isEqual:@"308"])
        {
            [self contentsSelectColorEffect:_man308View];
            bool_308=true;
        }
        else if([temp_code isEqual:@"309"])
        {
            [self contentsSelectColorEffect:_man309View];
            bool_309=true;
        }
        else if([temp_code isEqual:@"310"])
        {
            [self contentsSelectColorEffect:_man310View];
            bool_310=true;
        }
        else if([temp_code isEqual:@"311"])
        {
            [self contentsSelectColorEffect:_man311View];
            bool_311=true;
        }
        else if([temp_code isEqual:@"312"])
        {
            [self contentsSelectColorEffect:_man312View];
            bool_312=true;
        }
        else if([temp_code isEqual:@"313"])
        {
            [self contentsSelectColorEffect:_man313View];
            bool_313=true;
        }
        else if([temp_code isEqual:@"314"])
        {
            [self contentsSelectColorEffect:_man314View];
            bool_314=true;
        }
        else if([temp_code isEqual:@"315"])
        {
            [self contentsSelectColorEffect:_man315View];
            bool_315=true;
        }
        
    }
    
}

// 컨텐츠의 색을 없애는 효과
- (void)contentsDissmissColorEffect:(UIView *)tempView
{
    tempView.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0];
}

// 컨텐츠의 색을 만들어 주는 효과
- (void)contentsSelectColorEffect:(UIView *)tempView
{
    tempView.backgroundColor = [UIColor colorWithRed:238.0/255.0 green:65.0/255.0 blue:56.0/255.0 alpha:1.0];
}

//  탭이 가진 배열을 전달하였을 때 그 배열의 총 가격을 뱉어준다.
- (int)tapArrayTotolPrice:(NSMutableArray *)shoe_codeArray
{
    int price = 0;
    for(NSString *temp_code in shoe_codeArray)
    {
        if([temp_code isEqualToString:@"100"])
        {
            price += 0;
        }
        else if([temp_code isEqualToString:@"101"])
        {
            price += 5000;
        }
        else if([temp_code isEqualToString:@"102"])
        {
            price += 15000;
        }
        else if([temp_code isEqualToString:@"103"])
        {
            price += 18000;
        }
        else if([temp_code isEqualToString:@"104"])
        {
            price += 15000;
        }
        else if([temp_code isEqualToString:@"105"])
        {
            price += 29000;
        }
        else if([temp_code isEqualToString:@"106"])
        {
            price += 32000;
        }
        else if([temp_code isEqualToString:@"107"])
        {
            price += 50000;
        }
        else if([temp_code isEqualToString:@"108"])
        {
            price += 15000;
        }
        else if([temp_code isEqualToString:@"109"])
        {
            price += 4000;
        }
        else if([temp_code isEqualToString:@"110"])
        {
            price += 0;
        }
        else if([temp_code isEqualToString:@"111"])
        {
            price += 100;
        }
        else if([temp_code isEqualToString:@"300"])
        {
            price += 0;
        }
        else if([temp_code isEqualToString:@"301"])
        {
            price += 20000;
        }
        else if([temp_code isEqualToString:@"302"])
        {
            price += 30000;
        }
        else if([temp_code isEqualToString:@"303"])
        {
            price += 40000;
        }
        else if([temp_code isEqualToString:@"304"])
        {
            price += 40000;
        }
        else if([temp_code isEqualToString:@"305"])
        {
            price += 30000;
        }
        else if([temp_code isEqualToString:@"306"])
        {
            price += 60000;
        }
        else if([temp_code isEqualToString:@"307"])
        {
            price += 158000;
        }
        else if([temp_code isEqualToString:@"308"])
        {
            price += 15000;
        }
        else if([temp_code isEqualToString:@"309"])
        {
            price += 75000;
        }
        else if([temp_code isEqualToString:@"310"])
        {
            price += 110000;
        }
        else if([temp_code isEqualToString:@"311"])
        {
            price += 15000;
        }
        else if([temp_code isEqualToString:@"312"])
        {
            price += 30000;
        }
        else if([temp_code isEqualToString:@"313"])
        {
            price += 4000;
        }
        else if([temp_code isEqualToString:@"314"])
        {
            price += 0;
        }
        else if([temp_code isEqualToString:@"315"])
        {
            price += 100;
        }
        
    }
    return price;
}

// 컨텐츠들이 선택된 것들을 모두 해제시켜준다.
- (void)clearContentsSelectedColor
{
    [self contentsDissmissColorEffect:_man100View];
    [self contentsDissmissColorEffect:_man101View];
    [self contentsDissmissColorEffect:_man102View];
    [self contentsDissmissColorEffect:_man103View];
    [self contentsDissmissColorEffect:_man104View];
    [self contentsDissmissColorEffect:_man105View];
    [self contentsDissmissColorEffect:_man106View];
    [self contentsDissmissColorEffect:_man107View];
    [self contentsDissmissColorEffect:_man108View];
    [self contentsDissmissColorEffect:_man109View];
    [self contentsDissmissColorEffect:_man110View];
    [self contentsDissmissColorEffect:_man111View];
    
    [self contentsDissmissColorEffect:_man300View];
    [self contentsDissmissColorEffect:_man301View];
    [self contentsDissmissColorEffect:_man302View];
    [self contentsDissmissColorEffect:_man303View];
    [self contentsDissmissColorEffect:_man304View];
    [self contentsDissmissColorEffect:_man305View];
    [self contentsDissmissColorEffect:_man306View];
    [self contentsDissmissColorEffect:_man307View];
    [self contentsDissmissColorEffect:_man308View];
    [self contentsDissmissColorEffect:_man309View];
    [self contentsDissmissColorEffect:_man310View];
    [self contentsDissmissColorEffect:_man311View];
    [self contentsDissmissColorEffect:_man312View];
    [self contentsDissmissColorEffect:_man313View];
    [self contentsDissmissColorEffect:_man314View];
    [self contentsDissmissColorEffect:_man315View];
    
    
    bool_100 = false;
    bool_101 = false;
    bool_102 = false;
    bool_103 = false;
    bool_104 = false;
    bool_105 = false;
    bool_106 = false;
    bool_107 = false;
    bool_108 = false;
    bool_109 = false;
    bool_110 = false;
    bool_111 = false;
    
    bool_300 = false;
    bool_301 = false;
    bool_302 = false;
    bool_303 = false;
    bool_304 = false;
    bool_305 = false;
    bool_306 = false;
    bool_307 = false;
    bool_308 = false;
    bool_309 = false;
    bool_310 = false;
    bool_311 = false;
    bool_312 = false;
    bool_313 = false;
    bool_314 = false;
    bool_315 = false;
    
    [self normalPremiumColorEffect:1];
    
}

// 스트링과 인트형을 받아서 더한 후 스트링형으로 보내줌
- (NSString *)calculate:(NSString *)string over:(int)price
{
    NSInteger total = [string integerValue];
    total += price;
    NSString *totalString = [@(total) stringValue];
    return totalString;
}


@end
