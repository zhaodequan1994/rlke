//
//  BaseViewController.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

{
    __weak PublicManager *_publicManager;
}

@property (weak, nonatomic) PublicManager *publicManager;

//loading
@property (nonatomic,strong) UIActivityIndicatorView * activityView;

//super contentView

@property (nonatomic,assign) NSInteger superHeight;
@property (strong, nonatomic) UserModel * userModel;
@property (assign, nonatomic) BOOL isLogin;



// 开始加载
-(void)startActivityView;


// 结束加载
-(void)stopActivityView;

@end

NS_ASSUME_NONNULL_END
