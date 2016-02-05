
#import "WomenSelectViewController.h"
#import "RootViewController.h"
#import "ServiceViewController.h"
#import "SelectCode.h"

@interface WomenSelectViewController ()
{
    Boolean bool_200;
    Boolean bool_201;
    Boolean bool_202;
    Boolean bool_203;
    Boolean bool_204;
    Boolean bool_205;
    Boolean bool_206;
    Boolean bool_207;
    Boolean bool_208;
    Boolean bool_209;
    Boolean bool_210;
    Boolean bool_211;
    Boolean bool_212;
    
    
    Boolean bool_400;
    Boolean bool_401;
    Boolean bool_402;
    Boolean bool_403;
    Boolean bool_404;
    Boolean bool_405;
    Boolean bool_406;
    Boolean bool_407;
    Boolean bool_408;
    Boolean bool_409;
    Boolean bool_410;
    Boolean bool_411;
    Boolean bool_412;
    Boolean bool_413;
    Boolean bool_414;
    Boolean bool_415;
    Boolean bool_416;
    Boolean bool_417;
    Boolean bool_418;
    Boolean bool_419;
    Boolean bool_420;
    Boolean bool_421;
    Boolean bool_422;
    Boolean bool_423;
    Boolean bool_424;
    
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

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView2;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIView *woman200View;
@property (weak, nonatomic) IBOutlet UIButton *woman200Button;
@property (weak, nonatomic) IBOutlet UILabel *woman200Label;

@property (weak, nonatomic) IBOutlet UIView *woman201View;
@property (weak, nonatomic) IBOutlet UIButton *woman201Button;
@property (weak, nonatomic) IBOutlet UILabel *woman201Label;

@property (weak, nonatomic) IBOutlet UIView *woman202View;
@property (weak, nonatomic) IBOutlet UIButton *woman202Button;
@property (weak, nonatomic) IBOutlet UILabel *woman202Label;

@property (weak, nonatomic) IBOutlet UIView *woman203View;
@property (weak, nonatomic) IBOutlet UIButton *woman203Button;
@property (weak, nonatomic) IBOutlet UILabel *woman203Label;

@property (weak, nonatomic) IBOutlet UIView *woman204View;
@property (weak, nonatomic) IBOutlet UIButton *woman204Button;
@property (weak, nonatomic) IBOutlet UILabel *woman204Label;

@property (weak, nonatomic) IBOutlet UIView *woman205View;
@property (weak, nonatomic) IBOutlet UIButton *woman205Button;
@property (weak, nonatomic) IBOutlet UILabel *woman205Label;

@property (weak, nonatomic) IBOutlet UIView *woman206View;
@property (weak, nonatomic) IBOutlet UIButton *woman206Button;
@property (weak, nonatomic) IBOutlet UILabel *woman206Label;

@property (weak, nonatomic) IBOutlet UIView *woman207View;
@property (weak, nonatomic) IBOutlet UIButton *woman207Button;
@property (weak, nonatomic) IBOutlet UILabel *woman207Label;

@property (weak, nonatomic) IBOutlet UIView *woman208View;
@property (weak, nonatomic) IBOutlet UIButton *woman208Button;
@property (weak, nonatomic) IBOutlet UILabel *woman208Label;

@property (weak, nonatomic) IBOutlet UIView *woman209View;
@property (weak, nonatomic) IBOutlet UIButton *woman209Button;
@property (weak, nonatomic) IBOutlet UILabel *woman209Label;

@property (weak, nonatomic) IBOutlet UIView *woman210View;
@property (weak, nonatomic) IBOutlet UIButton *woman210Button;
@property (weak, nonatomic) IBOutlet UILabel *woman210Label;

@property (weak, nonatomic) IBOutlet UIView *woman211View;
@property (weak, nonatomic) IBOutlet UIButton *woman211Button;
@property (weak, nonatomic) IBOutlet UILabel *woman211Label;

@property (weak, nonatomic) IBOutlet UIView *woman212View;
@property (weak, nonatomic) IBOutlet UIButton *woman212Button;
@property (weak, nonatomic) IBOutlet UILabel *woman212Label;

@property (weak, nonatomic) IBOutlet UIView *woman400View;
@property (weak, nonatomic) IBOutlet UILabel *woman400Label;
@property (weak, nonatomic) IBOutlet UIButton *woman400Button;

@property (weak, nonatomic) IBOutlet UIView *woman401View;
@property (weak, nonatomic) IBOutlet UILabel *woman401Label;
@property (weak, nonatomic) IBOutlet UIButton *woman401Button;

@property (weak, nonatomic) IBOutlet UIView *woman402View;
@property (weak, nonatomic) IBOutlet UILabel *woman402Label;
@property (weak, nonatomic) IBOutlet UIButton *woman402Button;

@property (weak, nonatomic) IBOutlet UIView *woman403View;
@property (weak, nonatomic) IBOutlet UILabel *woman403Label;
@property (weak, nonatomic) IBOutlet UIButton *woman403Button;

@property (weak, nonatomic) IBOutlet UIView *woman404View;
@property (weak, nonatomic) IBOutlet UILabel *woman404Label;
@property (weak, nonatomic) IBOutlet UIButton *woman404Button;

@property (weak, nonatomic) IBOutlet UIView *woman405View;
@property (weak, nonatomic) IBOutlet UILabel *woman405Label;
@property (weak, nonatomic) IBOutlet UIButton *woman405Button;

@property (weak, nonatomic) IBOutlet UIView *woman406View;
@property (weak, nonatomic) IBOutlet UILabel *woman406Label;
@property (weak, nonatomic) IBOutlet UIButton *woman406Button;

@property (weak, nonatomic) IBOutlet UIView *woman407View;
@property (weak, nonatomic) IBOutlet UIButton *woman407Button;
@property (weak, nonatomic) IBOutlet UILabel *woman407Label;

@property (weak, nonatomic) IBOutlet UIView *woman408View;
@property (weak, nonatomic) IBOutlet UIButton *woman408Button;
@property (weak, nonatomic) IBOutlet UILabel *woman408Label;

@property (weak, nonatomic) IBOutlet UIView *woman409View;
@property (weak, nonatomic) IBOutlet UIButton *woman409Button;
@property (weak, nonatomic) IBOutlet UILabel *woman409Label;

@property (weak, nonatomic) IBOutlet UIView *woman410View;
@property (weak, nonatomic) IBOutlet UIButton *woman410Button;
@property (weak, nonatomic) IBOutlet UILabel *woman410Label;

@property (weak, nonatomic) IBOutlet UIView *woman411View;
@property (weak, nonatomic) IBOutlet UILabel *woman411Label;
@property (weak, nonatomic) IBOutlet UIButton *woman411Button;

@property (weak, nonatomic) IBOutlet UIView *woman412View;
@property (weak, nonatomic) IBOutlet UILabel *woman412Label;
@property (weak, nonatomic) IBOutlet UIButton *woman412Button;

@property (weak, nonatomic) IBOutlet UIView *woman413View;
@property (weak, nonatomic) IBOutlet UILabel *woman413Label;
@property (weak, nonatomic) IBOutlet UIButton *woman413Button;

@property (weak, nonatomic) IBOutlet UIView *woman414View;
@property (weak, nonatomic) IBOutlet UILabel *woman414Label;
@property (weak, nonatomic) IBOutlet UIButton *woman414Button;

@property (weak, nonatomic) IBOutlet UIView *woman415View;
@property (weak, nonatomic) IBOutlet UILabel *woman415Label;
@property (weak, nonatomic) IBOutlet UIButton *woman415Button;

@property (weak, nonatomic) IBOutlet UIView *woman416View;
@property (weak, nonatomic) IBOutlet UILabel *woman416Label;
@property (weak, nonatomic) IBOutlet UIButton *woman416Button;

@property (weak, nonatomic) IBOutlet UIView *woman417View;
@property (weak, nonatomic) IBOutlet UILabel *woman417Label;
@property (weak, nonatomic) IBOutlet UIButton *woman417Button;

@property (weak, nonatomic) IBOutlet UIView *woman418View;
@property (weak, nonatomic) IBOutlet UIButton *woman418Button;
@property (weak, nonatomic) IBOutlet UILabel *woman418Label;

@property (weak, nonatomic) IBOutlet UIView *woman419View;
@property (weak, nonatomic) IBOutlet UIButton *woman419Button;
@property (weak, nonatomic) IBOutlet UILabel *woman419Label;

@property (weak, nonatomic) IBOutlet UIView *woman420View;
@property (weak, nonatomic) IBOutlet UIButton *woman420Button;
@property (weak, nonatomic) IBOutlet UILabel *woman420Label;

@property (weak, nonatomic) IBOutlet UIView *woman421View;
@property (weak, nonatomic) IBOutlet UIButton *woman421Button;
@property (weak, nonatomic) IBOutlet UILabel *woman421Label;

@property (weak, nonatomic) IBOutlet UIView *woman422View;
@property (weak, nonatomic) IBOutlet UIButton *woman422Button;
@property (weak, nonatomic) IBOutlet UILabel *woman422Label;

@property (weak, nonatomic) IBOutlet UIView *woman423View;
@property (weak, nonatomic) IBOutlet UIButton *woman423Button;
@property (weak, nonatomic) IBOutlet UILabel *woman423Label;

@property (weak, nonatomic) IBOutlet UIView *woman424View;
@property (weak, nonatomic) IBOutlet UIButton *woman424Button;
@property (weak, nonatomic) IBOutlet UILabel *woman424Label;

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

@implementation WomenSelectViewController
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
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width, 190*yR+_scrollView.frame.size.height);
    
    _scrollView2.frame = CGRectMake(_scrollView2.frame.origin.x*xR, _scrollView2.frame.origin.y*yR, _scrollView2.frame.size.width*xR, _scrollView2.frame.size.height*yR);
    _scrollView2.showsVerticalScrollIndicator=YES;
    _scrollView2.scrollEnabled=YES;
    [self.view addSubview:_scrollView2];
    _scrollView2.contentSize = CGSizeMake(_scrollView2.frame.size.width, 500*yR+_scrollView2.frame.size.height);
    
    _woman200View.frame = CGRectMake(_woman200View.frame.origin.x*xR, _woman200View.frame.origin.y*yR, _woman200View.frame.size.width*xR, _woman200View.frame.size.height*yR);
    [_woman200Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman200Label.frame = CGRectMake(_woman200Label.frame.origin.x*xR, _woman200Label.frame.origin.y*yR, _woman200Label.frame.size.width*xR, _woman200Label.frame.size.height*yR);
    _woman200Button.frame = CGRectMake(_woman200Button.frame.origin.x*xR, _woman200Button.frame.origin.y*yR, _woman200Button.frame.size.width*xR, _woman200Button.frame.size.height*yR);
    
    _woman201View.frame = CGRectMake(_woman201View.frame.origin.x*xR, _woman201View.frame.origin.y*yR, _woman201View.frame.size.width*xR, _woman201View.frame.size.height*yR);
    [_woman201Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman201Label.frame = CGRectMake(_woman201Label.frame.origin.x*xR, _woman201Label.frame.origin.y*yR, _woman201Label.frame.size.width*xR, _woman201Label.frame.size.height*yR);
    _woman201Button.frame = CGRectMake(_woman201Button.frame.origin.x*xR, _woman201Button.frame.origin.y*yR, _woman201Button.frame.size.width*xR, _woman201Button.frame.size.height*yR);
    
    _woman202View.frame = CGRectMake(_woman202View.frame.origin.x*xR, _woman202View.frame.origin.y*yR, _woman202View.frame.size.width*xR, _woman202View.frame.size.height*yR);
    [_woman202Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman202Label.frame = CGRectMake(_woman202Label.frame.origin.x*xR, _woman202Label.frame.origin.y*yR, _woman202Label.frame.size.width*xR, _woman202Label.frame.size.height*yR);
    _woman202Button.frame = CGRectMake(_woman202Button.frame.origin.x*xR, _woman202Button.frame.origin.y*yR, _woman202Button.frame.size.width*xR, _woman202Button.frame.size.height*yR);
    
    _woman203View.frame = CGRectMake(_woman203View.frame.origin.x*xR, _woman203View.frame.origin.y*yR, _woman203View.frame.size.width*xR, _woman203View.frame.size.height*yR);
    [_woman203Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman203Label.frame = CGRectMake(_woman203Label.frame.origin.x*xR, _woman203Label.frame.origin.y*yR, _woman203Label.frame.size.width*xR, _woman203Label.frame.size.height*yR);
    _woman203Button.frame = CGRectMake(_woman203Button.frame.origin.x*xR, _woman203Button.frame.origin.y*yR, _woman203Button.frame.size.width*xR, _woman203Button.frame.size.height*yR);
    
    _woman204View.frame = CGRectMake(_woman204View.frame.origin.x*xR, _woman204View.frame.origin.y*yR, _woman204View.frame.size.width*xR, _woman204View.frame.size.height*yR);
    [_woman204Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman204Label.frame = CGRectMake(_woman204Label.frame.origin.x*xR, _woman204Label.frame.origin.y*yR, _woman204Label.frame.size.width*xR, _woman204Label.frame.size.height*yR);
    _woman204Button.frame = CGRectMake(_woman204Button.frame.origin.x*xR, _woman204Button.frame.origin.y*yR, _woman204Button.frame.size.width*xR, _woman204Button.frame.size.height*yR);
    
    _woman205View.frame = CGRectMake(_woman205View.frame.origin.x*xR, _woman205View.frame.origin.y*yR, _woman205View.frame.size.width*xR, _woman205View.frame.size.height*yR);
    [_woman205Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman205Label.frame = CGRectMake(_woman205Label.frame.origin.x*xR, _woman205Label.frame.origin.y*yR, _woman205Label.frame.size.width*xR, _woman205Label.frame.size.height*yR);
    _woman205Button.frame = CGRectMake(_woman205Button.frame.origin.x*xR, _woman205Button.frame.origin.y*yR, _woman205Button.frame.size.width*xR, _woman205Button.frame.size.height*yR);
    
    _woman206View.frame = CGRectMake(_woman206View.frame.origin.x*xR, _woman206View.frame.origin.y*yR, _woman206View.frame.size.width*xR, _woman206View.frame.size.height*yR);
    [_woman206Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman206Label.frame = CGRectMake(_woman206Label.frame.origin.x*xR, _woman206Label.frame.origin.y*yR, _woman206Label.frame.size.width*xR, _woman206Label.frame.size.height*yR);
    _woman206Button.frame = CGRectMake(_woman206Button.frame.origin.x*xR, _woman206Button.frame.origin.y*yR, _woman206Button.frame.size.width*xR, _woman206Button.frame.size.height*yR);
    
    _woman207View.frame = CGRectMake(_woman207View.frame.origin.x*xR, _woman207View.frame.origin.y*yR, _woman207View.frame.size.width*xR, _woman207View.frame.size.height*yR);
    [_woman207Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman207Label.frame = CGRectMake(_woman207Label.frame.origin.x*xR, _woman207Label.frame.origin.y*yR, _woman207Label.frame.size.width*xR, _woman207Label.frame.size.height*yR);
    _woman207Button.frame = CGRectMake(_woman207Button.frame.origin.x*xR, _woman207Button.frame.origin.y*yR, _woman207Button.frame.size.width*xR, _woman207Button.frame.size.height*yR);
    
    _woman208View.frame = CGRectMake(_woman208View.frame.origin.x*xR, _woman208View.frame.origin.y*yR, _woman208View.frame.size.width*xR, _woman208View.frame.size.height*yR);
    [_woman208Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman208Label.frame = CGRectMake(_woman208Label.frame.origin.x*xR, _woman208Label.frame.origin.y*yR, _woman208Label.frame.size.width*xR, _woman208Label.frame.size.height*yR);
    _woman208Button.frame = CGRectMake(_woman208Button.frame.origin.x*xR, _woman208Button.frame.origin.y*yR, _woman208Button.frame.size.width*xR, _woman208Button.frame.size.height*yR);
    
    _woman209View.frame = CGRectMake(_woman209View.frame.origin.x*xR, _woman209View.frame.origin.y*yR, _woman209View.frame.size.width*xR, _woman209View.frame.size.height*yR);
    [_woman209Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman209Label.frame = CGRectMake(_woman209Label.frame.origin.x*xR, _woman209Label.frame.origin.y*yR, _woman209Label.frame.size.width*xR, _woman209Label.frame.size.height*yR);
    _woman209Button.frame = CGRectMake(_woman209Button.frame.origin.x*xR, _woman209Button.frame.origin.y*yR, _woman209Button.frame.size.width*xR, _woman209Button.frame.size.height*yR);
    _woman210View.frame = CGRectMake(_woman210View.frame.origin.x*xR, _woman210View.frame.origin.y*yR, _woman210View.frame.size.width*xR, _woman210View.frame.size.height*yR);
    [_woman210Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman210Label.frame = CGRectMake(_woman210Label.frame.origin.x*xR, _woman210Label.frame.origin.y*yR, _woman210Label.frame.size.width*xR, _woman210Label.frame.size.height*yR);
    _woman210Button.frame = CGRectMake(_woman210Button.frame.origin.x*xR, _woman210Button.frame.origin.y*yR, _woman210Button.frame.size.width*xR, _woman210Button.frame.size.height*yR);
    _woman211View.frame = CGRectMake(_woman211View.frame.origin.x*xR, _woman211View.frame.origin.y*yR, _woman211View.frame.size.width*xR, _woman211View.frame.size.height*yR);
    [_woman211Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman211Label.frame = CGRectMake(_woman211Label.frame.origin.x*xR, _woman211Label.frame.origin.y*yR, _woman211Label.frame.size.width*xR, _woman211Label.frame.size.height*yR);
    _woman211Button.frame = CGRectMake(_woman211Button.frame.origin.x*xR, _woman211Button.frame.origin.y*yR, _woman211Button.frame.size.width*xR, _woman211Button.frame.size.height*yR);
    
    _woman212View.frame = CGRectMake(_woman212View.frame.origin.x*xR, _woman212View.frame.origin.y*yR, _woman212View.frame.size.width*xR, _woman212View.frame.size.height*yR);
    [_woman212Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman212Label.frame = CGRectMake(_woman212Label.frame.origin.x*xR, _woman212Label.frame.origin.y*yR, _woman212Label.frame.size.width*xR, _woman212Label.frame.size.height*yR);
    _woman212Button.frame = CGRectMake(_woman212Button.frame.origin.x*xR, _woman212Button.frame.origin.y*yR, _woman212Button.frame.size.width*xR, _woman212Button.frame.size.height*yR);
    
    _woman400View.frame = CGRectMake(_woman400View.frame.origin.x*xR, _woman400View.frame.origin.y*yR, _woman400View.frame.size.width*xR, _woman400View.frame.size.height*yR);
    [_woman400Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman400Label.frame = CGRectMake(_woman400Label.frame.origin.x*xR, _woman400Label.frame.origin.y*yR, _woman400Label.frame.size.width*xR, _woman400Label.frame.size.height*yR);
    _woman400Button.frame = CGRectMake(_woman400Button.frame.origin.x*xR, _woman400Button.frame.origin.y*yR, _woman400Button.frame.size.width*xR, _woman400Button.frame.size.height*yR);
    
    _woman401View.frame = CGRectMake(_woman401View.frame.origin.x*xR, _woman401View.frame.origin.y*yR, _woman401View.frame.size.width*xR, _woman401View.frame.size.height*yR);
    [_woman401Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman401Label.frame = CGRectMake(_woman401Label.frame.origin.x*xR, _woman401Label.frame.origin.y*yR, _woman401Label.frame.size.width*xR, _woman401Label.frame.size.height*yR);
    _woman401Button.frame = CGRectMake(_woman401Button.frame.origin.x*xR, _woman401Button.frame.origin.y*yR, _woman401Button.frame.size.width*xR, _woman401Button.frame.size.height*yR);
    
    _woman402View.frame = CGRectMake(_woman402View.frame.origin.x*xR, _woman402View.frame.origin.y*yR, _woman402View.frame.size.width*xR, _woman402View.frame.size.height*yR);
    [_woman402Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman402Label.frame = CGRectMake(_woman402Label.frame.origin.x*xR, _woman402Label.frame.origin.y*yR, _woman402Label.frame.size.width*xR, _woman402Label.frame.size.height*yR);
    _woman402Button.frame = CGRectMake(_woman402Button.frame.origin.x*xR, _woman402Button.frame.origin.y*yR, _woman402Button.frame.size.width*xR, _woman402Button.frame.size.height*yR);
    
    _woman403View.frame = CGRectMake(_woman403View.frame.origin.x*xR, _woman403View.frame.origin.y*yR, _woman403View.frame.size.width*xR, _woman403View.frame.size.height*yR);
    [_woman403Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman403Label.frame = CGRectMake(_woman403Label.frame.origin.x*xR, _woman403Label.frame.origin.y*yR, _woman403Label.frame.size.width*xR, _woman403Label.frame.size.height*yR);
    _woman403Button.frame = CGRectMake(_woman403Button.frame.origin.x*xR, _woman403Button.frame.origin.y*yR, _woman403Button.frame.size.width*xR, _woman403Button.frame.size.height*yR);
    
    _woman404View.frame = CGRectMake(_woman404View.frame.origin.x*xR, _woman404View.frame.origin.y*yR, _woman404View.frame.size.width*xR, _woman404View.frame.size.height*yR);
    [_woman404Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman404Label.frame = CGRectMake(_woman404Label.frame.origin.x*xR, _woman404Label.frame.origin.y*yR, _woman404Label.frame.size.width*xR, _woman404Label.frame.size.height*yR);
    _woman404Button.frame = CGRectMake(_woman404Button.frame.origin.x*xR, _woman404Button.frame.origin.y*yR, _woman404Button.frame.size.width*xR, _woman404Button.frame.size.height*yR);
    
    _woman405View.frame = CGRectMake(_woman405View.frame.origin.x*xR, _woman405View.frame.origin.y*yR, _woman405View.frame.size.width*xR, _woman405View.frame.size.height*yR);
    [_woman405Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman405Label.frame = CGRectMake(_woman405Label.frame.origin.x*xR, _woman405Label.frame.origin.y*yR, _woman405Label.frame.size.width*xR, _woman405Label.frame.size.height*yR);
    _woman405Button.frame = CGRectMake(_woman405Button.frame.origin.x*xR, _woman405Button.frame.origin.y*yR, _woman405Button.frame.size.width*xR, _woman405Button.frame.size.height*yR);
    
    _woman406View.frame = CGRectMake(_woman406View.frame.origin.x*xR, _woman406View.frame.origin.y*yR, _woman406View.frame.size.width*xR, _woman406View.frame.size.height*yR);
    [_woman406Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman406Label.frame = CGRectMake(_woman406Label.frame.origin.x*xR, _woman406Label.frame.origin.y*yR, _woman406Label.frame.size.width*xR, _woman406Label.frame.size.height*yR);
    _woman406Button.frame = CGRectMake(_woman406Button.frame.origin.x*xR, _woman406Button.frame.origin.y*yR, _woman406Button.frame.size.width*xR, _woman406Button.frame.size.height*yR);
    
    _woman407View.frame = CGRectMake(_woman407View.frame.origin.x*xR, _woman407View.frame.origin.y*yR, _woman407View.frame.size.width*xR, _woman407View.frame.size.height*yR);
    [_woman407Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman407Label.frame = CGRectMake(_woman407Label.frame.origin.x*xR, _woman407Label.frame.origin.y*yR, _woman407Label.frame.size.width*xR, _woman407Label.frame.size.height*yR);
    _woman407Button.frame = CGRectMake(_woman407Button.frame.origin.x*xR, _woman407Button.frame.origin.y*yR, _woman407Button.frame.size.width*xR, _woman407Button.frame.size.height*yR);
    
    _woman408View.frame = CGRectMake(_woman408View.frame.origin.x*xR, _woman408View.frame.origin.y*yR, _woman408View.frame.size.width*xR, _woman408View.frame.size.height*yR);
    [_woman408Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman408Label.frame = CGRectMake(_woman408Label.frame.origin.x*xR, _woman408Label.frame.origin.y*yR, _woman408Label.frame.size.width*xR, _woman408Label.frame.size.height*yR);
    _woman408Button.frame = CGRectMake(_woman408Button.frame.origin.x*xR, _woman408Button.frame.origin.y*yR, _woman408Button.frame.size.width*xR, _woman408Button.frame.size.height*yR);
    
    _woman409View.frame = CGRectMake(_woman409View.frame.origin.x*xR, _woman409View.frame.origin.y*yR, _woman409View.frame.size.width*xR, _woman409View.frame.size.height*yR);
    [_woman409Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman409Label.frame = CGRectMake(_woman409Label.frame.origin.x*xR, _woman409Label.frame.origin.y*yR, _woman409Label.frame.size.width*xR, _woman409Label.frame.size.height*yR);
    _woman409Button.frame = CGRectMake(_woman409Button.frame.origin.x*xR, _woman409Button.frame.origin.y*yR, _woman409Button.frame.size.width*xR, _woman409Button.frame.size.height*yR);
    
    _woman410View.frame = CGRectMake(_woman410View.frame.origin.x*xR, _woman410View.frame.origin.y*yR, _woman410View.frame.size.width*xR, _woman410View.frame.size.height*yR);
    [_woman410Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman410Label.frame = CGRectMake(_woman410Label.frame.origin.x*xR, _woman410Label.frame.origin.y*yR, _woman410Label.frame.size.width*xR, _woman410Label.frame.size.height*yR);
    _woman410Button.frame = CGRectMake(_woman410Button.frame.origin.x*xR, _woman410Button.frame.origin.y*yR, _woman410Button.frame.size.width*xR, _woman410Button .frame.size.height*yR);
    
    _woman411View.frame = CGRectMake(_woman411View.frame.origin.x*xR, _woman411View.frame.origin.y*yR, _woman411View.frame.size.width*xR, _woman411View.frame.size.height*yR);
    [_woman411Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman411Label.frame = CGRectMake(_woman411Label.frame.origin.x*xR, _woman411Label.frame.origin.y*yR, _woman411Label.frame.size.width*xR, _woman411Label.frame.size.height*yR);
    _woman411Button.frame = CGRectMake(_woman411Button.frame.origin.x*xR, _woman411Button.frame.origin.y*yR, _woman411Button.frame.size.width*xR, _woman411Button.frame.size.height*yR);
    
    _woman412View.frame = CGRectMake(_woman412View.frame.origin.x*xR, _woman412View.frame.origin.y*yR, _woman412View.frame.size.width*xR, _woman412View.frame.size.height*yR);
    [_woman412Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman412Label.frame = CGRectMake(_woman412Label.frame.origin.x*xR, _woman412Label.frame.origin.y*yR, _woman412Label.frame.size.width*xR, _woman412Label.frame.size.height*yR);
    _woman412Button.frame = CGRectMake(_woman412Button.frame.origin.x*xR, _woman412Button.frame.origin.y*yR, _woman412Button.frame.size.width*xR, _woman412Button.frame.size.height*yR);
    
    _woman413View.frame = CGRectMake(_woman413View.frame.origin.x*xR, _woman413View.frame.origin.y*yR, _woman413View.frame.size.width*xR, _woman413View.frame.size.height*yR);
    [_woman413Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman413Label.frame = CGRectMake(_woman413Label.frame.origin.x*xR, _woman413Label.frame.origin.y*yR, _woman413Label.frame.size.width*xR, _woman413Label.frame.size.height*yR);
    _woman413Button.frame = CGRectMake(_woman413Button.frame.origin.x*xR, _woman413Button.frame.origin.y*yR, _woman413Button.frame.size.width*xR, _woman413Button.frame.size.height*yR);
    
    _woman414View.frame = CGRectMake(_woman414View.frame.origin.x*xR, _woman414View.frame.origin.y*yR, _woman414View.frame.size.width*xR, _woman414View.frame.size.height*yR);
    [_woman414Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman414Label.frame = CGRectMake(_woman414Label.frame.origin.x*xR, _woman414Label.frame.origin.y*yR, _woman414Label.frame.size.width*xR, _woman414Label.frame.size.height*yR);
    _woman414Button.frame = CGRectMake(_woman414Button.frame.origin.x*xR, _woman414Button.frame.origin.y*yR, _woman414Button.frame.size.width*xR, _woman414Button.frame.size.height*yR);
    
    _woman415View.frame = CGRectMake(_woman415View.frame.origin.x*xR, _woman415View.frame.origin.y*yR, _woman415View.frame.size.width*xR, _woman415View.frame.size.height*yR);
    [_woman415Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman415Label.frame = CGRectMake(_woman415Label.frame.origin.x*xR, _woman415Label.frame.origin.y*yR, _woman415Label.frame.size.width*xR, _woman415Label.frame.size.height*yR);
    _woman415Button.frame = CGRectMake(_woman415Button.frame.origin.x*xR, _woman415Button.frame.origin.y*yR, _woman415Button.frame.size.width*xR, _woman415Button.frame.size.height*yR);
    
    _woman416View.frame = CGRectMake(_woman416View.frame.origin.x*xR, _woman416View.frame.origin.y*yR, _woman416View.frame.size.width*xR, _woman416View.frame.size.height*yR);
    [_woman416Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman416Label.frame = CGRectMake(_woman416Label.frame.origin.x*xR, _woman416Label.frame.origin.y*yR, _woman416Label.frame.size.width*xR, _woman416Label.frame.size.height*yR);
    _woman416Button.frame = CGRectMake(_woman416Button.frame.origin.x*xR, _woman416Button.frame.origin.y*yR, _woman416Button.frame.size.width*xR, _woman416Button.frame.size.height*yR);
    
    _woman417View.frame = CGRectMake(_woman417View.frame.origin.x*xR, _woman417View.frame.origin.y*yR, _woman417View.frame.size.width*xR, _woman417View.frame.size.height*yR);
    [_woman417Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman417Label.frame = CGRectMake(_woman417Label.frame.origin.x*xR, _woman417Label.frame.origin.y*yR, _woman417Label.frame.size.width*xR, _woman417Label.frame.size.height*yR);
    _woman417Button.frame = CGRectMake(_woman417Button.frame.origin.x*xR, _woman417Button.frame.origin.y*yR, _woman417Button.frame.size.width*xR, _woman417Button.frame.size.height*yR);
    
    _woman418View.frame = CGRectMake(_woman418View.frame.origin.x*xR, _woman418View.frame.origin.y*yR, _woman418View.frame.size.width*xR, _woman418View.frame.size.height*yR);
    [_woman418Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman418Label.frame = CGRectMake(_woman418Label.frame.origin.x*xR, _woman418Label.frame.origin.y*yR, _woman418Label.frame.size.width*xR, _woman418Label.frame.size.height*yR);
    _woman418Button.frame = CGRectMake(_woman418Button.frame.origin.x*xR, _woman418Button.frame.origin.y*yR, _woman418Button.frame.size.width*xR, _woman418Button.frame.size.height*yR);
    
    _woman419View.frame = CGRectMake(_woman419View.frame.origin.x*xR, _woman419View.frame.origin.y*yR, _woman419View.frame.size.width*xR, _woman419View.frame.size.height*yR);
    [_woman419Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman419Label.frame = CGRectMake(_woman419Label.frame.origin.x*xR, _woman419Label.frame.origin.y*yR, _woman419Label.frame.size.width*xR, _woman419Label.frame.size.height*yR);
    _woman419Button.frame = CGRectMake(_woman419Button.frame.origin.x*xR, _woman419Button.frame.origin.y*yR, _woman419Button.frame.size.width*xR, _woman419Button.frame.size.height*yR);
    
    _woman420View.frame = CGRectMake(_woman420View.frame.origin.x*xR, _woman420View.frame.origin.y*yR, _woman420View.frame.size.width*xR, _woman420View.frame.size.height*yR);
    [_woman420Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman420Label.frame = CGRectMake(_woman420Label.frame.origin.x*xR, _woman420Label.frame.origin.y*yR, _woman420Label.frame.size.width*xR, _woman420Label.frame.size.height*yR);
    _woman420Button.frame = CGRectMake(_woman420Button.frame.origin.x*xR, _woman420Button.frame.origin.y*yR, _woman420Button.frame.size.width*xR, _woman420Button.frame.size.height*yR);
    
    _woman421View.frame = CGRectMake(_woman421View.frame.origin.x*xR, _woman421View.frame.origin.y*yR, _woman421View.frame.size.width*xR, _woman421View.frame.size.height*yR);
    [_woman421Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman421Label.frame = CGRectMake(_woman421Label.frame.origin.x*xR, _woman421Label.frame.origin.y*yR, _woman421Label.frame.size.width*xR, _woman421Label.frame.size.height*yR);
    _woman421Button.frame = CGRectMake(_woman421Button.frame.origin.x*xR, _woman421Button.frame.origin.y*yR, _woman421Button.frame.size.width*xR, _woman421Button .frame.size.height*yR);
    
    _woman422View.frame = CGRectMake(_woman422View.frame.origin.x*xR, _woman422View.frame.origin.y*yR, _woman422View.frame.size.width*xR, _woman422View.frame.size.height*yR);
    [_woman422Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman422Label.frame = CGRectMake(_woman422Label.frame.origin.x*xR, _woman422Label.frame.origin.y*yR, _woman422Label.frame.size.width*xR, _woman422Label.frame.size.height*yR);
    _woman422Button.frame = CGRectMake(_woman422Button.frame.origin.x*xR, _woman422Button.frame.origin.y*yR, _woman422Button.frame.size.width*xR, _woman422Button.frame.size.height*yR);
    
    _woman423View.frame = CGRectMake(_woman423View.frame.origin.x*xR, _woman423View.frame.origin.y*yR, _woman423View.frame.size.width*xR, _woman423View.frame.size.height*yR);
    [_woman423Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman423Label.frame = CGRectMake(_woman423Label.frame.origin.x*xR, _woman423Label.frame.origin.y*yR, _woman423Label.frame.size.width*xR, _woman423Label.frame.size.height*yR);
    _woman423Button.frame = CGRectMake(_woman423Button.frame.origin.x*xR, _woman423Button.frame.origin.y*yR, _woman423Button.frame.size.width*xR, _woman423Button.frame.size.height*yR);
    
    _woman424View.frame = CGRectMake(_woman424View.frame.origin.x*xR, _woman424View.frame.origin.y*yR, _woman424View.frame.size.width*xR, _woman424View.frame.size.height*yR);
    [_woman424Label setFont:[UIFont fontWithName:@"System Font" size:fontSize12]];
    _woman424Label.frame = CGRectMake(_woman424Label.frame.origin.x*xR, _woman424Label.frame.origin.y*yR, _woman424Label.frame.size.width*xR, _woman424Label.frame.size.height*yR);
    _woman424Button.frame = CGRectMake(_woman424Button.frame.origin.x*xR, _woman424Button.frame.origin.y*yR, _woman424Button.frame.size.width*xR, _woman424Button .frame.size.height*yR);
    
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
        if([temp.service_index isEqualToString:@"1"])
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
        temp_object.service_index = @"1";
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
        temp_object.service_index = @"1";
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
        temp_object.service_index = @"1";
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
        temp_object.service_index = @"1";
        [serviceArray addObject:temp_object];
    }
    
    nextViewController.serviceArray = serviceArray;
    serviceTotalPrice += [_zeroLabel.text integerValue];
    nextViewController.serviceTotalPrice = serviceTotalPrice;
    [self presentViewController:nextViewController animated:NO completion:nil];
}

- (IBAction)woman200Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"200";
    int price = 0;
    _contentLabel.text=@"왓슈맨&왓슈걸과 상담 후 결정";
    if(bool_200) //dismiss
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
        [self contentsDissmissColorEffect:_woman200View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_200 = false;
        
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
        [self contentsSelectColorEffect:_woman200View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_200 = true;
    }
}
- (IBAction)woman201Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"201";
    int price = 5000;
    _contentLabel.text=@"오염제거 -> 일반 구두약 도포 -> 솔질 및 마무리";
    if(bool_201) //dismiss
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
        [self contentsDissmissColorEffect:_woman201View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_201 = false;
        
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
        [self contentsSelectColorEffect:_woman201View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_201 = true;
    }
    
}
- (IBAction)woman202Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"202";
    int price = 5000;
    _contentLabel.text=@"하이힐에 주로 쓰이는 작은 굽 교체";
    if(bool_202) //dismiss
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
        [self contentsDissmissColorEffect:_woman202View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_202 = false;
        
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
        [self contentsSelectColorEffect:_woman202View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_202 = true;
    }
    
}

- (IBAction)woman203Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"203";
    int price = 7000;
    _contentLabel.text=@"작은 굽 외 모든 크기의 굽 교체";
    if(bool_203) //dismiss
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
        [self contentsDissmissColorEffect:_woman203View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_203 = false;
        
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
        [self contentsSelectColorEffect:_woman203View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_203 = true;
    }
    
}

- (IBAction)woman204Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"204";
    int price = 15000;
    _contentLabel.text=@"구두의 앞창에 덧대어 손상과 미끄럼 방지";
    if(bool_204) //dismiss
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
        [self contentsDissmissColorEffect:_woman204View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_204 = false;
        
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
        [self contentsSelectColorEffect:_woman204View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_204 = true;
    }
    
}

- (IBAction)woman205Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"205";
    int price = 15000;
    _contentLabel.text=@"굽 위쪽이 갈리거나 굽의 통이 빠진 경우 전체 교체";
    if(bool_205) //dismiss
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
        [self contentsDissmissColorEffect:_woman205View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_205 = false;
        
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
        [self contentsSelectColorEffect:_woman205View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_205 = true;
    }
    
}

- (IBAction)woman206Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"206";
    int price = 15000;
    _contentLabel.text=@"부츠 닦이";
    if(bool_206) //dismiss
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
        [self contentsDissmissColorEffect:_woman206View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_206 = false;
        
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
        [self contentsSelectColorEffect:_woman206View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_206 = true;
    }
}

- (IBAction)woman207Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"207";
    int price = 22000;
    _contentLabel.text=@"앞창과 뒷굽 전체를 교체";
    if(bool_207) //dismiss
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
        [self contentsDissmissColorEffect:_woman207View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_207 = false;
        
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
        [self contentsSelectColorEffect:_woman207View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_207 = true;
    }
}

- (IBAction)woman208Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"208";
    int price = 15000;
    _contentLabel.text=@"구두 바닥에 맞춰서 깔창 부착";
    if(bool_208) //dismiss
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
        [self contentsDissmissColorEffect:_woman208View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_208 = false;
        
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
        [self contentsSelectColorEffect:_woman208View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_208 = true;
    }
}

- (IBAction)woman209Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"209";
    int price = 4000;
    _contentLabel.text=@"서비스 1개 이상 신청시 스타킹 추가";
    
    if(bool_209) //dismiss
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
        [self contentsDissmissColorEffect:_woman209View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_209 = false;
        
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
        [self contentsSelectColorEffect:_woman209View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_209 = true;
    }
}

- (IBAction)woman210Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"210";
    int price = 0;
    _contentLabel.text=@"서비스 1개 이상 신청시 대일밴드 무료제공";
    if(bool_210) //dismiss
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
        [self contentsDissmissColorEffect:_woman210View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_210 = false;
        
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
        [self contentsSelectColorEffect:_woman210View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_210 = true;
    }
}

- (IBAction)woman211Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"211";
    int price = 0;
    _contentLabel.text=@"담배는 연령 확인 후 현장 결제";
    if(bool_211) //dismiss
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
        [self contentsDissmissColorEffect:_woman211View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_211 = false;
        
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
        [self contentsSelectColorEffect:_woman211View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_211 = true;
    }
}

- (IBAction)woman212Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"212";
    int price = 100;
    _contentLabel.text=@"서비스 1개 이상 신청시 라이터 배달 가능";
    if(bool_212) //dismiss
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
        [self contentsDissmissColorEffect:_woman212View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_212 = false;
        
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
        [self contentsSelectColorEffect:_woman212View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_212 = true;
    }
}

- (IBAction)woman400Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"400";
    int price = 0;
    _contentLabel.text=@"왓슈맨&왓슈걸과 상담 후 결정";
    if(bool_400) //dismiss
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
        [self contentsDissmissColorEffect:_woman400View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_400 = false;
        
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
        [self contentsSelectColorEffect:_woman400View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_400 = true;
    }
    
}
- (IBAction)woman401Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"401";
    int price = 20000;
    _contentLabel.text=@"클렌징 -> 슈크림 도포 -> 솔질 및 마무리(사피르 사용)";
    if(bool_401) //dismiss
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
        [self contentsDissmissColorEffect:_woman401View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_401 = false;
        
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
        [self contentsSelectColorEffect:_woman401View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_401 = true;
    }
}
- (IBAction)woman402Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"302";
    int price = 30000;
    _contentLabel.text=@"오염제거 -> 클렌징 -> 슈크림 도포 -> 솔질 및 마무리(사피르 사용)";
    if(bool_402) //dismiss
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
        [self contentsDissmissColorEffect:_woman402View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_402 = false;
        
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
        [self contentsSelectColorEffect:_woman402View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_402 = true;
    }
}
- (IBAction)woman403Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"403";
    int price = 10000;
    _contentLabel.text=@"특허 굽으로 갈림이 덜하고 미끄럼 방지가 뛰어난 굽으로 교체";
    if(bool_403) //dismiss
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
        [self contentsDissmissColorEffect:_woman403View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_403 = false;
        
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
        [self contentsSelectColorEffect:_woman403View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_403 = true;
    }
}
- (IBAction)woman404Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"404";
    int price = 15000;
    _contentLabel.text=@"특허 굽으로 갈림이 덜하고 미끄럼 방지가 뛰어난 굽으로 교체";
    if(bool_404) //dismiss
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
        [self contentsDissmissColorEffect:_woman404View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_404 = false;
        
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
        [self contentsSelectColorEffect:_woman404View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_404 = true;
    }
}
- (IBAction)woman405Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"405";
    int price = 20000;
    _contentLabel.text=@"특허 굽으로 갈림이 덜하고 미끄럼 방지가 뛰어난 굽으로 교체";
    if(bool_405) //dismiss
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
        [self contentsDissmissColorEffect:_woman405View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_405 = false;
        
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
        [self contentsSelectColorEffect:_woman405View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_405 = true;
    }
}
- (IBAction)woman406Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"406";
    int price = 30000;
    _contentLabel.text=@"Vibram 제품(갈림이 덜하고 미끄럼 방지 우수)으로 앞창 덧댐";
    
    if(bool_406) //dismiss
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
        [self contentsDissmissColorEffect:_woman406View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_406 = false;
        
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
        [self contentsSelectColorEffect:_woman406View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_406 = true;
    }
}
- (IBAction)woman407Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"407";
    int price = 30000;
    _contentLabel.text=@"굽 위쪽이 갈리거나 굽의 통이 빠진 경우 전체 교체";
    if(bool_407) //dismiss
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
        [self contentsDissmissColorEffect:_woman407View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_407 = false;
        
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
        [self contentsSelectColorEffect:_woman407View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_407 = true;
    }
}

- (IBAction)woman408Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"408";
    int price = 30000;
    _contentLabel.text=@"밑창 떨어짐 및 손상 수선";
    if(bool_408) //dismiss
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
        [self contentsDissmissColorEffect:_woman408View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_408 = false;
        
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
        [self contentsSelectColorEffect:_woman408View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_408 = true;
    }
}

- (IBAction)woman409Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"409";
    int price = 40000;
    _contentLabel.text=@"뒷굽 외 까진 부분 동일한 가죽으로 덧댐";
    if(bool_409) //dismiss
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
        [self contentsDissmissColorEffect:_woman409View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_409 = false;
        
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
        [self contentsSelectColorEffect:_woman409View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_409 = true;
    }
}

- (IBAction)woman410Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"410";
    int price = 35000;
    _contentLabel.text=@"부츠 슈케어 (까진부분, 주름, 변색 복원)";
    if(bool_410) //dismiss
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
        [self contentsDissmissColorEffect:_woman410View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_410 = false;
        
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
        [self contentsSelectColorEffect:_woman410View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_410 = true;
    }
}
- (IBAction)woman411Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"411";
    int price = 15000;
    _contentLabel.text=@"구두 앞코의 까진 부분 동일한 색으로 염색";
    if(bool_411) //dismiss
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
        [self contentsDissmissColorEffect:_woman411View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_411 = false;
        
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
        [self contentsSelectColorEffect:_woman411View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_411 = true;
    }
}
- (IBAction)woman412Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"412";
    int price = 75000;
    _contentLabel.text=@"원하는 형태로 앞코의 디자인 변형";
    if(bool_412) //dismiss
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
        [self contentsDissmissColorEffect:_woman412View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_412 = false;
        
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
        [self contentsSelectColorEffect:_woman412View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_412 = true;
    }
}
- (IBAction)woman413Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"413";
    int price = 110000;
    _contentLabel.text=@"변색, 오염이 심한 경우 전체 컬러 염색";
    if(bool_413) //dismiss
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
        [self contentsDissmissColorEffect:_woman413View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_413 = false;
        
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
        [self contentsSelectColorEffect:_woman413View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_413 = true;
    }
}
- (IBAction)woman414Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"414";
    int price = 15000;
    _contentLabel.text=@"힐 높이 조절";
    if(bool_414) //dismiss
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
        [self contentsDissmissColorEffect:_woman414View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_414 = false;
        
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
        [self contentsSelectColorEffect:_woman414View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_414 = true;
    }
}
- (IBAction)woman415Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"415";
    int price = 15000;
    _contentLabel.text=@"";
    if(bool_415) //dismiss
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
        [self contentsDissmissColorEffect:_woman415View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_415 = false;
        
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
        [self contentsSelectColorEffect:_woman415View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_415 = true;
    }
}
- (IBAction)woman416Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"416";
    int price = 30000;
    _contentLabel.text=@"구두 안쪽의 창 동일한 소재와 크기로 교체";
    if(bool_416) //dismiss
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
        [self contentsDissmissColorEffect:_woman416View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_416 = false;
        
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
        [self contentsSelectColorEffect:_woman416View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_416 = true;
    }
}
- (IBAction)woman417Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"417";
    int price = 20000;
    _contentLabel.text=@"부츠의 통 부분 늘임";
    if(bool_417) //dismiss
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
        [self contentsDissmissColorEffect:_woman417View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_417 = false;
        
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
        [self contentsSelectColorEffect:_woman417View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_417 = true;
    }
}
- (IBAction)woman418Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"418";
    int price = 65000;
    _contentLabel.text=@"부츠의 통 부분을 줄임";
    
    if(bool_418) //dismiss
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
        [self contentsDissmissColorEffect:_woman418View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_418 = false;
        
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
        [self contentsSelectColorEffect:_woman418View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_418 = true;
    }
}
- (IBAction)woman419Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"419";
    int price = 65000;
    _contentLabel.text=@"지퍼가 망가진 경우 교체";
    
    if(bool_419) //dismiss
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
        [self contentsDissmissColorEffect:_woman419View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_419 = false;
        
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
        [self contentsSelectColorEffect:_woman419View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_419 = true;
    }
}

- (IBAction)woman420Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"420";
    int price = 20000;
    _contentLabel.text=@"지퍼의 손잡이 부분만 교체";
    if(bool_420) //dismiss
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
        [self contentsDissmissColorEffect:_woman420View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_420 = false;
        
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
        [self contentsSelectColorEffect:_woman420View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_420 = true;
    }
}

- (IBAction)woman421Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"421";
    int price = 4000;
    _contentLabel.text=@"서비스 1개 이상 신청시 스타킹 추가";
    if(bool_421) //dismiss
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
        [self contentsDissmissColorEffect:_woman421View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_421 = false;
        
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
        [self contentsSelectColorEffect:_woman421View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_421 = true;
    }
}

- (IBAction)woman422Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"422";
    int price = 0;
    _contentLabel.text=@"서비스 1개 이상 신청시 대일밴드 추가";
    if(bool_422) //dismiss
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
        [self contentsDissmissColorEffect:_woman422View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_422 = false;
        
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
        [self contentsSelectColorEffect:_woman422View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_422 = true;
    }
}

- (IBAction)woman423Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"423";
    int price = 0;
    _contentLabel.text=@"담배는 연령 확인 후 현장 결제";
    if(bool_423) //dismiss
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
        [self contentsDissmissColorEffect:_woman423View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_423 = false;
        
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
        [self contentsSelectColorEffect:_woman423View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_423 = true;
    }
}

- (IBAction)woman424Button:(UIButton *)sender {
    NSString *orderCode = [[NSString alloc]init];
    orderCode = @"424";
    int price = 100;
    _contentLabel.text=@"서비스 1개 이상 신청시 라이터 배달 가능";
    if(bool_424) //dismiss
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
        [self contentsDissmissColorEffect:_woman424View];
        _zeroLabel.text = [self calculate:_zeroLabel.text over:-price];
        bool_424 = false;
        
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
        [self contentsSelectColorEffect:_woman424View];
        
        _zeroLabel.text = [self calculate:_zeroLabel.text over:price];
        bool_424 = true;
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
            if([shoe1_codeArray[0] hasPrefix:@"2"])
            {
                [self normalPremiumColorEffect:1];
            }
            else if([shoe1_codeArray[0] hasPrefix:@"4"])
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
            if([shoe2_codeArray[0] hasPrefix:@"2"])
            {
                [self normalPremiumColorEffect:1];
            }
            else if([shoe2_codeArray[0] hasPrefix:@"4"])
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
            if([shoe3_codeArray[0] hasPrefix:@"2"])
            {
                [self normalPremiumColorEffect:1];
            }
            else if([shoe3_codeArray[0] hasPrefix:@"4"])
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
            if([shoe4_codeArray[0] hasPrefix:@"2"])
            {
                [self normalPremiumColorEffect:1];
            }
            else if([shoe4_codeArray[0] hasPrefix:@"4"])
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
        if([temp_code isEqual:@"200"])
        {
            [self contentsSelectColorEffect:_woman200View];
            bool_200=true;
        }
        else if([temp_code isEqual:@"201"])
        {
            [self contentsSelectColorEffect:_woman201View];
            bool_201=true;
        }
        else if([temp_code isEqual:@"202"])
        {
            [self contentsSelectColorEffect:_woman202View];
            bool_202=true;
        }
        else if([temp_code isEqual:@"203"])
        {
            [self contentsSelectColorEffect:_woman203View];
            bool_203=true;
        }
        else if([temp_code isEqual:@"204"])
        {
            [self contentsSelectColorEffect:_woman204View];
            bool_204=true;
        }
        else if([temp_code isEqual:@"205"])
        {
            [self contentsSelectColorEffect:_woman205View];
            bool_205=true;
        }
        else if([temp_code isEqual:@"206"])
        {
            [self contentsSelectColorEffect:_woman206View];
            bool_206=true;
        }
        else if([temp_code isEqual:@"207"])
        {
            [self contentsSelectColorEffect:_woman207View];
            bool_207=true;
        }
        else if([temp_code isEqual:@"208"])
        {
            [self contentsSelectColorEffect:_woman208View];
            bool_208=true;
        }
        else if([temp_code isEqual:@"209"])
        {
            [self contentsSelectColorEffect:_woman209View];
            bool_209=true;
        }
        else if([temp_code isEqual:@"210"])
        {
            [self contentsSelectColorEffect:_woman210View];
            bool_210=true;
        }
        else if([temp_code isEqual:@"211"])
        {
            [self contentsSelectColorEffect:_woman211View];
            bool_211=true;
        }
        else if([temp_code isEqual:@"212"])
        {
            [self contentsSelectColorEffect:_woman212View];
            bool_212=true;
        }
        else if([temp_code isEqual:@"400"])
        {
            [self contentsSelectColorEffect:_woman400View];
            bool_400=true;
        }
        else if([temp_code isEqual:@"401"])
        {
            [self contentsSelectColorEffect:_woman401View];
            bool_401=true;
        }
        else if([temp_code isEqual:@"402"])
        {
            [self contentsSelectColorEffect:_woman402View];
            bool_402=true;
        }
        else if([temp_code isEqual:@"403"])
        {
            [self contentsSelectColorEffect:_woman403View];
            bool_403=true;
        }
        else if([temp_code isEqual:@"404"])
        {
            [self contentsSelectColorEffect:_woman404View];
            bool_404=true;
        }
        else if([temp_code isEqual:@"405"])
        {
            [self contentsSelectColorEffect:_woman405View];
            bool_405=true;
        }
        else if([temp_code isEqual:@"406"])
        {
            [self contentsSelectColorEffect:_woman406View];
            bool_406=true;
        }
        else if([temp_code isEqual:@"407"])
        {
            [self contentsSelectColorEffect:_woman407View];
            bool_407=true;
        }
        else if([temp_code isEqual:@"408"])
        {
            [self contentsSelectColorEffect:_woman408View];
            bool_408=true;
        }
        else if([temp_code isEqual:@"409"])
        {
            [self contentsSelectColorEffect:_woman409View];
            bool_409=true;
        }
        else if([temp_code isEqual:@"410"])
        {
            [self contentsSelectColorEffect:_woman410View];
            bool_410=true;
        }
        else if([temp_code isEqual:@"411"])
        {
            [self contentsSelectColorEffect:_woman411View];
            bool_411=true;
        }
        else if([temp_code isEqual:@"412"])
        {
            [self contentsSelectColorEffect:_woman412View];
            bool_412=true;
        }
        else if([temp_code isEqual:@"413"])
        {
            [self contentsSelectColorEffect:_woman413View];
            bool_413=true;
        }
        else if([temp_code isEqual:@"414"])
        {
            [self contentsSelectColorEffect:_woman414View];
            bool_414=true;
        }
        else if([temp_code isEqual:@"415"])
        {
            [self contentsSelectColorEffect:_woman415View];
            bool_415=true;
        }
        else if([temp_code isEqual:@"416"])
        {
            [self contentsSelectColorEffect:_woman416View];
            bool_416=true;
        }
        else if([temp_code isEqual:@"417"])
        {
            [self contentsSelectColorEffect:_woman417View];
            bool_417=true;
        }
        else if([temp_code isEqual:@"418"])
        {
            [self contentsSelectColorEffect:_woman418View];
            bool_418=true;
        }
        else if([temp_code isEqual:@"419"])
        {
            [self contentsSelectColorEffect:_woman419View];
            bool_419=true;
        }
        else if([temp_code isEqual:@"420"])
        {
            [self contentsSelectColorEffect:_woman420View];
            bool_420=true;
        }
        else if([temp_code isEqual:@"421"])
        {
            [self contentsSelectColorEffect:_woman421View];
            bool_421=true;
        }
        else if([temp_code isEqual:@"422"])
        {
            [self contentsSelectColorEffect:_woman422View];
            bool_422=true;
        }
        else if([temp_code isEqual:@"423"])
        {
            [self contentsSelectColorEffect:_woman423View];
            bool_423=true;
        }
        else if([temp_code isEqual:@"424"])
        {
            [self contentsSelectColorEffect:_woman424View];
            bool_424=true;
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
        if([temp_code isEqualToString:@"200"])
        {
            price += 0;
        }
        else if([temp_code isEqualToString:@"201"])
        {
            price += 5000;
        }
        else if([temp_code isEqualToString:@"202"])
        {
            price += 5000;
        }
        else if([temp_code isEqualToString:@"203"])
        {
            price += 7000;
        }
        else if([temp_code isEqualToString:@"204"])
        {
            price += 15000;
        }
        else if([temp_code isEqualToString:@"205"])
        {
            price += 15000;
        }
        else if([temp_code isEqualToString:@"206"])
        {
            price += 15000;
        }
        else if([temp_code isEqualToString:@"207"])
        {
            price += 22000;
        }
        else if([temp_code isEqualToString:@"208"])
        {
            price += 15000;
        }
        else if([temp_code isEqualToString:@"209"])
        {
            price += 4000;
        }
        else if([temp_code isEqualToString:@"210"])
        {
            price += 0;
        }
        else if([temp_code isEqualToString:@"211"])
        {
            price += 0;
        }
        else if([temp_code isEqualToString:@"212"])
        {
            price += 100;
        }
        else if([temp_code isEqualToString:@"400"])
        {
            price += 0;
        }
        else if([temp_code isEqualToString:@"401"])
        {
            price += 20000;
        }
        else if([temp_code isEqualToString:@"402"])
        {
            price += 30000;
        }
        else if([temp_code isEqualToString:@"403"])
        {
            price += 10000;
        }
        else if([temp_code isEqualToString:@"404"])
        {
            price += 15000;
        }
        else if([temp_code isEqualToString:@"405"])
        {
            price += 20000;
        }
        else if([temp_code isEqualToString:@"406"])
        {
            price += 30000;
        }
        else if([temp_code isEqualToString:@"407"])
        {
            price += 30000;
        }
        else if([temp_code isEqualToString:@"408"])
        {
            price += 30000;
        }
        else if([temp_code isEqualToString:@"409"])
        {
            price += 40000;
        }
        else if([temp_code isEqualToString:@"410"])
        {
            price += 35000;
        }
        else if([temp_code isEqualToString:@"411"])
        {
            price += 15000;
        }
        else if([temp_code isEqualToString:@"412"])
        {
            price += 75000;
        }
        else if([temp_code isEqualToString:@"413"])
        {
            price += 110000;
        }
        else if([temp_code isEqualToString:@"414"])
        {
            price += 15000;
        }
        else if([temp_code isEqualToString:@"415"])
        {
            price += 15000;
        }
        else if([temp_code isEqualToString:@"416"])
        {
            price += 30000;
        }
        else if([temp_code isEqualToString:@"417"])
        {
            price += 25000;
        }
        else if([temp_code isEqualToString:@"418"])
        {
            price += 65000;
        }
        else if([temp_code isEqualToString:@"419"])
        {
            price += 65000;
        }
        else if([temp_code isEqualToString:@"420"])
        {
            price += 20000;
        }
        else if([temp_code isEqualToString:@"421"])
        {
            price += 4000;
        }
        else if([temp_code isEqualToString:@"422"])
        {
            price += 0;
        }
        else if([temp_code isEqualToString:@"423"])
        {
            price += 0;
        }
        else if([temp_code isEqualToString:@"424"])
        {
            price += 100;
        }
        
    }
    return price;
}

// 컨텐츠들이 선택된 것들을 모두 해제시켜준다.
- (void)clearContentsSelectedColor
{
    [self contentsDissmissColorEffect:_woman200View];
    [self contentsDissmissColorEffect:_woman201View];
    [self contentsDissmissColorEffect:_woman202View];
    [self contentsDissmissColorEffect:_woman203View];
    [self contentsDissmissColorEffect:_woman204View];
    [self contentsDissmissColorEffect:_woman205View];
    [self contentsDissmissColorEffect:_woman206View];
    [self contentsDissmissColorEffect:_woman207View];
    [self contentsDissmissColorEffect:_woman208View];
    [self contentsDissmissColorEffect:_woman209View];
    [self contentsDissmissColorEffect:_woman210View];
    [self contentsDissmissColorEffect:_woman211View];
    [self contentsDissmissColorEffect:_woman212View];
    
    [self contentsDissmissColorEffect:_woman400View];
    [self contentsDissmissColorEffect:_woman401View];
    [self contentsDissmissColorEffect:_woman402View];
    [self contentsDissmissColorEffect:_woman403View];
    [self contentsDissmissColorEffect:_woman404View];
    [self contentsDissmissColorEffect:_woman405View];
    [self contentsDissmissColorEffect:_woman406View];
    [self contentsDissmissColorEffect:_woman407View];
    [self contentsDissmissColorEffect:_woman408View];
    [self contentsDissmissColorEffect:_woman409View];
    [self contentsDissmissColorEffect:_woman410View];
    [self contentsDissmissColorEffect:_woman411View];
    [self contentsDissmissColorEffect:_woman412View];
    [self contentsDissmissColorEffect:_woman413View];
    [self contentsDissmissColorEffect:_woman414View];
    [self contentsDissmissColorEffect:_woman415View];
    [self contentsDissmissColorEffect:_woman416View];
    [self contentsDissmissColorEffect:_woman417View];
    [self contentsDissmissColorEffect:_woman418View];
    [self contentsDissmissColorEffect:_woman419View];
    [self contentsDissmissColorEffect:_woman420View];
    [self contentsDissmissColorEffect:_woman421View];
    [self contentsDissmissColorEffect:_woman422View];
    [self contentsDissmissColorEffect:_woman423View];
    [self contentsDissmissColorEffect:_woman424View];
    
    bool_200 = false;
    bool_201 = false;
    bool_202 = false;
    bool_203 = false;
    bool_204 = false;
    bool_205 = false;
    bool_206 = false;
    bool_207 = false;
    bool_208 = false;
    bool_209 = false;
    bool_210 = false;
    bool_211 = false;
    bool_212 = false;
    
    bool_400 = false;
    bool_401 = false;
    bool_402 = false;
    bool_403 = false;
    bool_404 = false;
    bool_405 = false;
    bool_406 = false;
    bool_407 = false;
    bool_408 = false;
    bool_409 = false;
    bool_410 = false;
    bool_410 = false;
    bool_411 = false;
    bool_412 = false;
    bool_413 = false;
    bool_414 = false;
    bool_415 = false;
    bool_416 = false;
    bool_417 = false;
    bool_418 = false;
    bool_419 = false;
    bool_420 = false;
    bool_421 = false;
    bool_422 = false;
    bool_423 = false;
    bool_424 = false;
    
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
