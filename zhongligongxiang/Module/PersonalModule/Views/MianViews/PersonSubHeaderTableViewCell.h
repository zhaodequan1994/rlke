//
//  PersonSubHeaderTableViewCell.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/10.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonSubHeaderTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIView *contentsView;
@property (weak, nonatomic) IBOutlet UIView *contentsView1;
@property (weak, nonatomic) IBOutlet UILabel *moeyLabel1;
@property (weak, nonatomic) IBOutlet UILabel *moneyNameLabel1;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel2;
@property (weak, nonatomic) IBOutlet UILabel *moneyNameLabel2;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel3;
@property (weak, nonatomic) IBOutlet UILabel *moneyNameLabel3;
@property (weak, nonatomic) IBOutlet UIView *horizlineView;
@property (weak, nonatomic) IBOutlet UIView *verticalLineView;
@property (weak, nonatomic) IBOutlet UIButton *moneyBtn;
@property (weak, nonatomic) IBOutlet UIButton *withDrawalBtn;

@property (nonatomic,strong) UIViewController * fatherController;

@end

NS_ASSUME_NONNULL_END
