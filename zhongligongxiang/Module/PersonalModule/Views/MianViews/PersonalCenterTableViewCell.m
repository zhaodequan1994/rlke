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
    
    self.fatherController.hidesBottomBarWhenPushed = YES;
    
    SharedListViewController * slvc =[[SharedListViewController alloc] init];
    
    [self.fatherController.navigationController pushViewController:slvc animated:YES];
    
    self.fatherController.hidesBottomBarWhenPushed = NO;
}
-(void)billBtnClick{
    
    self.fatherController.hidesBottomBarWhenPushed = YES;
    
    BillLsitViewController * blvc =[[BillLsitViewController alloc] init];
    
    [self.fatherController.navigationController pushViewController:blvc animated:YES];
    
    self.fatherController.hidesBottomBarWhenPushed = NO;
}

-(void)evaluateBtnClick{
    
    
}

-(void)recommendBtnClick{
    
    self.fatherController.hidesBottomBarWhenPushed = YES;
    
    MyRecommedCodeViewController * mrvc =[[MyRecommedCodeViewController alloc] init];
    
    [self.fatherController.navigationController pushViewController:mrvc animated:YES];
    
    self.fatherController.hidesBottomBarWhenPushed = NO;
}

-(void)agentBtnClick{
    
    self.agentView = [[AgentView alloc] initWithFrame:SCREEN_RECT];
    [self.agentView agentShow];
    [self.agentView.personalBtn addTarget:self action:@selector(personalBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)authenBtnClick{
    
    self.fatherController.hidesBottomBarWhenPushed = YES;
    
    AuthenViewController * atvc  = [[AuthenViewController alloc] init];
    
    [self.fatherController.navigationController pushViewController:atvc animated:YES];
    
    self.fatherController.hidesBottomBarWhenPushed = NO;
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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
