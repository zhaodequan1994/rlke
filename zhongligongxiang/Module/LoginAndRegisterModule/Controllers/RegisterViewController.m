//
//  RegisterViewController.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "RegisterViewController.h"

//Cells
#import "LoginTitleTableViewCell.h"
#import "LoginInputTableViewCell.h"
#import "PhoneCodeTableViewCell.h"
#import "RegisterTableViewCell.h"

@interface RegisterViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;

@end

@implementation RegisterViewController

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = RGB(255, 255, 255);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        if (SCREEN_HEIGHT < 530) {
            _tableView.scrollEnabled = YES;
        }else{
            _tableView.scrollEnabled = NO;
        }

        [_tableView registerNib:[UINib nibWithNibName:@"LoginInputTableViewCell" bundle:nil] forCellReuseIdentifier:@"LoginInputTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"LoginTitleTableViewCell" bundle:nil] forCellReuseIdentifier:@"LoginTitleTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"RegisterTableViewCell" bundle:nil] forCellReuseIdentifier:@"RegisterTableViewCell"];
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
    
    self.title = @"账号注册";
    
}

-(void)initializeAppearance{
    
    [self.view addSubview:self.tableView];
}

-(void)initializeDataSource{
    
    
}

#pragma mark  **********  tableView  delegate  ********

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 6;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        return 140;
    }else if (indexPath.row == 5){
        
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
    }else if (indexPath.row == 5){
        
        RegisterTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"RegisterTableViewCell" forIndexPath:indexPath];
        
        return cell;
    }
    
    LoginInputTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"LoginInputTableViewCell" forIndexPath:indexPath];
    
    [cell addRegisterIndex:indexPath.row];
    
    return cell;
}


@end
