//
//  MyFollowViewController.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/12.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "MyFollowViewController.h"

//Cells
#import "MyFollowTableViewCell.h"

//Models
#import "MyFollowsModel.h"

@interface MyFollowViewController ()<UITableViewDelegate,UITableViewDataSource,MJRefreshEXDelegate>

@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) NSMutableArray * dataArray;

@property (nonatomic,assign) NSInteger pageCount;

@end

@implementation MyFollowViewController

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = RGB(243, 243, 243);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"MyFollowTableViewCell" bundle:nil] forCellReuseIdentifier:@"MyFollowTableViewCell"];
        
    }
    return _tableView;
}

-(NSMutableArray *)dataArray{
    
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
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
    
    self.title = @"我的关注";
}

-(void)initializeAppearance{
    
    [self.view addSubview:self.tableView];
    [self.tableView addHeaderWithHeaderClass:nil beginRefresh:NO delegate:self animation:NO];

}

-(void)initializeDataSource{
    
    self.pageCount = 10;

    [self requestNetWorkingWithPageNumIsHeader:NO];

}

- (void)requestNetWorkingWithPageNumIsHeader:(BOOL)isHeader {

    WEAKSELF
    NSDictionary * parameter = @{@"uid":self.userModel.userId,@"limit":[NSString stringWithFormat:@"%ld",self.pageCount]};
    
    [PublicMethod networkRequestWithPath:PATH_MYFOLLOWS Parameters:parameter sender:nil begin:^{
        
        [weakSelf startActivityView];

    } success:^(id  _Nonnull object) {
        
        NSDictionary * dic = object[@"data"];
        
        NSMutableArray * array = [dic objectForKey:@"data"];
        
        NSMutableArray * tempArray = [[NSMutableArray alloc] init];
        
        for (NSDictionary * dict in array) {
            
            MyFollowsModel * followModel = [[MyFollowsModel alloc] init];
            followModel.followId = [NSString stringWithFormat:@"%@",[dict objectForKey:@"id"]];
            followModel.uid = [NSString stringWithFormat:@"%@",[dict objectForKey:@"uid"]];
            followModel.follow_id = [NSString stringWithFormat:@"%@",[dict objectForKey:@"follow_id"]];
            followModel.create_time = [NSString stringWithFormat:@"%@",[dict objectForKey:@"create_time"]];
            followModel.follow_count = [NSString stringWithFormat:@"%@",[dict objectForKey:@"follow_count"]];
            
            NSDictionary * userdic = [dict objectForKey:@"user"];
            followModel.account = [NSString stringWithFormat:@"%@",[userdic objectForKey:@"account"]];
            followModel.avatar = [NSString stringWithFormat:@"%@",[userdic objectForKey:@"avatar"]];
            followModel.name = [NSString stringWithFormat:@"%@",[userdic objectForKey:@"name"]];

            [tempArray addObject:followModel];
        }
        
        if (isHeader) {
            
            [weakSelf.tableView endHeaderRefresh];
            [weakSelf.tableView resetSelfPageNum];
            [weakSelf.dataArray removeAllObjects];
            [weakSelf.dataArray addObjectsFromArray:tempArray];
            
        }else{
            
            [weakSelf.dataArray addObjectsFromArray:tempArray];
        }

        if (weakSelf.dataArray.count >= weakSelf.pageCount) {
            
            [weakSelf.tableView addFooterWithFooterClass:nil automaticallyRefresh:YES delegate:weakSelf];
            
        }
        
        [weakSelf stopActivityView];

    } error:^(id  _Nonnull object) {
        
        [PublicMethod alertControllerViewWithTitle:object[@"msg"] sender:weakSelf];
        
        [weakSelf.tableView resetSelfPageNum];
        
        [weakSelf.tableView endHeaderRefresh];
        
        [weakSelf stopActivityView];

    } failure:^(id  _Nonnull object) {
        
        [PublicMethod alertControllerViewWithTitle:object[@"msg"] sender:weakSelf];
        
        [weakSelf.tableView resetSelfPageNum];
        
        [weakSelf.tableView endHeaderRefresh];
        
        [weakSelf stopActivityView];

    }];
}

- (void)requestNetWorkingWithPageNum:(NSInteger)pageNum isHeader:(BOOL)isHeader {

    WEAKSELF
    NSDictionary * parameter = @{@"uid":self.userModel.userId,@"limit":[NSString stringWithFormat:@"%ld",self.pageCount],@"offset":[NSString stringWithFormat:@"%ld",pageNum * self.pageCount]};
    
    [PublicMethod networkRequestWithPath:PATH_MYFOLLOWS Parameters:parameter sender:nil begin:^{
        
    } success:^(id  _Nonnull object) {
        
        NSDictionary * dic = object[@"data"];
        
        NSMutableArray * array = [dic objectForKey:@"data"];
        
        NSMutableArray * tempArray = [[NSMutableArray alloc] init];
        
        for (NSDictionary * dict in array) {
            
            MyFollowsModel * followModel = [[MyFollowsModel alloc] init];
            followModel.followId = [NSString stringWithFormat:@"%@",[dict objectForKey:@"id"]];
            followModel.uid = [NSString stringWithFormat:@"%@",[dict objectForKey:@"uid"]];
            followModel.follow_id = [NSString stringWithFormat:@"%@",[dict objectForKey:@"follow_id"]];
            followModel.create_time = [NSString stringWithFormat:@"%@",[dict objectForKey:@"create_time"]];
            followModel.follow_count = [NSString stringWithFormat:@"%@",[dict objectForKey:@"follow_count"]];
            
            NSDictionary * userdic = [dict objectForKey:@"user"];
            followModel.account = [NSString stringWithFormat:@"%@",[userdic objectForKey:@"account"]];
            followModel.avatar = [NSString stringWithFormat:@"%@",[userdic objectForKey:@"avatar"]];
            followModel.name = [NSString stringWithFormat:@"%@",[userdic objectForKey:@"name"]];
            
            [weakSelf.dataArray addObject:followModel];
            [tempArray addObject:followModel];
        }
        
        [weakSelf.tableView endFooterRefreshWithChangePageIndex:YES];
        
        if (tempArray.count <= 0) {
            
            [weakSelf.tableView noMoreData];
            
        }

        [weakSelf stopActivityView];

    } error:^(id  _Nonnull object) {
        
        [PublicMethod alertControllerViewWithTitle:object[@"msg"] sender:weakSelf];

        [weakSelf stopActivityView];
        
    } failure:^(id  _Nonnull object) {
        
        [PublicMethod alertControllerViewWithTitle:object[@"msg"] sender:weakSelf];
        
        [weakSelf stopActivityView];
    }];

}

#pragma mark  **********  tableView  delegate  ********

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 70;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        
    MyFollowTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MyFollowTableViewCell" forIndexPath:indexPath];
    
    return cell;
}

#pragma mark - MJRefreshEXDelegate

- (void)onLoadingMoreData:(id)control pageNum:(NSNumber *)pageNum {
    
    [self requestNetWorkingWithPageNum:pageNum.integerValue + 1 isHeader:NO];
    
}

-(void)onRefreshing:(id)control{
    
    [self requestNetWorkingWithPageNumIsHeader:YES];
}

@end
