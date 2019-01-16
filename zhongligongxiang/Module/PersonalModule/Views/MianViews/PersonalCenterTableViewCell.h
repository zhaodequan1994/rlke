//
//  PersonalCenterTableViewCell.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/10.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <UIKit/UIKit.h>

//Models
#import "PersoalUserModel.h"

//Controllers
#import "HomePersonalViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PersonalCenterTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *billLabel;
@property (weak, nonatomic) IBOutlet UIButton *billBtn;
@property (weak, nonatomic) IBOutlet UILabel *grabLabel;
@property (weak, nonatomic) IBOutlet UIButton *grabBtn;
@property (weak, nonatomic) IBOutlet UILabel *evaluateLabel;
@property (weak, nonatomic) IBOutlet UIButton *evaluateBtn;
@property (weak, nonatomic) IBOutlet UILabel *authenLabel;
@property (weak, nonatomic) IBOutlet UIButton *authenBtn;
@property (weak, nonatomic) IBOutlet UILabel *myRecommendLabel;

@property (weak, nonatomic) IBOutlet UIButton *recommendBtn;
@property (weak, nonatomic) IBOutlet UILabel *agentLabel;

@property (weak, nonatomic) IBOutlet UIButton *agentBtn;
@property (weak, nonatomic) IBOutlet UILabel *customLabel;
@property (weak, nonatomic) IBOutlet UIButton *customBtn;

@property (nonatomic,strong) HomePersonalViewController * fatherController;

@property (nonatomic,strong) PersoalUserModel * personalModel;

@end

NS_ASSUME_NONNULL_END
