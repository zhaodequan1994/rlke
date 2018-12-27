//
//  MyFansViewController.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/12.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "MyFansViewController.h"

//Cells
#import "MyFollowTableViewCell.h"

//Controllers
#import "MyFansCenterViewController.h"

@interface MyFansViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;

@end

@implementation MyFansViewController

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = RGB(243, 243, 243);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"MyFollowTableViewCell" bundle:nil] forCellReuseIdentifier:@"MyFollowTableViewCell"];
        
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
    
    self.title = @"我的粉丝";
}

-(void)initializeAppearance{
    
    [self.view addSubview:self.tableView];
    
}

-(void)initializeDataSource{
    
    
}
#pragma mark  **********  tableView  delegate  ********

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 70;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MyFollowTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MyFollowTableViewCell" forIndexPath:indexPath];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.hidesBottomBarWhenPushed = YES;
    
    MyFansCenterViewController * mfvc = [[MyFansCenterViewController alloc] init];
    
    [self.navigationController pushViewController:mfvc animated:YES];
}

@end
