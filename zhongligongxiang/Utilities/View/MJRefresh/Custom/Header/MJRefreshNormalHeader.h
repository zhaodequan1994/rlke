//
//  MJRefreshNormalHeader.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "MJRefreshStateHeader.h"

@interface MJRefreshNormalHeader : MJRefreshStateHeader
@property (weak, nonatomic, readonly) UIImageView *arrowView;

/** 菊花的样式 */

@property (assign, nonatomic) UIActivityIndicatorViewStyle activityIndicatorViewStyle;
@end
