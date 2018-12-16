//
//  RechargeBalanceViewController.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/14.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "RechargeBalanceViewController.h"

//Cells
#import "BalanceConsumeTitleTableViewCell.h"
#import "RechargeAndWithDrawHeaderTableViewCell.h"
#import "BalanceListTableViewCell.h"

@interface RechargeBalanceViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;

@end

@implementation RechargeBalanceViewController

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = RGB(255, 255, 255);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"BalanceConsumeTitleTableViewCell" bundle:nil] forCellReuseIdentifier:@"BalanceConsumeTitleTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"BalanceListTableViewCell" bundle:nil] forCellReuseIdentifier:@"BalanceListTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"RechargeAndWithDrawHeaderTableViewCell" bundle:nil] forCellReuseIdentifier:@"RechargeAndWithDrawHeaderTableViewCell"];
        
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
    
    self.title = self.rechargeModel.title;

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
        
        if (self.rechargeModel.tipsText.length > 0) {
            
            return 395;

        }else{
            
            return 380;

        }
        
    }else if (indexPath.row == 1){
        
        return 56;
        
    }
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        RechargeAndWithDrawHeaderTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"RechargeAndWithDrawHeaderTableViewCell" forIndexPath:indexPath];
        
        cell.fatheController = self;
        
        [cell addContntModel:self.rechargeModel];
        
        return cell;
        
    }else if (indexPath.row == 1){
        
        BalanceConsumeTitleTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"BalanceConsumeTitleTableViewCell" forIndexPath:indexPath];
        
        [cell addTitleString:self.rechargeModel.title];

        return cell;
    }
    
    BalanceListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"BalanceListTableViewCell" forIndexPath:indexPath];
    
    return cell;
}

@end
