//
//  OrdertialCannerBtnTableViewCell.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/16.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OrdertialCannerBtnTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *cannerBtn;

@property (nonatomic,strong) UIViewController * fahterConroller;
@property (nonatomic,assign) BOOL isDetial;

-(void)addCannerState:(BOOL)isDetial;

@end



NS_ASSUME_NONNULL_END
