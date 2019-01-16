//
//  SDBrowserImageView.h
//  lanlingdai
//
//  Created by zhaodq on 2018/11/23.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDWaitingView.h"


@interface SDBrowserImageView : UIImageView <UIGestureRecognizerDelegate>

@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, assign, readonly) BOOL isScaled;
@property (nonatomic, assign) BOOL hasLoadedImage;

- (void)eliminateScale; // 清除缩放

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;

- (void)doubleTapToZommWithScale:(CGFloat)scale;

- (void)clear;

@end
