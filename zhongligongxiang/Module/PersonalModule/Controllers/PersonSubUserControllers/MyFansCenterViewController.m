//
//  MyFansCenterViewController.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/24.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "MyFansCenterViewController.h"

//Cells
#import "PersonalCenterTableViewCell1.h"

@interface MyFansCenterViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UIView * headerView;
@property (nonatomic,strong) UIImageView * backImageView;
@property (nonatomic,strong) UIButton * backBtn;
@property (nonatomic,strong) UIView * userBackView;
@property (nonatomic,strong) UIImageView * userImageView;
@property (nonatomic,strong) UILabel * userNameLabel;
@property (nonatomic,strong) UIImageView * bottomImageView;


@property (nonatomic,strong) UITableView * tableView;

@end

@implementation MyFansCenterViewController

-(UIView *)headerView{
    
    if (!_headerView) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 170)];
        _headerView.backgroundColor = [UIColor redColor];
        CAGradientLayer *gl = [CAGradientLayer layer];
        gl.frame = CGRectMake(0,0,SCREEN_WIDTH,_headerView.frame.size.height);
        gl.startPoint = CGPointMake(0, 0);
        gl.endPoint = CGPointMake(1, 1);
        gl.colors = @[(__bridge id)RGB(255, 149, 85).CGColor,(__bridge id)RGB(255, 84, 127).CGColor];
        gl.locations = @[@(0.0),@(1.0)];
        
        [_headerView.layer addSublayer:gl];
    }
    return _headerView;
}

-(UIImageView *)backImageView{
    
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(23, 34, 9, 14)];
        _backImageView.image = [UIImage imageNamed:@"Personal_center_back"];
    }
    return _backImageView;
}

-(UIButton *)backBtn{
    
    if (!_backBtn) {
        _backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, 60, 50)];
        [_backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}

-(UIView *)userBackView{
    
    if (!_userBackView) {
        _userBackView = [[UIView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 55)/2, 41, 55, 55)];
        _userBackView.layer.masksToBounds = YES;
        _userBackView.layer.cornerRadius = _userBackView.frame.size.height/2;
        _userBackView.backgroundColor = [UIColor whiteColor];
    }
    return _userBackView;
}

-(UIImageView *)userImageView{
    
    if (!_userImageView) {
        _userImageView = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 51)/2, 43, 51, 51)];
        _userImageView.image = [UIImage imageNamed:@"1.png"];
        _userImageView.layer.masksToBounds = YES;
        _userImageView.layer.cornerRadius = _userImageView.frame.size.height/2;

    }
    return _userImageView;
}

-(UILabel *)userNameLabel{
    
    if (!_userNameLabel) {
        _userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, self.userBackView.frame.origin.y + self.userBackView.frame.size.height + 8, SCREEN_WIDTH - 30, 15)];
        [_userNameLabel SetLabelText:@"超级小玛丽Anne" textColor:RGB(255, 255, 255) textFont:16 textAlignment:NSTextAlignmentCenter];
    }
    return _userNameLabel;
}
-(UIImageView *)bottomImageView{
    
    if (!_bottomImageView) {
        _bottomImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.headerView.frame.size.height - 36, SCREEN_WIDTH, 36)];
        _bottomImageView.image = [UIImage imageNamed:@""];
        
    }
    return _bottomImageView;
}


-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.headerView.frame.origin.y + self.headerView.frame.size.height - 64, SCREEN_WIDTH, SCREEN_HEIGHT - self.headerView.frame.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = RGB(243, 243, 243);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"PersonalCenterTableViewCell1" bundle:nil] forCellReuseIdentifier:@"PersonalCenterTableViewCell1"];
        
    }
    return _tableView;
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
}
-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeBaseNavigationAppearance];
    [self initializeAppearance];
    [self initializeDataSource];
    
}

-(void)initializeBaseNavigationAppearance{
    
}

-(void)initializeAppearance{
    
    [[PublicMethod getWindow] addSubview:self.headerView];
    [self.headerView addSubview:self.backImageView];
    [self.headerView addSubview:self.backBtn];
    [self.headerView addSubview:self.userBackView];
    [self.headerView addSubview:self.userImageView];
    [self.headerView addSubview:self.userNameLabel];
    [self.headerView addSubview:self.bottomImageView];

    [self.view addSubview:self.tableView];
}

-(void)initializeDataSource{
    
    
}

#pragma mark  **********  tableView  delegate  ********

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 445;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PersonalCenterTableViewCell1 * cell = [tableView dequeueReusableCellWithIdentifier:@"PersonalCenterTableViewCell1" forIndexPath:indexPath];
    
    return cell;
}

#pragma mark   ---------  event  click  -------

-(void)backBtnClick{
    
    [self.headerView removeFromSuperview];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
