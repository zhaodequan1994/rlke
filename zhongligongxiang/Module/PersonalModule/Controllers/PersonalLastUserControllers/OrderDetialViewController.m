//
//  OrderDetialViewController.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/15.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "OrderDetialViewController.h"

//Cells
#import "OrderDetialTableViewCell.h"
#import "OrdertialCannerBtnTableViewCell.h"

@interface OrderDetialViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;

@end

@implementation OrderDetialViewController

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT ) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = RGB(243, 243, 243);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"OrderDetialTableViewCell" bundle:nil] forCellReuseIdentifier:@"OrderDetialTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"OrdertialCannerBtnTableViewCell" bundle:nil] forCellReuseIdentifier:@"OrdertialCannerBtnTableViewCell"];
        
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
    
    self.title = @"订单详情";
    
}

-(void)initializeAppearance{
    
    [self.view addSubview:self.tableView];
    
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
    
    return 102;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {

        OrderDetialTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"OrderDetialTableViewCell" forIndexPath:indexPath];
        
        return cell;

    }
    
    OrdertialCannerBtnTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"OrdertialCannerBtnTableViewCell" forIndexPath:indexPath];
    
    cell.fahterConroller = self;
    
    [cell addCannerState:self.isDetial];
    
    return cell;
    
}

@end
