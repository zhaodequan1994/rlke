//
//  BalanceHeaderTableViewCell.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/11.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BalanceHeaderTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *contentBackView;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *rechargeBtn;
@property (weak, nonatomic) IBOutlet UIButton *withDrawalBtn;
@property (weak, nonatomic) IBOutlet UIView *btnsBackView;
@property (weak, nonatomic) IBOutlet UIView *rechageView;
@property (weak, nonatomic) IBOutlet UIView *drawalView;


@property (nonatomic,strong) UIViewController * fatherController;

@end

NS_ASSUME_NONNULL_END
