//
//  MyRecommedCodeViewController.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/12.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "MyRecommedCodeViewController.h"

//Cells
#import "MyRecommendCodeTableViewCell.h"

@interface MyRecommedCodeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;

@end

@implementation MyRecommedCodeViewController

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT ) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = RGB(255, 84, 85);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        if (SCREEN_HEIGHT > 495) {
            _tableView.scrollEnabled = NO;
        }else{
            _tableView.scrollEnabled = YES;
        }
        [_tableView registerNib:[UINib nibWithNibName:@"MyRecommendCodeTableViewCell" bundle:nil] forCellReuseIdentifier:@"MyRecommendCodeTableViewCell"];
        
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
    
    self.title = @"我的推荐码";
}

-(void)initializeAppearance{
    
    [self.view addSubview:self.tableView];
    
}

-(void)initializeDataSource{
    
    
}

#pragma mark  **********  tableView  delegate  ********

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 495;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    MyRecommendCodeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MyRecommendCodeTableViewCell" forIndexPath:indexPath];
    
    return cell;
    
}

@end
