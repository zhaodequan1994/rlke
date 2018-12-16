//
//  ResetSecretViewController.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "ResetSecretViewController.h"

//Cells
#import "LoginTitleTableViewCell.h"
#import "LoginInputTableViewCell.h"
#import "PhoneCodeTableViewCell.h"
#import "ResertSureTableViewCell.h"

@interface ResetSecretViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;

@end

@implementation ResetSecretViewController

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = RGB(255, 255, 255);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        if (SCREEN_HEIGHT < 470) {
            _tableView.scrollEnabled = YES;
        }else{
            _tableView.scrollEnabled = NO;
        }
        [_tableView registerNib:[UINib nibWithNibName:@"LoginInputTableViewCell" bundle:nil] forCellReuseIdentifier:@"LoginInputTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"LoginTitleTableViewCell" bundle:nil] forCellReuseIdentifier:@"LoginTitleTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"ResertSureTableViewCell" bundle:nil] forCellReuseIdentifier:@"ResertSureTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"PhoneCodeTableViewCell" bundle:nil] forCellReuseIdentifier:@"PhoneCodeTableViewCell"];
        
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeBaseNavigationAppearance];
    [self initializeAppearance];
    [self initializeDataSource];
    
}

-(void)initializeBaseNavigationAppearance{
    
    self.title = @"重置密码";
    
}

-(void)initializeAppearance{
    
    [self.view addSubview:self.tableView];
}

-(void)initializeDataSource{
    
    
}

#pragma mark  **********  tableView  delegate  ********

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        return 140;
    }else if (indexPath.row == 4){
        
        return 150;
    }
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        LoginTitleTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"LoginTitleTableViewCell" forIndexPath:indexPath];
        
        return cell;
    }else if (indexPath.row == 2){
        
        PhoneCodeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PhoneCodeTableViewCell" forIndexPath:indexPath];
        
        return cell;
    }else if (indexPath.row == 4){
        
        ResertSureTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ResertSureTableViewCell" forIndexPath:indexPath];
        
        return cell;
    }
    
    LoginInputTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"LoginInputTableViewCell" forIndexPath:indexPath];
    
    [cell addResertIndex:indexPath.row];
    
    return cell;
}

@end
