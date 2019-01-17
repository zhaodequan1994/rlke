//
//  HomePersonalViewController.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/10.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "HomePersonalViewController.h"

//Models
#import "PersoalUserModel.h"


//cells
#import "PersonalCenterTableViewCell.h"
#import "PersonSubHeaderTableViewCell.h"
#import "PersonalHeaderTableViewCell.h"
#import "PersonalUserTableViewCell.h"

//Controllers

@interface HomePersonalViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;

@property (nonatomic,strong) PersoalUserModel * personalModel;

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

-(PersoalUserModel *)personalModel{
    
    if (!_personalModel) {
        _personalModel = [[PersoalUserModel alloc] init];
    }
    return _personalModel;
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    if (self.tabBarController.tabBar.hidden) {
        self.tabBarController.tabBar.hidden = NO;
    }
    
    
    self.navigationController.navigationBar.hidden = YES;
    
    [self addAbsover];
    
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

    [self netWorkrequest];

}

-(void)netWorkrequest{
    
    WEAKSELF
    NSDictionary * parameter = @{@"uid":self.userModel.userId};
    
    [PublicMethod networkRequestWithPath:PATH_USERINFO Parameters:parameter sender:nil begin:^{
        
        [weakSelf startActivityView];

    } success:^(id  _Nonnull object) {
        
        NSLog(@"%@",object);
        
        NSDictionary * dic = object[@"data"];
        
        weakSelf.personalModel.userId = [NSString stringWithFormat:@"%@",[dic objectForKey:@"id"]];
        weakSelf.personalModel.parent_id = [NSString stringWithFormat:@"%@",[dic objectForKey:@"parent_id"]];
        weakSelf.personalModel.rec_code = [NSString stringWithFormat:@"%@",[dic objectForKey:@"rec_code"]];
        weakSelf.personalModel.account = [NSString stringWithFormat:@"%@",[dic objectForKey:@"account"]];
        weakSelf.personalModel.email = [NSString stringWithFormat:@"%@",[dic objectForKey:@"email"]];
        weakSelf.personalModel.balance = [NSString stringWithFormat:@"%@",[dic objectForKey:@"balance"]];
        weakSelf.personalModel.name = [NSString stringWithFormat:@"%@",[dic objectForKey:@"name"]];
        weakSelf.personalModel.phone = [NSString stringWithFormat:@"%@",[dic objectForKey:@"phone"]];
        weakSelf.personalModel.score = [NSString stringWithFormat:@"%@",[dic objectForKey:@"score"]];
        weakSelf.personalModel.sex = [NSString stringWithFormat:@"%@",[dic objectForKey:@"sex"]];
        weakSelf.personalModel.age = [NSString stringWithFormat:@"%@",[dic objectForKey:@"age"]];
        weakSelf.personalModel.avatar = [NSString stringWithFormat:@"%@",[dic objectForKey:@"avatar"]];
        weakSelf.personalModel.major = [NSString stringWithFormat:@"%@",[dic objectForKey:@"major"]];
        weakSelf.personalModel.rate = [NSString stringWithFormat:@"%@",[dic objectForKey:@"rate"]];
        weakSelf.personalModel.territory = [NSString stringWithFormat:@"%@",[dic objectForKey:@"territory"]];
        weakSelf.personalModel.login_count = [NSString stringWithFormat:@"%@",[dic objectForKey:@"login_count"]];
        weakSelf.personalModel.login_time = [NSString stringWithFormat:@"%@",[dic objectForKey:@"login_time"]];
        weakSelf.personalModel.role_id = [NSString stringWithFormat:@"%@",[dic objectForKey:@"role_id"]];
        weakSelf.personalModel.remark = [NSString stringWithFormat:@"%@",[dic objectForKey:@"remark"]];
        weakSelf.personalModel.create_time = [NSString stringWithFormat:@"%@",[dic objectForKey:@"create_time"]];
        weakSelf.personalModel.lat = [NSString stringWithFormat:@"%@",[dic objectForKey:@"lat"]];
        weakSelf.personalModel.lng = [NSString stringWithFormat:@"%@",[dic objectForKey:@"lng"]];
        weakSelf.personalModel.extend = [NSString stringWithFormat:@"%@",[dic objectForKey:@"extend"]];
        weakSelf.personalModel.skill = [NSString stringWithFormat:@"%@",[dic objectForKey:@"skill"]];
        weakSelf.personalModel.online_device = [NSString stringWithFormat:@"%@",[dic objectForKey:@"online_device"]];
        weakSelf.personalModel.is_online = [NSString stringWithFormat:@"%@",[dic objectForKey:@"is_online"]];
        weakSelf.personalModel.is_delete = [NSString stringWithFormat:@"%@",[dic objectForKey:@"is_delete"]];
        weakSelf.personalModel.is_admin = [NSString stringWithFormat:@"%@",[dic objectForKey:@"is_admin"]];
        weakSelf.personalModel.wages = [NSString stringWithFormat:@"%@",[dic objectForKey:@"wages"]];
        weakSelf.personalModel.is_real = [NSString stringWithFormat:@"%@",[dic objectForKey:@"is_real"]];
        weakSelf.personalModel.fans_num = [NSString stringWithFormat:@"%@",[dic objectForKey:@"fans_num"]];
        weakSelf.personalModel.follows_num = [NSString stringWithFormat:@"%@",[dic objectForKey:@"follows_num"]];
        weakSelf.personalModel.th_nums = [NSString stringWithFormat:@"%@",[dic objectForKey:@"th_nums"]];
        weakSelf.personalModel.get_th_nums = [NSString stringWithFormat:@"%@",[dic objectForKey:@"get_th_nums"]];
        weakSelf.personalModel.used_cash = [NSString stringWithFormat:@"%@",[dic objectForKey:@"used_cash"]];
        weakSelf.personalModel.using_cash = [NSString stringWithFormat:@"%@",[dic objectForKey:@"using_cash"]];

        
        [[PublicManager shareInstance].userObjectManager encodeUserModelObject:object[@"data"] superUserModel:self.userModel];

        [weakSelf.tableView reloadData];
        
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
        
        [cell addModel:self.userModel];
        
        return cell;
        
    }else if (indexPath.row == 1){
        
        PersonSubHeaderTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PersonSubHeaderTableViewCell" forIndexPath:indexPath];
        cell.fatherController = self;
        
        [cell addModel:self.personalModel];
        
        return cell;
        
    }else if (indexPath.row == 2){
        
        PersonalUserTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PersonalUserTableViewCell" forIndexPath:indexPath];
        
        cell.fatherController = self;
        
        [cell addModel:self.personalModel];
        
        return cell;
        
    }else{
        
        PersonalCenterTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PersonalCenterTableViewCell" forIndexPath:indexPath];
        
        cell.fatherController = self;
        
        cell.personalModel = self.personalModel;

        return cell;
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark  ---------  absover   ---------

-(void)addAbsover{
    
    [PublicMethod addObserver:self selector:@selector(infoUpdate) name:MESSAGE_HOMEPAGE_UPDATEINFO object:nil];
    [PublicMethod addObserver:self selector:@selector(loginSuccessed) name:MESSAGE_LOGIN_SUCCESSED object:nil];
}
-(void)infoUpdate{
    
    [self netWorkrequest];
    
}
-(void)loginSuccessed{
    
    [self netWorkrequest];

}

@end
