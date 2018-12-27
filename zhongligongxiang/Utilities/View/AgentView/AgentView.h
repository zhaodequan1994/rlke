//
//  AgentView.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/18.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AgentView : UIView

@property (nonatomic,strong) UIButton * personalBtn;
@property (nonatomic,strong) UIButton * customBtn;


-(instancetype)initWithFrame:(CGRect)frame;

//show
-(void)agentShow;

//dissmiss
-(void)agentDissmiss;

@end

NS_ASSUME_NONNULL_END
