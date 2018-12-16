//
//  PayTypeTitleTableViewCell.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/16.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PayTypeTitleTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIButton *cannerBtn;
@property (weak, nonatomic) IBOutlet UIView *lineView;

-(void)addTitleString:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
