//
//  LoginAndRegisterTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "LoginAndRegisterTableViewCell.h"

//Controllers
#import "RegisterViewController.h"
#import "ResetSecretViewController.h"

@implementation LoginAndRegisterTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.loginBtn.layer.masksToBounds = YES;
    self.loginBtn.layer.cornerRadius = self.loginBtn.frame.size.height/2;
    self.loginBtn.backgroundColor = RGB(255, 84, 85);
    [self.loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.registerBtn setTintColor:RGB(153, 153, 153)];
    [self.backSecrectBtn setTintColor:RGB(153, 153, 153)];
    [self.registerBtn addTarget:self action:@selector(registerBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.backSecrectBtn addTarget:self action:@selector(backSecrectBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.lineView.backgroundColor = RGB(177, 177, 179);
    

}

#pragma mark   ---------    event  click   -------

-(void)loginBtnClick{
    
    
}

-(void)registerBtnClick{
    
    self.fatherController.hidesBottomBarWhenPushed = YES;

    RegisterViewController * rvc = [[RegisterViewController alloc] init];
    
    [self.fatherController.navigationController pushViewController:rvc animated:YES];
}

-(void)backSecrectBtnClick{
    
    self.fatherController.hidesBottomBarWhenPushed = YES;
    
    ResetSecretViewController * rvc = [[ResetSecretViewController alloc] init];
    
    [self.fatherController.navigationController pushViewController:rvc animated:YES];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
