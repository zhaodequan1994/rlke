//
//  LoadView.m
//  zhongligongxiang
//
//  Created by zhaodq on 2019/1/16.
//  Copyright © 2019 zhaodq. All rights reserved.
//

#import "LoadView.h"

@implementation LoadView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 菊花背景的大小
        self.frame = CGRectMake((SCREEN_WIDTH - 100)/2, (SCREEN_HEIGHT - 100)/2, 100, 100);
        // 菊花的背景色
        self.backgroundColor = [UIColor blackColor];
        self.layer.cornerRadius = 10;
        // 菊花的颜色和格式（白色、白色大、灰色）
        self.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        // 在菊花下面添加文字
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 60, 80, 40)];
        label.text = @"loading...";
        label.font = [UIFont systemFontOfSize:14];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        [self addSubview:label];
    }
    return  self;
}

@end
