//
//  LoginViewController.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "LoginViewController.h"

//cells
#import "LoginAndRegisterTableViewCell.h"
#import "LoginTitleTableViewCell.h"
#import "LoginInputTableViewCell.h"

//Models
#import "LoginModel.h"

#define INPUT_TAG  100
@interface LoginViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;

@property (nonatomic,strong) LoginModel * loginModel;

@end

@implementation LoginViewController

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = RGB(255, 255, 255);
        if (SCREEN_HEIGHT < 410) {
            _tableView.scrollEnabled = YES;
        }else{
            _tableView.scrollEnabled = NO;
        }
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"LoginInputTableViewCell" bundle:nil] forCellReuseIdentifier:@"LoginInputTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"LoginTitleTableViewCell" bundle:nil] forCellReuseIdentifier:@"LoginTitleTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"LoginAndRegisterTableViewCell" bundle:nil] forCellReuseIdentifier:@"LoginAndRegisterTableViewCell"];

    }
    return _tableView;
}

-(LoginModel *)loginModel{
    
    if (!_loginModel) {
        _loginModel = [[LoginModel alloc] init];
    }
    return _loginModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeBaseNavigationAppearance];
    [self initializeAppearance];
    [self initializeDataSource];
    
}

-(void)initializeBaseNavigationAppearance{
    
    self.title = @"登录";
    
}

-(void)initializeAppearance{

    [self.view addSubview:self.tableView];
}

-(void)initializeDataSource{
    

}

-(void)loginNetworkRequest{
    
    NSDictionary * parameter = @{@"phone":self.loginModel.phone,@"password":self.loginModel.password};
    
    [PublicMethod networkRequestWithPath:PATH_LOGIN Parameters:parameter sender:nil begin:^{
        
    } success:^(id  _Nonnull object) {
        
        NSLog(@"===%@",object);
        
    } error:^(id  _Nonnull object) {
        
        NSLog(@"==11=%@",object);

    } failure:^(id  _Nonnull object) {
        
        NSLog(@"==22=%@",object);

    }];
    
}

#pragma mark  **********  tableView  delegate  ********

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        return 140;
    }else if (indexPath.row == 3){
        
        return 150;
    }
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == 0) {
        
        LoginTitleTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"LoginTitleTableViewCell" forIndexPath:indexPath];
        
        return cell;
        
    }else if (indexPath.row == 3){
        
        LoginAndRegisterTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"LoginAndRegisterTableViewCell" forIndexPath:indexPath];
        
        [cell.loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        cell.fatherController = self;
        
        return cell;
    }
    
    LoginInputTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"LoginInputTableViewCell" forIndexPath:indexPath];
    
    cell.inputTextField.tag = INPUT_TAG + indexPath.row;
    
    [cell addIndex:indexPath.row];

    return cell;
    
}

#pragma mark   --------  event  click  ------

-(void)loginBtnClick{
    
    UITextField * inputTextField1  = (UITextField *)[self.view viewWithTag:INPUT_TAG + 1];
    
    UITextField * inputTextField2  = (UITextField *)[self.view viewWithTag:INPUT_TAG + 2];

    if (inputTextField1.text.length != 11) {
        
        [PublicMethod alertControllerViewWithTitle:@"请输入正确的电话" sender:self];
    }else if (inputTextField2.text.length == 0){
        
        [PublicMethod alertControllerViewWithTitle:@"请输入密码" sender:self];

    }else{
        
        self.loginModel.phone = inputTextField1.text;
        self.loginModel.password = inputTextField2.text;

        [self loginNetworkRequest];
    }
}

@end
