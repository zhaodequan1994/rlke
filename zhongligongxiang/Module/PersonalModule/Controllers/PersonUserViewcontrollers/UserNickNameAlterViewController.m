//
//  UserNickNameAlterViewController.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/27.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "UserNickNameAlterViewController.h"

@interface UserNickNameAlterViewController ()

@property (nonatomic,strong) UIView * textBackView;
@property (nonatomic,strong) UITextField * nameTextField;


@end

@implementation UserNickNameAlterViewController

-(UIView *)textBackView{
    
    if (!_textBackView) {
        _textBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 5, SCREEN_WIDTH, 55)];
        _textBackView.backgroundColor = RGB(255, 255, 255);
    }
    return _textBackView;
}

-(UITextField *)nameTextField{
    
    if (!_nameTextField) {
        _nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(15, 12.5, SCREEN_WIDTH - 30, 30)];
        _nameTextField.backgroundColor = [UIColor whiteColor];
        _nameTextField.borderStyle = UITextBorderStyleNone;
        _nameTextField.placeholder = @"请输入昵称";
        _nameTextField.font = [UIFont systemFontOfSize:16];
        _nameTextField.keyboardType = UIKeyboardTypeDefault;
        _nameTextField.clearButtonMode = UITextFieldViewModeAlways;
        [_nameTextField addTarget:self action:@selector(nameTextFieldDidChange:) forControlEvents:UIControlEventEditingChanged];

    }
    return _nameTextField;
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
    
    self.title = @"修改昵称";
}

-(void)initializeAppearance{
    
    [self setRightBtn];

    [self.view addSubview:self.textBackView];
    [self.textBackView addSubview:self.nameTextField];
}

-(void)initializeDataSource{
    
    self.view.backgroundColor = RGB(247, 247, 247);
    
}

-(void)networkRequest{
    
    WEAKSELF
    NSDictionary * parameter = @{@"uid":self.userModel.userId,@"name":self.nameTextField.text};
    
    [PublicMethod networkRequestWithPath:PATH_MODIFYINFO Parameters:parameter sender:nil begin:^{
        
        [weakSelf startActivityView];

    } success:^(id  _Nonnull object) {
        
        [[PublicManager shareInstance].userObjectManager encodeUserModelObject:object[@"data"] superUserModel:self.userModel];
        
        [weakSelf.delegate infoUpdateDelegate];
        
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

#pragma mark   --------  other  -------

-(void)setRightBtn{
    
    [self.rightBtn setTitle:@"保存" forState:UIControlStateNormal];
    [self.rightBtn setTitleColor:RGB(255, 84, 85) forState:UIControlStateNormal];

}

-(void)nameTextFieldDidChange:(id)sender{
    
    UITextField * textfield = (UITextField *)sender;
    
    if (textfield.text.length > 10) {
        
        textfield.text = [textfield.text substringToIndex:10];
    }

}

#pragma mark   --------  right  click  -------

-(void)rightBtnClick{
    
    if (self.nameTextField.text.length == 0) {
        
        [PublicMethod alertControllerViewWithTitle:@"请输入昵称" sender:self];
    }else{
        
        [self networkRequest];
    }
}
@end
