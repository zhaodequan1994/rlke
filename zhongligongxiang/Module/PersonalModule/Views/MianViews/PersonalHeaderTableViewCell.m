//
//  PersonalHeaderTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/10.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "PersonalHeaderTableViewCell.h"

//Controllers
#import "AuthenViewController.h"
#import "UserInfoViewController.h"
#import "ScanCodeViewController.h"


@interface PersonalHeaderTableViewCell ()

@property (nonatomic, strong) ScanCodeViewController *scanVC;

@end

@implementation PersonalHeaderTableViewCell

-(ScanCodeViewController *)scanVC{
    
    if (!_scanVC) {
        _scanVC = [[ScanCodeViewController alloc] init];
    }
    return _scanVC;
}

-(void)addModel:(UserModel *)model{
    
    self.titleLabel.text = model.name;
    
    [self.userImageView setImageWithImageName:model.avatar placeholderImageName:@"1.png"];
    
    if (model.is_real.integerValue == 1) {
        
        self.subTitleLabel.text = @"已认证";
        
    }else{
        
        self.subTitleLabel.text = @"申请认证";

    }
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.backgroundColor = RGB(255, 84, 85);
    self.userImageView.layer.masksToBounds = YES;
    self.userImageView.layer.cornerRadius = self.userImageView.frame.size.height/2;
    self.subTitleLabel.layer.masksToBounds = YES;
    self.subTitleLabel.layer.cornerRadius = 12.0f;
    self.subTitleLabel.backgroundColor = RGB(255, 179, 25);
    self.headerBackView.backgroundColor = RGB(255, 84, 85);
    
    [self.applyBtn addTarget:self action:@selector(applyBtnClick) forControlEvents:UIControlEventTouchUpInside];

    [self.userInfoBtn addTarget:self action:@selector(userInfoBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.userImageBtn addTarget:self action:@selector(userImageBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.setBtn addTarget:self action:@selector(setBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.cammeraBtn addTarget:self action:@selector(cammeraBtnClick) forControlEvents:UIControlEventTouchUpInside];

}

#pragma mark  ---------  event  click  --------

-(void)applyBtnClick{
    
    if (self.fatherController.isLogin) {
        
        if (self.fatherController.userModel.is_real.integerValue == 1) {
            
            [PublicMethod alertControllerViewWithTitle:@"已认证" sender:self.fatherController];
            
        }else{
            
            self.fatherController.hidesBottomBarWhenPushed = YES;
            
            AuthenViewController * atvc  = [[AuthenViewController alloc] init];
            
            [self.fatherController.navigationController pushViewController:atvc animated:YES];
            
            self.fatherController.hidesBottomBarWhenPushed = NO;
        }
        
    }else{
        
        [PublicMethod PushToLoginViewController:self.fatherController];
    }
    
}

-(void)userInfoBtnClick{
    
    if (self.fatherController.isLogin) {
        
        self.fatherController.hidesBottomBarWhenPushed = YES;
        
        UserInfoViewController * ufvc  = [[UserInfoViewController alloc] init];
                        
        [self.fatherController.navigationController pushViewController:ufvc animated:YES];
        
        self.fatherController.hidesBottomBarWhenPushed = NO;

    }else{
        
        [PublicMethod PushToLoginViewController:self.fatherController];

    }

}

-(void)userImageBtnClick{
    
    if (self.fatherController.isLogin) {
        
    }else{
        
        [PublicMethod PushToLoginViewController:self.fatherController];
        
    }
}
-(void)setBtnClick{
    
    if (self.fatherController.isLogin) {
        
    }else{
        
        [PublicMethod PushToLoginViewController:self.fatherController];
        
    }
}
-(void)cammeraBtnClick{
    
    if (self.fatherController.isLogin) {
        
        WEAKSELF
        self.scanVC.resultBlock = ^(NSString *string){
            
            
            
        };
        
        self.fatherController.hidesBottomBarWhenPushed = YES;
        
        [self.fatherController.navigationController pushViewController:self.scanVC animated:YES];

        
    }else{
        
        [PublicMethod PushToLoginViewController:self.fatherController];
        
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
