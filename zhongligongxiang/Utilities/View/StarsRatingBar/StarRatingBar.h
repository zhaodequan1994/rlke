//
//  StarRatingBar.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/18.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StarRatingBar;

typedef void(^finishBlock)(CGFloat currentScore);

typedef NS_ENUM(NSInteger, RateStyle)
{
    WholeStar = 0, //只能整星评论
    HalfStar = 1,  //允许半星评论
    IncompleteStar = 2  //允许不完整星评论
};

@protocol StarRatingBarDelegate <NSObject>

-(void)starRateView:(StarRatingBar *)starRateView currentScore:(CGFloat)currentScore;

@end

@interface StarRatingBar : UIView

@property (nonatomic,assign)BOOL isAnimation;       //是否动画显示，默认NO
@property (nonatomic,assign)RateStyle rateStyle;    //评分样式    默认是WholeStar
@property (nonatomic, weak) id<StarRatingBarDelegate>delegate;


-(instancetype)initWithFrame:(CGRect)frame;
-(instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars rateStyle:(RateStyle)rateStyle isAnination:(BOOL)isAnimation delegate:(id)delegate;

-(instancetype)initWithFrame:(CGRect)frame finish:(finishBlock)finish;
-(instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars rateStyle:(RateStyle)rateStyle isAnination:(BOOL)isAnimation finish:(finishBlock)finish;

@end
