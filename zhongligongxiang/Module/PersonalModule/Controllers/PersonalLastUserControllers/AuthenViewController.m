//
//  AuthenViewController.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/12.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "AuthenViewController.h"

//Cells
#import "AuthenSureTableViewCell.h"
#import "AuthenInputTableViewCell.h"
#import "AuthenImageTableViewCell.h"
@interface AuthenViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;

@end

@implementation AuthenViewController

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT ) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = RGB(255, 255, 255);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        if (SCREEN_HEIGHT > 361) {
            _tableView.scrollEnabled = NO;
        }else{
            _tableView.scrollEnabled = YES;
        }
        [_tableView registerNib:[UINib nibWithNibName:@"AuthenImageTableViewCell" bundle:nil] forCellReuseIdentifier:@"AuthenImageTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"AuthenInputTableViewCell" bundle:nil] forCellReuseIdentifier:@"AuthenInputTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"AuthenSureTableViewCell" bundle:nil] forCellReuseIdentifier:@"AuthenSureTableViewCell"];

        
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
    
    self.title = @"实名认证";
}

-(void)initializeAppearance{
    
    [self.view addSubview:self.tableView];
    
}

-(void)initializeDataSource{
    
    
}

#pragma mark  **********  tableView  delegate  ********

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.row == 0) {
        
        return 137;
        
    }else if (indexPath.row == 3){
        
        return 104;

    }else{
        
        return 60;

    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        AuthenImageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"AuthenImageTableViewCell" forIndexPath:indexPath];
        
        return cell;
        
    }else if (indexPath.row == 3){
        
        AuthenSureTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"AuthenSureTableViewCell" forIndexPath:indexPath];
        
        return cell;
        
    }else{
        
        AuthenInputTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"AuthenInputTableViewCell" forIndexPath:indexPath];
        
        [cell addIndex:indexPath.row];
        
        return cell;
        
    }
    
}

@end
