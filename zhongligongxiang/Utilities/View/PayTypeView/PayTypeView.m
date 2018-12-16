//
//  PayTypeView.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/16.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "PayTypeView.h"

//Cells
#import "PayTypeTitleTableViewCell.h"
#import "PayTpyeTableViewCell.h"

//Controllers
#import "AddBankViewController.h"

@interface PayTypeView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;


@end

@implementation PayTypeView

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 286, SCREEN_WIDTH, 286 ) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = RGB(243, 243, 243);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"PayTypeTitleTableViewCell" bundle:nil] forCellReuseIdentifier:@"PayTypeTitleTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"PayTpyeTableViewCell" bundle:nil] forCellReuseIdentifier:@"PayTpyeTableViewCell"];
        
    }
    return _tableView;
}


-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        UIColor *color = [UIColor blackColor];
        self.backgroundColor = [color colorWithAlphaComponent:0.6];
    }
    
    return self;
}

-(void)PayTypeShow{
    
    [[PublicMethod getWindow] addSubview:self];

    [self addSubview:self.tableView];
}

-(void)payTypeDissmiss{
    
    [self removeFromSuperview];
}

#pragma mark  **********  tableView  delegate  ********

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        return 44;
    }
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        PayTypeTitleTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PayTypeTitleTableViewCell" forIndexPath:indexPath];
        
        [cell.cannerBtn addTarget:self action:@selector(cannerBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [cell addTitleString:self.title];
        
        return cell;

    }
    
    PayTpyeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PayTpyeTableViewCell" forIndexPath:indexPath];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self removeFromSuperview];
    
    self.fatherController.hidesBottomBarWhenPushed = YES;
    
    AddBankViewController * abvc = [[AddBankViewController alloc] init];
    [self.fatherController.navigationController pushViewController:abvc animated:YES];
}

#pragma mark  -------  event  click  --------

-(void)cannerBtnClick{
    
    [self removeFromSuperview];
}

@end
