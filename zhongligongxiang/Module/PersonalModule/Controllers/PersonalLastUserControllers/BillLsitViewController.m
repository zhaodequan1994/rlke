//
//  BillLsitViewController.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/12.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "BillLsitViewController.h"

//Cells
#import "BillListTableViewCell.h"

@interface BillLsitViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;

@end

@implementation BillLsitViewController

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT ) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = RGB(243, 243, 243);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"BillListTableViewCell" bundle:nil] forCellReuseIdentifier:@"BillListTableViewCell"];
        
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
    
    self.title = @"发单记录";
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
    
    
    return 195;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BillListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"BillListTableViewCell" forIndexPath:indexPath];
    
    cell.fatherController = self;
    
    return cell;
    
}


@end
