//
//  LoginInputTableViewCell.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginInputTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UIImageView *inputImageView;

@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
//登陆
-(void)addIndex:(NSInteger)index;
//注册
-(void)addRegisterIndex:(NSInteger)index;
//修改
-(void)addResertIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
