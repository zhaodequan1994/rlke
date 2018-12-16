//
//  LoginAndRegisterTableViewCell.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginAndRegisterTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIView *lineView;

@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UIButton *backSecrectBtn;

@property (nonatomic,strong) UIViewController * fatherController;

@end

NS_ASSUME_NONNULL_END
