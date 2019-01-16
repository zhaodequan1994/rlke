//
//  PersonalAgentInfoViewController.m
//  zhongligongxiang
//
//  Created by zhaodq on 2019/1/4.
//  Copyright © 2019 zhaodq. All rights reserved.
//

#import "PersonalAgentInfoViewController.h"

//Cells
#import "PersonalAgentInfoTableViewCell.h"
#import "PersonalAgentInfoDetialTableViewCell.h"

@interface PersonalAgentInfoViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;

@end

@implementation PersonalAgentInfoViewController

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 5, SCREEN_WIDTH, SCREEN_HEIGHT - 5) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = RGB(243, 243, 243);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"PersonalAgentInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"PersonalAgentInfoTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"PersonalAgentInfoDetialTableViewCell" bundle:nil] forCellReuseIdentifier:@"PersonalAgentInfoDetialTableViewCell"];

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
    
    self.title = @"填写资料";
}

-(void)initializeAppearance{
    
    [self.view addSubview:self.tableView];
    
    [self addRightBtn];
    
}

-(void)initializeDataSource{
    
    self.view.backgroundColor = RGB(243, 243, 243);

}

#pragma mark  **********  tableView  delegate  ********

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 6;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 5) {
        
        return 100;
    }
    return 55;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.row == 5) {
        
        PersonalAgentInfoDetialTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PersonalAgentInfoDetialTableViewCell" forIndexPath:indexPath];
        
        return cell;

    }
    
    PersonalAgentInfoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PersonalAgentInfoTableViewCell" forIndexPath:indexPath];
    
    [cell addIndex:indexPath.row];
    
    return cell;
    
}


#pragma mark   -------  other  ------

-(void)addRightBtn{
    
    [self.rightBtn setTitle:@"完成" forState:UIControlStateNormal];
    [self.rightBtn setTitleColor:RGB(255, 84, 85) forState:UIControlStateNormal];
    self.rightBtn.titleLabel.font = [UIFont systemFontOfSize:16];
}

#pragma mark   -------  right  click  ------

-(void)rightBtnClick{
    
    
}

@end
