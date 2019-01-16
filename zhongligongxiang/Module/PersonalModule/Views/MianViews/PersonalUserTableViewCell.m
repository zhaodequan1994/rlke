//
//  PersonalUserTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/10.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "PersonalUserTableViewCell.h"

//Controllers
#import "MyFollowViewController.h"
#import "MyFansViewController.h"
#import "MyCommitsViewController.h"

//Views
#import "AssistView.h"

@interface PersonalUserTableViewCell ()

@property (nonatomic,strong) PersoalUserModel * personalModel;

@end

@implementation PersonalUserTableViewCell

-(void)addModel:(PersoalUserModel *)model{
    
    self.fansTitileLabel.text = model.fans_num;
    
    self.followTitleLabel.text = model.follows_num;
    
    self.zanTitleLabel.text = model.th_nums;
    
    self.zanedTitleLabel.text = model.get_th_nums;
    
    self.personalModel = model;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    self.fansSubTitleLabel.textColor = RGB(102, 102, 102);
    self.followSubTitleLabel.textColor = RGB(102, 102, 102);
    self.zanSubTitleLabel.textColor = RGB(102, 102, 102);
    self.zanedSubtitleLabel.textColor = RGB(102, 102, 102);
    self.myVideoLabel.textColor = RGB(102, 102, 102);
    self.myCollectionLabel.textColor = RGB(102, 102, 102);
    self.myCommitLabel.textColor = RGB(102, 102, 102);
    self.myBrowseLabel.textColor = RGB(102, 102, 102);

    [self.followBtn addTarget:self action:@selector(followBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.fansBtn addTarget:self action:@selector(fansBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.myCommitBtn addTarget:self action:@selector(myCommitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.zanedBtn addTarget:self action:@selector(zanedBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.zanBtn addTarget:self action:@selector(zanBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.myVideoBtn addTarget:self action:@selector(myVideoBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.myCollectionBtn addTarget:self action:@selector(myCollectionBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.myBrowseBtn addTarget:self action:@selector(myBrowseBtnClick) forControlEvents:UIControlEventTouchUpInside];


}

#pragma mark --------  event click  -------

-(void)followBtnClick{
    
    if (self.fatherController.isLogin) {
        
        self.fatherController.hidesBottomBarWhenPushed = YES;
        
        MyFollowViewController * mfvc =[[MyFollowViewController alloc] init];
        
        [self.fatherController.navigationController pushViewController:mfvc animated:YES];
        
        self.fatherController.hidesBottomBarWhenPushed = NO;
        
    }else{
        
        [PublicMethod PushToLoginViewController:self.fatherController];
    }
    
}

-(void)fansBtnClick{
    
    if (self.fatherController.isLogin) {
        
        self.fatherController.hidesBottomBarWhenPushed = YES;
        
        MyFansViewController * mfvc =[[MyFansViewController alloc] init];
        
        [self.fatherController.navigationController pushViewController:mfvc animated:YES];
        
        self.fatherController.hidesBottomBarWhenPushed = NO;

    }else{
        
        [PublicMethod PushToLoginViewController:self.fatherController];
    }

}

-(void)myCommitBtnClick{
    
    if (self.fatherController.isLogin) {
        
        self.fatherController.hidesBottomBarWhenPushed = YES;
        
        MyCommitsViewController * mcvc =[[MyCommitsViewController alloc] init];
        
        [self.fatherController.navigationController pushViewController:mcvc animated:YES];
        
        self.fatherController.hidesBottomBarWhenPushed = NO;

    }else{
        
        [PublicMethod PushToLoginViewController:self.fatherController];
    }
    
}

-(void)zanedBtnClick{
    
    if (self.fatherController.isLogin) {
        
        AssistView * assistView = [[AssistView alloc] initWithFrame:SCREEN_RECT];
        assistView.contentText = [NSString stringWithFormat:@"共赞了%@个",self.personalModel.th_nums];
        [assistView assistShow];

    }else{
        
        [PublicMethod PushToLoginViewController:self.fatherController];
    }

}

-(void)zanBtnClick{
    
    if (self.fatherController.isLogin) {
        
        AssistView * assistView = [[AssistView alloc] initWithFrame:SCREEN_RECT];
        assistView.contentText = [NSString stringWithFormat:@"获得了%@个赞",self.personalModel.get_th_nums];
        [assistView assistShow];

    }else{
        
        [PublicMethod PushToLoginViewController:self.fatherController];
    }


}

-(void)myBrowseBtnClick{
    
    if (self.fatherController.isLogin) {

    }else{
        
        [PublicMethod PushToLoginViewController:self.fatherController];
    }
}
-(void)myVideoBtnClick{
    
    if (self.fatherController.isLogin) {
        
    }else{
        
        [PublicMethod PushToLoginViewController:self.fatherController];
    }
    
}
-(void)myCollectionBtnClick{
    
    if (self.fatherController.isLogin) {
        
    }else{
        
        [PublicMethod PushToLoginViewController:self.fatherController];
    }

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
