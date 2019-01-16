//
//  ResetSecretViewController.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "ResetSecretViewController.h"

//Cells
#import "LoginTitleTableViewCell.h"
#import "LoginInputTableViewCell.h"
#import "PhoneCodeTableViewCell.h"
#import "ResertSureTableViewCell.h"

//Models
#import "ResertPasswordModel.h"


#define INPUT_TAG  100
#define INPUT_SNSCODE 1000

@interface ResetSecretViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) ResertPasswordModel * resertModel;

@end

@implementation ResetSecretViewController

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = RGB(255, 255, 255);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        if (SCREEN_HEIGHT < 470) {
            _tableView.scrollEnabled = YES;
        }else{
            _tableView.scrollEnabled = NO;
        }
        [_tableView registerNib:[UINib nibWithNibName:@"LoginInputTableViewCell" bundle:nil] forCellReuseIdentifier:@"LoginInputTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"LoginTitleTableViewCell" bundle:nil] forCellReuseIdentifier:@"LoginTitleTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"ResertSureTableViewCell" bundle:nil] forCellReuseIdentifier:@"ResertSureTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"PhoneCodeTableViewCell" bundle:nil] forCellReuseIdentifier:@"PhoneCodeTableViewCell"];
        
    }
    return _tableView;
}

-(ResertPasswordModel *)resertModel{
    
    if (!_resertModel) {
        _resertModel = [[ResertPasswordModel alloc] init];
    }
    return _resertModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeBaseNavigationAppearance];
    [self initializeAppearance];
    [self initializeDataSource];
    
}

-(void)initializeBaseNavigationAppearance{
    
    self.title = @"重置密码";
    
}

-(void)initializeAppearance{
    
    [self.view addSubview:self.tableView];
}

-(void)initializeDataSource{
    
    
}

-(void)resertNetworkRequest{
    
    WEAKSELF
    NSDictionary * parameter = @{@"phone":self.resertModel.phone,@"code":self.resertModel.snsCode,@"new_pw":self.resertModel.password};
    [PublicMethod networkRequestWithPath:PATH_RESERTPASSWORD Parameters:parameter sender:nil begin:^{
        
        [weakSelf startActivityView];

    } success:^(id  _Nonnull object) {
        
        [weakSelf.navigationController popViewControllerAnimated:YES];
        
        [weakSelf stopActivityView];

    } error:^(id  _Nonnull object) {
        
        [PublicMethod alertControllerViewWithTitle:object[@"msg"] sender:weakSelf];
        
        [weakSelf stopActivityView];

    } failure:^(id  _Nonnull object) {
        
        [PublicMethod alertControllerViewWithTitle:object[@"msg"] sender:weakSelf];
        
        [weakSelf stopActivityView];

    }];
}

-(void)codeNetworkRequest:(UIButton *)codeBtn withPhone:(NSString *)phone{
    
    NSDictionary * parameter = @{@"phone":phone};
    
    codeBtn.userInteractionEnabled = NO;
    
    WEAKSELF
    
    [PublicMethod networkRequestWithPath:PATH_SNSCODE Parameters:parameter sender:nil begin:^{
        
    } success:^(id  _Nonnull object) {
        
        [weakSelf stratTimer:codeBtn];
        
    } error:^(id  _Nonnull object) {
        
        codeBtn.userInteractionEnabled = YES;
        
        [PublicMethod alertControllerViewWithTitle:object[@"msg"] sender:weakSelf];
        
    } failure:^(id  _Nonnull object) {
        
        codeBtn.userInteractionEnabled = YES;
        
        [PublicMethod alertControllerViewWithTitle:object[@"msg"] sender:weakSelf];
        
    }];
}
#pragma mark  **********  tableView  delegate  ********

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        return 140;
    }else if (indexPath.row == 4){
        
        return 150;
    }
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        LoginTitleTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"LoginTitleTableViewCell" forIndexPath:indexPath];
        
        return cell;
    }else if (indexPath.row == 2){
        
        PhoneCodeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PhoneCodeTableViewCell" forIndexPath:indexPath];
        
        cell.inputTextField.tag = INPUT_TAG + indexPath.row;
        
        cell.codeBtn.tag = INPUT_SNSCODE;

        
        [cell.codeBtn addTarget:self action:@selector(codeBtnClick) forControlEvents:UIControlEventTouchUpInside];

        
        return cell;
    }else if (indexPath.row == 4){
        
        ResertSureTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ResertSureTableViewCell" forIndexPath:indexPath];
        
        [cell.sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        return cell;
    }
    
    LoginInputTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"LoginInputTableViewCell" forIndexPath:indexPath];
    
    cell.inputTextField.tag = INPUT_TAG + indexPath.row;
    
    [cell addResertIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self.view endEditing:YES];
    
}

#pragma mark  -------  event click  -------

-(void)sureBtnClick{
    
    UITextField * inputTextField1  = (UITextField *)[self.view viewWithTag:INPUT_TAG + 1];
    
    UITextField * inputTextField2  = (UITextField *)[self.view viewWithTag:INPUT_TAG + 2];
    
    UITextField * inputTextField3  = (UITextField *)[self.view viewWithTag:INPUT_TAG + 3];
    
    if (inputTextField1.text.length != 11) {
        
        [PublicMethod alertControllerViewWithTitle:@"请输入正确的电话" sender:self];
        
    }else if (inputTextField2.text.length == 0){
        
        [PublicMethod alertControllerViewWithTitle:@"请输入验证码" sender:self];
        
    }else if (inputTextField3.text.length == 0){
        
        [PublicMethod alertControllerViewWithTitle:@"请输入新密码" sender:self];
        
    }else{
        
        self.resertModel.phone = inputTextField1.text;
        self.resertModel.snsCode = inputTextField2.text;
        self.resertModel.password = inputTextField3.text;

        [self resertNetworkRequest];
    }

}

-(void)codeBtnClick{
    
    UITextField * inputTextField = (UITextField *)[self.view viewWithTag:INPUT_TAG + 1];
    
    UIButton * codeBtn = (UIButton *)[self.view viewWithTag:INPUT_SNSCODE];
    
    
    if (inputTextField.text.length != 11) {
        
        [PublicMethod alertControllerViewWithTitle:@"请输入正确手机号码" sender:self];
        
    }else{
        
        [self codeNetworkRequest:codeBtn withPhone:inputTextField.text];
    }
}

#pragma mark  *********  snscode  *********

-(void)stratTimer:(UIButton *)timerBtn{
    
    __block NSInteger time = 59; //倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        
        if(time <= 0){ //倒计时结束，关闭
            
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置按钮的样式
                [timerBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
                [timerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                timerBtn.backgroundColor = RGB(23, 180, 235);
                timerBtn.titleLabel.font = [UIFont systemFontOfSize:13];
                timerBtn.userInteractionEnabled = YES;
            });
            
        }else{
            
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置按钮显示读秒效果
                [timerBtn setTitle:[NSString stringWithFormat:@"重新获取(%.2d)", seconds] forState:UIControlStateNormal];
                [timerBtn setTitleColor:RGB(162, 162, 162) forState:UIControlStateNormal];
                timerBtn.backgroundColor = RGB(227, 227, 227);
                timerBtn.titleLabel.font = [UIFont systemFontOfSize:11];
                timerBtn.userInteractionEnabled = NO;
            });
            time--;
        }
    });
    
    dispatch_resume(_timer);
}


@end
