//
//  IssureTrendViewController.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/26.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "IssureTrendViewController.h"

//Cells
#import "IssureTrendImagesTableViewCell.h"
#import "IssuePayTypeTableViewCell.h"
#import "IssureTrendInputTableViewCell.h"
#import "IssureTrendTipTableViewCell.h"

@interface IssureTrendViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) UIView * bottomView;
@property (nonatomic,strong) UIButton * issureBtn;


@end

@implementation IssureTrendViewController

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 60) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = RGB(247, 247, 247);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"IssureTrendImagesTableViewCell" bundle:nil] forCellReuseIdentifier:@"IssureTrendImagesTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"IssuePayTypeTableViewCell" bundle:nil] forCellReuseIdentifier:@"IssuePayTypeTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"IssureTrendInputTableViewCell" bundle:nil] forCellReuseIdentifier:@"IssureTrendInputTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"IssureTrendTipTableViewCell" bundle:nil] forCellReuseIdentifier:@"IssureTrendTipTableViewCell"];

    }
    return _tableView;
}
-(UIView *)bottomView{
    
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 60, SCREEN_WIDTH, 60)];
        _bottomView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomView;
}

-(UIButton *)issureBtn{
    
    if (!_issureBtn) {
        _issureBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 8, self.bottomView.frame.size.width - 30, 44)];
        _issureBtn.layer.masksToBounds = YES;
        _issureBtn.layer.cornerRadius = _issureBtn.frame.size.height/2;
        _issureBtn.backgroundColor = RGB(255, 84, 85);
        [_issureBtn setTitle:@"立即发布" forState:UIControlStateNormal];
        _issureBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_issureBtn setTitleColor:RGB(255, 255, 255) forState:UIControlStateNormal];
        [_issureBtn addTarget:self action:@selector(issureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _issureBtn;
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
    
    self.title = @"发布信息";
}

-(void)initializeAppearance{
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];
    [self.bottomView addSubview:self.issureBtn];
    
}

-(void)initializeDataSource{
    
    
    
}
#pragma mark  **********  tableView  delegate  ********

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        return 174;
        
    }else if (indexPath.row == 1){
        
        return 55;

    }else if (indexPath.row == 2){
        
        return 45;

    }
    return 350;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        IssureTrendInputTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"IssureTrendInputTableViewCell" forIndexPath:indexPath];
        
        return cell;
        
    }else if (indexPath.row == 1){
        
        IssuePayTypeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"IssuePayTypeTableViewCell" forIndexPath:indexPath];
        
        return cell;
        
    }else if (indexPath.row == 2){
        
        IssureTrendTipTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"IssureTrendTipTableViewCell" forIndexPath:indexPath];
        
        return cell;
    }
    
    IssureTrendImagesTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"IssureTrendImagesTableViewCell" forIndexPath:indexPath];
    
    return cell;
}

#pragma mark  --------  event  click  -------
-(void)issureBtnClick{
    
    
}
@end
