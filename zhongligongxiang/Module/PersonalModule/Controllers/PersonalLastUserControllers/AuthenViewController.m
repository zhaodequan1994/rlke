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

//Controllers
#import "AuthenSuccendViewController.h"

#define INPUTTEXTFIELD_TAG  100

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

-(void)autherNetworkRequestName:(NSString *)name withNumberId:(NSString *)number{
    
    WEAKSELF
    NSDictionary * dic = @{@"cardNo":number,@"realName":name,@"uid":self.userModel.userId};
    
    [PublicMethod networkRequestWithPath:PATH_REALNAME Parameters:dic sender:nil begin:^{
        
        [weakSelf startActivityView];

    } success:^(id  _Nonnull object) {
        

        [weakSelf psuhToSuccessController];
        
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
        
        [cell.authenBtn addTarget:self action:@selector(authenBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        return cell;
        
    }else{
        
        AuthenInputTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"AuthenInputTableViewCell" forIndexPath:indexPath];
        
        cell.inputTextField.tag = INPUTTEXTFIELD_TAG + indexPath.row;
        
        [cell addIndex:indexPath.row];
        
        return cell;
        
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self.view endEditing:YES];

}


#pragma mark  --------  event  click  --------

-(void)authenBtnClick{
    
    
    UITextField * nameTextField = (UITextField *)[self.view viewWithTag:INPUTTEXTFIELD_TAG + 1];
    
    UITextField * numberTextField = (UITextField *)[self.view viewWithTag:INPUTTEXTFIELD_TAG + 2];
    
    if (nameTextField.text.length == 0) {
        
        [PublicMethod alertControllerViewWithTitle:@"请输入身份证姓名" sender:self];
        
    }else if (numberTextField.text.length == 0){
        
        [PublicMethod alertControllerViewWithTitle:@"请输入身份证号码" sender:self];

    }else{
        
        [self autherNetworkRequestName:nameTextField.text withNumberId:numberTextField.text];
    }

}

#pragma mark  ---------  other  -------------

-(void)psuhToSuccessController{
    
    self.hidesBottomBarWhenPushed = YES;
    
    AuthenSuccendViewController * asvc = [[AuthenSuccendViewController alloc] init];
    
    asvc.authenType = AuthenTypeSuccess;
    
    [self.navigationController pushViewController:asvc animated:YES];

}

@end
