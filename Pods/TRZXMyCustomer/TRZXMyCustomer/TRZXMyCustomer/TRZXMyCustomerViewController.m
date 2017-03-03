//
//  TRZXMyCustomerViewController.m
//  TRZXMyCustomer
//
//  Created by Rhino on 2017/2/27.
//  Copyright © 2017年 Rhino. All rights reserved.
//

#import "TRZXMyCustomerViewController.h"
#import "TRMyCustomerCell.h"
#import "TRMyCustomerModel.h"
#import "TRZXCustomerViewModel.h"

#import "UIDevice+rh_Frame.h"
#import <TRZXDVSwitch/TRZXDVSwitch.h>
#import <MJExtension/MJExtension.h>
#import <TRZXKit/TRZXKit.h>
#import <MJRefresh/MJRefresh.h>
#import <SDWebImage/UIImageView+WebCache.h>


#define MC_SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define MC_SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@interface TRZXMyCustomerViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)NSMutableArray *dataSource;

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)TRZXDVSwitch *switcher;

@property (nonatomic,copy)NSString *totalPage;
@property (nonatomic,copy)NSString *pageNO;
@property (nonatomic,copy)NSString *type;

@property (nonatomic,copy)NSString *countRegis;//注册
@property (nonatomic,copy)NSString *countVips;//会员
@property (nonatomic,copy)NSString *countAuthers;//认证
@property (nonatomic,copy)NSString *countAllCustomers;

@property (nonatomic,strong)UIImageView *noneImageView;
@end

@implementation TRZXMyCustomerViewController

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loadData) name:RCDUmengNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self addUI];
    self.type = @"1";
    [self loadData];
}

- (void)addUI
{
    self.title = self.titleString;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TRMyCustomerCell" bundle:nil] forCellReuseIdentifier:@"MyCustomerCell"];
    
    [self.view addSubview:self.tableView];
    //上拉加载
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self loadMoreData];
    }];
    //下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadData];
    }];
    
}

- (UIView *)headeView{
    UIView *view = nil;
    
    if ([UIDevice rh_iPhonesModel]==iPhone5) {
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 64, MC_SCREEN_HEIGHT , 53)];
    }else{
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 64, MC_SCREEN_WIDTH, 63)];
    }
    
    view.backgroundColor = [UIColor colorWithRed:240.0/255.0 green:239.0/255.0 blue:244.0/255.0 alpha:1];
    
    [view addSubview:self.switcher];
    NSString *regist = [NSString stringWithFormat:@"%@\n未认证用户",self.countRegis];
    NSString *auther = [NSString stringWithFormat:@"%@\n认证用户",self.countAuthers];
    NSString *vip = [NSString stringWithFormat:@"%@\n孵化会员",self.countVips];
    NSArray *itemArr = @[regist,auther,vip];
    [self.switcher changeLabelTextWithArrayString:itemArr];
    
    return view;
}

- (void)noneImageViewClick:(UITapGestureRecognizer *)tap{
    
}
#pragma mark - 数据请求------------------------
- (void)loadDataWithIndex:(NSInteger)index
{
    if (self.dataSource.count > 0) {
        [self.dataSource removeAllObjects];
    }
    [self.tableView reloadData];
    switch (index) {
        case 0://注册用户
            self.type = @"1";
            break;
        case 1://认证用户
            self.type = @"2";
            break;
        case 2://孵化
            self.type = @"4";
            break;
            
        default:
            break;
    }
    
    [self loadData];
}

- (void)loadData{
    self.pageNO = @"1";
    self.tableView.mj_footer.hidden = YES;
    
    [TRZXCustomerViewModel myCustomerWithType:self.type pageNo:self.pageNO success:^(id json) {
        
        NSDictionary *dict = json;
        if ([dict[@"status_code"] isEqualToString:@"200"]) {
            
            if (self.dataSource.count > 0) {
                [self.dataSource removeAllObjects];
            }
            self.countVips = dict[@"countVips"];
            self.countRegis = dict[@"countRegis"];
            self.countAuthers = dict[@"countAuthers"];
            self.totalPage = dict[@"totalPage"];
            self.countAllCustomers = dict[@"countAllCustomers"];
            
            NSArray *dataArray = dict[@"data"];
            if ( dataArray.count < 1) {
                
                [self.view addSubview:self.noneImageView];
                [self.view addSubview:[self headeView]];
            }else{
                
                [self.noneImageView removeFromSuperview];
                _noneImageView = nil;
                [self paseDataWithDict:dict];
                [self.view addSubview:[self headeView]];
            }
        }
        
        [self.tableView.mj_header endRefreshing];
        self.tableView.mj_footer.hidden = NO;
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        [self.tableView.mj_header endRefreshing];
        self.tableView.mj_footer.hidden = NO;
        
    }];
    
}
- (void)loadMoreData{
    
    NSInteger page =  [self.pageNO integerValue];
    page ++;
    
    if (page > [self.totalPage integerValue]) {
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
        return;
    }
    self.pageNO = [NSString stringWithFormat:@"%ld",(long)page];
    [TRZXCustomerViewModel myCustomerWithType:self.type pageNo:self.pageNO success:^(id json) {
        
        NSDictionary *dict = json;
        if ([dict[@"status_code"] isEqualToString:@"200"]) {
            [self paseDataWithDict:dict];
        }
        
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        
        self.tableView.mj_footer.hidden = NO;
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        [self.tableView.mj_footer endRefreshing];
        self.tableView.mj_footer.hidden = NO;
        
    }];
    
}

- (void)paseDataWithDict:(NSDictionary *)dict{
    
    NSArray *dataArray = dict[@"data"];
    NSArray *modelArray = [TRMyCustomerModel mj_objectArrayWithKeyValuesArray:dataArray];
    [self.dataSource addObjectsFromArray:modelArray];
}
#pragma mark - TableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TRMyCustomerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCustomerCell" forIndexPath:indexPath];
    [self setupCellModel:self.dataSource[indexPath.row] andCell:cell];
    return cell;
}
- (void)setupCellModel:(TRMyCustomerModel *)model andCell:(TRMyCustomerCell *)cell{
    
    [cell.headImage sd_setImageWithURL:[NSURL URLWithString:model.headImg] placeholderImage:[UIImage imageNamed:@"展位图"]];
    cell.nameLabel.text = model.name;
    
    NSString *createDate = [self timeWithTimeIntervalString:model.createDate];
    
    if ([self.type isEqualToString:@"1"]) {
        cell.subTitleLabel.text = @"";
    }else if ([self.type isEqualToString:@"2"]){
        cell.subTitleLabel.text = [NSString stringWithFormat:@"%@,%@",model.company,model.post];
    }else if ([self.type isEqualToString:@"4"]){
        cell.subTitleLabel.text = [NSString stringWithFormat:@"%@,%@",model.company,model.post];
    }
    cell.registerTimeLabel.text = [NSString stringWithFormat:@"注册时间:%@",createDate];
}
- (NSString *)timeWithTimeIntervalString:(NSString *)timeString
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy年MM月dd日"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]/ 1000.0];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //行被选中后，自动变回反选状态的方法
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    TRMyCustomerModel *model = self.dataSource[indexPath.row];
    [self transToPersonalWithMid:model.ID];
    
}

#pragma mark - 跳转个人主页

- (void)transToPersonalWithMid:(NSString *)mid
{
    
    
//    if (![NSObject showCertificationTip:self]) {
//        
//        PersonalInformationVC * studentPersonal=[[PersonalInformationVC alloc]init];
//        studentPersonal.midStrr = mid;
//        studentPersonal.otherStr = @"1";
//        [self.navigationController pushViewController:studentPersonal animated:true];
//    }
    
}

- (void)dealloc{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setRadius:(CGFloat)cornerRadius view:(UIView *)view{
    view.layer.cornerRadius = cornerRadius;
    view.layer.masksToBounds = YES;
    
    // 栅格化 - 提高性能
    // 设置栅格化后，图层会被渲染成图片，并且缓存，再次使用时，不会重新渲染
    view.layer.rasterizationScale = [UIScreen mainScreen].scale;
    view.layer.shouldRasterize = YES;
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark - setter/getter------------------------------------------------------------------------
- (UITableView *)tableView
{
    if (!_tableView) {
        if ([UIDevice rh_iPhonesModel]==iPhone5) {
            _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,64+53, MC_SCREEN_WIDTH, MC_SCREEN_HEIGHT -64-53) style:UITableViewStylePlain];
        }else{
            _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,64+63, MC_SCREEN_WIDTH, MC_SCREEN_HEIGHT -64-63) style:UITableViewStylePlain];
        }
        
        _tableView.backgroundColor = [UIColor colorWithRed:240.0/255.0 green:239.0/255.0 blue:244.0/255.0 alpha:1];
        _tableView.delegate =self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 105;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.sectionIndexBackgroundColor=[UIColor clearColor];
        _tableView.sectionIndexColor = [UIColor blackColor];
    }
    return _tableView;
}
- (UIImageView *)noneImageView{
    if (_noneImageView == nil) {
        if([UIDevice rh_iPhonesModel]==iPhone5){
            _noneImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0,64+54, MC_SCREEN_WIDTH, MC_SCREEN_HEIGHT -64-54)];
        }else{
            _noneImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0,64+64, MC_SCREEN_WIDTH, MC_SCREEN_HEIGHT -64-64)];
        }
        _noneImageView.image = [UIImage imageNamed:@"tr_nocontent"];
        _noneImageView.contentMode = UIViewContentModeScaleAspectFill;
        _noneImageView.layer.masksToBounds = YES;
        _noneImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(noneImageViewClick:)];
        [_noneImageView addGestureRecognizer:tap];
    }
    return _noneImageView;
}

- (NSMutableArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [[NSMutableArray alloc]init];
    }
    return _dataSource;
}
//开关 切换切面
- (TRZXDVSwitch *)switcher
{
    if (!_switcher) {
        
        NSString *regist = [NSString stringWithFormat:@"%@\n未认证用户",self.countRegis];
        NSString *auther = [NSString stringWithFormat:@"%@\n认证用户",self.countAuthers];
        NSString *vip = [NSString stringWithFormat:@"%@\n孵化会员",self.countVips];
        NSArray *itemArr = @[regist,auther,vip];
        
        _switcher = [[TRZXDVSwitch alloc] initWithStringsArray:itemArr];
        if ([UIDevice rh_iPhonesModel]==iPhone5) {
            _switcher.frame = CGRectMake(10, 10, MC_SCREEN_WIDTH -20, 30);
         [self setRadius:14 view:_switcher];
        }else{
            _switcher.frame = CGRectMake(10, 10, MC_SCREEN_WIDTH -20, 41);
            [self setRadius:19 view:_switcher];
        }
        
        
        _switcher.sliderOffset = 1.0;
        _switcher.font = [UIFont systemFontOfSize:15];
        _switcher.backgroundColor = [UIColor whiteColor];
        _switcher.sliderColor = [UIColor colorWithRed:215.0/255.0 green:0/255.0 blue:15.0/255.0 alpha:1];
        _switcher.labelTextColorInsideSlider = [UIColor whiteColor];
        _switcher.labelTextColorOutsideSlider = [UIColor lightGrayColor];
        
        __weak __typeof(self)weakSelf = self;
        [self.switcher setPressedHandler:^(NSUInteger index) {
            
            [weakSelf loadDataWithIndex:index];
        }];
        
    }
    return _switcher;
}

@end
