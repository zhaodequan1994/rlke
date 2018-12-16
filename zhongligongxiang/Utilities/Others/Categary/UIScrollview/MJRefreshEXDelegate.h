//
//  MJRefreshEXDelegate.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MJRefreshEXDelegate <NSObject>

@optional
/**
 *    下拉 重新加载数据
 */
- (void)onRefreshing:(id)control;

@optional
/**
 *    上拉 加载更多数据
 */
- (void)onLoadingMoreData:(id)control pageNum:(NSNumber *)pageNum;

@end


