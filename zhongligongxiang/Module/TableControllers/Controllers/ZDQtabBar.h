//
//  ZDQtabBar.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/10.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ZDQtabBar;

//因为XPFTabBar继承自UITabBar
//所以成为XPFTabBar的代理，也必须实现UITabBar的代理协议
@protocol ZDQtabBarDelegate <UITabBarDelegate>

- (void)tabBarDidClickCenterButton:(ZDQtabBar *)tabBar;

@end

@interface ZDQtabBar : UITabBar

@property (nonatomic, weak) id<ZDQtabBarDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
