//
//  AILoadingView.h
//  zhongligongxiang
//
//  Created by zhaodq on 2019/1/8.
//  Copyright © 2019 zhaodq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AILoadingView : UIView

/**开始动画*/
- (void)starAnimation;
/**停止动画*/
- (void)stopAnimation;
/**销毁动画*/
- (void)destroyAnimation;
/**一次动画所持续时长 默认2秒*/
@property(nonatomic,assign)NSTimeInterval duration;
/**线条颜色*/
@property (nonatomic, strong) UIColor *strokeColor;

@end
