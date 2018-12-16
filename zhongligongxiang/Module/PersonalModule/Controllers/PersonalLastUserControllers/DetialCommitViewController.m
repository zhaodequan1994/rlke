//
//  DetialCommitViewController.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/16.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "DetialCommitViewController.h"

//Cells
#import "CommiitTableViewCell.h"
#import "OrderDetialTableViewCell.h"

//View
#import "CommitSuccessView.h"

@interface DetialCommitViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) UIButton * sureBtn;
@property (nonatomic,strong) UIView * bottomView;

@end

@implementation DetialCommitViewController

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 60) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = RGB(243, 243, 243);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"OrderDetialTableViewCell" bundle:nil] forCellReuseIdentifier:@"OrderDetialTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"CommiitTableViewCell" bundle:nil] forCellReuseIdentifier:@"CommiitTableViewCell"];
    }
    return _tableView;
}

-(UIView *)bottomView{
    
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 124, SCREEN_WIDTH, 60)];
        _bottomView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomView;
}

-(UIButton *)sureBtn{
    
    if (!_sureBtn) {
        _sureBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 8, 345, 44)];
        _sureBtn.layer.masksToBounds = YES;
        _sureBtn.layer.cornerRadius = _sureBtn.frame.size.height/2;
        [_sureBtn setTitle:@"确认评价" forState:UIControlStateNormal];
        _sureBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_sureBtn setTitleColor:RGB(255, 255, 255) forState:UIControlStateNormal];
        _sureBtn.backgroundColor = RGB(255, 84, 85);
        [_sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureBtn;
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
    
    self.title = @"订单详情";
    
}

-(void)initializeAppearance{
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];
    [self.bottomView addSubview:self.sureBtn];

}

-(void)initializeDataSource{
    
    
}

#pragma mark  **********  tableView  delegate  ********

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        return 251;
    }
    
    return 271;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        OrderDetialTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"OrderDetialTableViewCell" forIndexPath:indexPath];
        
        return cell;
        
    }
    
    CommiitTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CommiitTableViewCell" forIndexPath:indexPath];
    
    return cell;
    
}


#pragma mark     -------  event  click  -------

-(void)sureBtnClick{
    
    CommitSuccessView *  commitSuccessView = [[CommitSuccessView alloc] initWithFrame:SCREEN_RECT];
    [commitSuccessView commitSuccessShow];
    
}

@end
