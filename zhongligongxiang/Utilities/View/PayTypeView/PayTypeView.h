//
//  PayTypeView.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/16.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PayTypeView : UIView

@property (nonatomic,copy) NSString * title;
@property (nonatomic,strong) UIViewController * fatherController;

-(instancetype)initWithFrame:(CGRect)frame;

//show
-(void)PayTypeShow;

//Dissmiss
-(void)payTypeDissmiss;

@end

NS_ASSUME_NONNULL_END
