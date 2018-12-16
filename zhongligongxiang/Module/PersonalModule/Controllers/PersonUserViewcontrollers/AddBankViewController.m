//
//  AddBankViewController.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/16.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "AddBankViewController.h"

//Cells
#import "AddBankSureTableViewCell.h"
#import "AddBankCodeTableViewCell.h"
#import "AddBankInputTableViewCell.h"
#import "AddBankHeaderTableViewCell.h"
@interface AddBankViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;

@end

@implementation AddBankViewController

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT ) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = RGB(247, 247, 247);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"AddBankSureTableViewCell" bundle:nil] forCellReuseIdentifier:@"AddBankSureTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"AddBankCodeTableViewCell" bundle:nil] forCellReuseIdentifier:@"AddBankCodeTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"AddBankInputTableViewCell" bundle:nil] forCellReuseIdentifier:@"AddBankInputTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"AddBankHeaderTableViewCell" bundle:nil] forCellReuseIdentifier:@"AddBankHeaderTableViewCell"];

        
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
    
    self.title = @"添加银行卡";
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
        
        return 40;

    }else if (indexPath.row == 5){
        
        return 130;

    }
    
    return 55;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        AddBankHeaderTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"AddBankHeaderTableViewCell" forIndexPath:indexPath];
        
        return cell;
        
    }else if (indexPath.row == 4){
    
        AddBankCodeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"AddBankCodeTableViewCell" forIndexPath:indexPath];
        
        return cell;
        
    }else if (indexPath.row == 5){
        
        AddBankSureTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"AddBankSureTableViewCell" forIndexPath:indexPath];
        
        return cell;
    }
    
    AddBankInputTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"AddBankInputTableViewCell" forIndexPath:indexPath];
    
    [cell addindex:indexPath.row];
    
    return cell;
    
}

@end
