//
//  MyFansViewController.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/12.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "MyFansViewController.h"

//Cells
#import "MyFollowTableViewCell.h"

//Controllers
#import "MyFansCenterViewController.h"

//Models
#import "MyFansModel.h"

@interface MyFansViewController ()<UITableViewDelegate,UITableViewDataSource,MJRefreshEXDelegate>

@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) NSMutableArray * dataArray;

@property (nonatomic,assign) NSInteger pageCount;

@end

@implementation MyFansViewController

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
    
    self.title = @"我的粉丝";
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
    [PublicMethod networkRequestWithPath:PATH_MYFANS Parameters:parameter sender:nil begin:^{
        
    } success:^(id  _Nonnull object) {
        
        NSLog(@"$$$$%@",object);
        
        NSDictionary * dic = object[@"data"];

        NSMutableArray * array = [dic objectForKey:@"data"];

        NSMutableArray * tempArray = [[NSMutableArray alloc] init];
        
        for (NSDictionary * dict in array) {

            MyFansModel * fansModel = [[MyFansModel alloc] init];
            fansModel.fansId = [NSString stringWithFormat:@"%@",[dict objectForKey:@"id"]];
            fansModel.uid = [NSString stringWithFormat:@"%@",[dict objectForKey:@"uid"]];
            fansModel.fans_id = [NSString stringWithFormat:@"%@",[dict objectForKey:@"fans_id"]];
            fansModel.create_time = [NSString stringWithFormat:@"%@",[dict objectForKey:@"create_time"]];
            fansModel.fans_count = [NSString stringWithFormat:@"%@",[dict objectForKey:@"fans_count"]];
            
            NSDictionary * userDic = [dict objectForKey:@"user"];
            fansModel.account = [NSString stringWithFormat:@"%@",[userDic objectForKey:@"account"]];
            fansModel.avatar = [NSString stringWithFormat:@"%@",[userDic objectForKey:@"avatar"]];
            fansModel.name = [NSString stringWithFormat:@"%@",[userDic objectForKey:@"name"]];
            
            [tempArray addObject:fansModel];

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
    
    [PublicMethod networkRequestWithPath:PATH_MYFANS Parameters:parameter sender:nil begin:^{
        
    } success:^(id  _Nonnull object) {
        
        NSDictionary * dic = object[@"data"];
        
        NSMutableArray * array = [dic objectForKey:@"data"];
        
        NSMutableArray * tempArray = [[NSMutableArray alloc] init];
        
        for (NSDictionary * dict in array) {
            
            MyFansModel * fansModel = [[MyFansModel alloc] init];
            fansModel.fansId = [NSString stringWithFormat:@"%@",[dict objectForKey:@"id"]];
            fansModel.uid = [NSString stringWithFormat:@"%@",[dict objectForKey:@"uid"]];
            fansModel.fans_id = [NSString stringWithFormat:@"%@",[dict objectForKey:@"fans_id"]];
            fansModel.create_time = [NSString stringWithFormat:@"%@",[dict objectForKey:@"create_time"]];
            fansModel.fans_count = [NSString stringWithFormat:@"%@",[dict objectForKey:@"fans_count"]];
            
            NSDictionary * userDic = [dict objectForKey:@"user"];
            fansModel.account = [NSString stringWithFormat:@"%@",[userDic objectForKey:@"account"]];
            fansModel.avatar = [NSString stringWithFormat:@"%@",[userDic objectForKey:@"avatar"]];
            fansModel.name = [NSString stringWithFormat:@"%@",[userDic objectForKey:@"name"]];
            
            [tempArray addObject:fansModel];
            [weakSelf.dataArray addObject:fansModel];

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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.hidesBottomBarWhenPushed = YES;
    
    MyFansCenterViewController * mfvc = [[MyFansCenterViewController alloc] init];
    
    [self.navigationController pushViewController:mfvc animated:YES];
}

#pragma mark - MJRefreshEXDelegate

- (void)onLoadingMoreData:(id)control pageNum:(NSNumber *)pageNum {
    
    [self requestNetWorkingWithPageNum:pageNum.integerValue + 1 isHeader:NO];
    
}

-(void)onRefreshing:(id)control{
    
    [self requestNetWorkingWithPageNumIsHeader:YES];
}

@end
