//
//  RechargeAndWithDrawHeaderTableViewCell.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/14.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <UIKit/UIKit.h>
//Model
#import "RechargeAndDrawTypeModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface RechargeAndWithDrawHeaderTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *titleBackView;
@property (weak, nonatomic) IBOutlet UILabel *balanceLabel;
@property (weak, nonatomic) IBOutlet UITextField *moneyTextField;
@property (weak, nonatomic) IBOutlet UIView *middleLineView;
@property (weak, nonatomic) IBOutlet UILabel *moneyTypeLabel;
@property (weak, nonatomic) IBOutlet UIButton *rechargeAndDrawBtn;
@property (weak, nonatomic) IBOutlet UIView *bottomLineView;
@property (weak, nonatomic) IBOutlet UIButton *moneyTypeBtn;
@property (weak, nonatomic) IBOutlet UILabel *tipsLabel;

@property (weak, nonatomic) IBOutlet UILabel *moneyTitleTypeLabel;

@property (nonatomic,strong) UIViewController * fatheController;

-(void)addContntModel:(RechargeAndDrawTypeModel *)rechargeModel;

@end

NS_ASSUME_NONNULL_END
