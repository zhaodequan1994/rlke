//
//  MyBalanceViewController.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/11.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "MyBalanceViewController.h"

//Cells
#import "BalanceConsumeTitleTableViewCell.h"
#import "BalanceListTableViewCell.h"
#import "BalanceHeaderTableViewCell.h"

@interface MyBalanceViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;

@end

@implementation MyBalanceViewController

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT ) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = RGB(243, 243, 243);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"BalanceConsumeTitleTableViewCell" bundle:nil] forCellReuseIdentifier:@"BalanceConsumeTitleTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"BalanceListTableViewCell" bundle:nil] forCellReuseIdentifier:@"BalanceListTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"BalanceHeaderTableViewCell" bundle:nil] forCellReuseIdentifier:@"BalanceHeaderTableViewCell"];
        
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
    
    self.title = @"我的余额";
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
    
    if (indexPath.row == 0) {
        
        return 251;
        
    }else if (indexPath.row == 1){
        
        return 56;
        
    }
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        BalanceHeaderTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"BalanceHeaderTableViewCell" forIndexPath:indexPath];
        
        cell.fatherController = self;
        
        return cell;
        
    }else if (indexPath.row == 1){
        
        BalanceConsumeTitleTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"BalanceConsumeTitleTableViewCell" forIndexPath:indexPath];
        
        [cell addTitleString:NO];
        
        return cell;
       
    }
    
    BalanceListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"BalanceListTableViewCell" forIndexPath:indexPath];
    
    return cell;
}

@end
