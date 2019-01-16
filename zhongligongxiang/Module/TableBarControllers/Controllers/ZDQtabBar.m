//
//  ZDQtabBar.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/10.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "ZDQtabBar.h"

@implementation ZDQtabBar

- (nonnull instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        UIButton *publishButton = [[UIButton alloc] init];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabbar_add"] forState:UIControlStateNormal];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabbar_add"] forState:UIControlStateHighlighted];
        
        [self addSubview:publishButton];
        
        
        [publishButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(publishButton).insets(UIEdgeInsetsMake(0, 0, 0, 0));
            make.center.mas_equalTo(self);
            make.size.mas_equalTo([publishButton backgroundImageForState:(UIControlStateNormal)].size);

        }];
        [publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)publishClick {
    NSLog(@" 放学别走  接下来要执行 delete 了 ");
    [self.delegate tabBarDidClickCenterButton:self];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 原来的4个
    CGFloat width = self.xpf_width / 5;
    int index = 0;
    for (UIControl *control in self.subviews) {
        if (![control isKindOfClass:[UIControl class]] || [control isKindOfClass:[UIButton class]]) continue;
        control.xpf_width = width;
        control.xpf_x = index > 1 ? width * (index + 1) : width * index;
        index++;
    }
}

@end
