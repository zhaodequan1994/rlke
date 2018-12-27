//
//  HomePersonalViewController.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/10.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "HomePersonalViewController.h"

//cells
#import "PersonalCenterTableViewCell.h"
#import "PersonSubHeaderTableViewCell.h"
#import "PersonalHeaderTableViewCell.h"
#import "PersonalUserTableViewCell.h"

//Controllers

@interface HomePersonalViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;


@end

@implementation HomePersonalViewController

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -20, SCREEN_WIDTH, SCREEN_HEIGHT - 29) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = RGB(243, 243, 243);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"PersonalUserTableViewCell" bundle:nil] forCellReuseIdentifier:@"PersonalUserTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"PersonalHeaderTableViewCell" bundle:nil] forCellReuseIdentifier:@"PersonalHeaderTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"PersonSubHeaderTableViewCell" bundle:nil] forCellReuseIdentifier:@"PersonSubHeaderTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"PersonalCenterTableViewCell" bundle:nil] forCellReuseIdentifier:@"PersonalCenterTableViewCell"];
        
    }
    return _tableView;
}


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    if (self.tabBarController.tabBar.hidden) {
        self.tabBarController.tabBar.hidden = NO;
    }
    
    
    self.navigationController.navigationBar.hidden = YES;
    
}
-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeBaseNavigationAppearance];
    [self initializeAppearance];
    [self initializeDataSource];
    
}

-(void)initializeBaseNavigationAppearance{

    
}

-(void)initializeAppearance{

    [self.view addSubview:self.tableView];
    
}

-(void)initializeDataSource{

//    [self netWorkrequest];
}

-(void)netWorkrequest{
    
   
}

#pragma mark  **********  tableView  delegate  ********

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        return 141;
        
    }else if (indexPath.row == 1){
        
        return 156;

    }else if (indexPath.row == 2){
        
        return 195;

    }
    return 215;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        PersonalHeaderTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PersonalHeaderTableViewCell" forIndexPath:indexPath];
        
        cell.fatherController = self;
        
        return cell;
        
    }else if (indexPath.row == 1){
        
        PersonSubHeaderTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PersonSubHeaderTableViewCell" forIndexPath:indexPath];
        cell.fatherController = self;
        
        return cell;
        
    }else if (indexPath.row == 2){
        
        PersonalUserTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PersonalUserTableViewCell" forIndexPath:indexPath];
        
        cell.fatherController = self;
        
        return cell;
        
    }else{
        
        PersonalCenterTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PersonalCenterTableViewCell" forIndexPath:indexPath];
        
        cell.fatherController = self;

        return cell;
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
