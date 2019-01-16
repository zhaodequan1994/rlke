//
//  PersonalCenterTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/10.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "PersonalCenterTableViewCell.h"

//Controllers
#import "SharedListViewController.h"
#import "BillLsitViewController.h"
#import "MyRecommedCodeViewController.h"
#import "AuthenViewController.h"
#import "PersonalAgentViewController.h"
#import "CommitedViewController.h"
#import "PersonalPopularizeViewController.h"

//View
#import "AgentView.h"


@interface PersonalCenterTableViewCell ()

@property (nonatomic,strong) AgentView * agentView;

@end

@implementation PersonalCenterTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    self.billLabel.textColor = RGB(102, 102, 102);
    self.grabLabel.textColor = RGB(102, 102, 102);
    self.evaluateLabel.textColor = RGB(102, 102, 102);
    self.authenLabel.textColor = RGB(102, 102, 102);
    self.myRecommendLabel.textColor = RGB(102, 102, 102);
    self.agentLabel.textColor = RGB(102, 102, 102);
    self.customLabel.textColor = RGB(102, 102, 102);

    [self.grabBtn addTarget:self action:@selector(grabBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.billBtn addTarget:self action:@selector(billBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.recommendBtn addTarget:self action:@selector(recommendBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.agentBtn addTarget:self action:@selector(agentBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.authenBtn addTarget:self action:@selector(authenBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.customBtn addTarget:self action:@selector(customBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.evaluateBtn addTarget:self action:@selector(evaluateBtnClick) forControlEvents:UIControlEventTouchUpInside];

}

#pragma mark  -------event  click  ------

-(void)grabBtnClick{
    
    if (self.fatherController.isLogin) {
        
        self.fatherController.hidesBottomBarWhenPushed = YES;
        
        SharedListViewController * slvc =[[SharedListViewController alloc] init];
        
        [self.fatherController.navigationController pushViewController:slvc animated:YES];
        
        self.fatherController.hidesBottomBarWhenPushed = NO;
    }else{
        
        [PublicMethod PushToLoginViewController:self.fatherController];
    }

}
-(void)billBtnClick{
    
    if (self.fatherController.isLogin) {
        
        self.fatherController.hidesBottomBarWhenPushed = YES;
        
        BillLsitViewController * blvc =[[BillLsitViewController alloc] init];
        
        [self.fatherController.navigationController pushViewController:blvc animated:YES];
        
        self.fatherController.hidesBottomBarWhenPushed = NO;

    }else{
        
        [PublicMethod PushToLoginViewController:self.fatherController];
    }

}

-(void)evaluateBtnClick{
    
    if (self.fatherController.isLogin) {
        
        self.fatherController.hidesBottomBarWhenPushed = YES;
        
        CommitedViewController * cvc =[[CommitedViewController alloc] init];
        
        [self.fatherController.navigationController pushViewController:cvc animated:YES];
        
        self.fatherController.hidesBottomBarWhenPushed = NO;

        
    }else{
        
        [PublicMethod PushToLoginViewController:self.fatherController];
    }
}

-(void)recommendBtnClick{
    
    if (self.fatherController.isLogin) {
        
        self.fatherController.hidesBottomBarWhenPushed = YES;
        
        MyRecommedCodeViewController * mrvc =[[MyRecommedCodeViewController alloc] init];
        
        [self.fatherController.navigationController pushViewController:mrvc animated:YES];
        
        self.fatherController.hidesBottomBarWhenPushed = NO;

    }else{
        
        [PublicMethod PushToLoginViewController:self.fatherController];
    }

}

-(void)agentBtnClick{
    
    if (self.fatherController.isLogin) {
        
        self.agentView = [[AgentView alloc] initWithFrame:SCREEN_RECT];
        [self.agentView agentShow];
        [self.agentView.personalBtn addTarget:self action:@selector(personalBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.agentView.customBtn addTarget:self action:@selector(customBtnedClick) forControlEvents:UIControlEventTouchUpInside];

    }else{
        
        [PublicMethod PushToLoginViewController:self.fatherController];
    }


}

-(void)authenBtnClick{
    
    if (self.fatherController.isLogin) {
        
        if (self.personalModel.is_real.integerValue == 1) {
            
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

-(void)customBtnClick{
    
    
    [PublicMethod callPhone:self.fatherController phone:CALL_PHONE];
}

-(void)personalBtnClick{
    
    [self.agentView agentDissmiss];
    
    self.fatherController.hidesBottomBarWhenPushed = YES;
    
    PersonalAgentViewController * pavc  = [[PersonalAgentViewController alloc] init];
    
    [self.fatherController.navigationController pushViewController:pavc animated:YES];
    
    self.fatherController.hidesBottomBarWhenPushed = NO;

}

-(void)customBtnedClick{
    
    [self.agentView agentDissmiss];
    
    self.fatherController.hidesBottomBarWhenPushed = YES;
    
    PersonalPopularizeViewController * pavc  = [[PersonalPopularizeViewController alloc] init];
    
    [self.fatherController.navigationController pushViewController:pavc animated:YES];
    
    self.fatherController.hidesBottomBarWhenPushed = NO;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
