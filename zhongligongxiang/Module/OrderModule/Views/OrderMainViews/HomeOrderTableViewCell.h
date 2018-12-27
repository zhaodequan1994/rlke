//
//  HomeOrderTableViewCell.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/18.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeOrderTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *contentsView;
@property (weak, nonatomic) IBOutlet UIView *contentsView1;
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UIImageView *peopleImageView;
@property (weak, nonatomic) IBOutlet UIImageView *addressImageView;
@property (weak, nonatomic) IBOutlet UIImageView *detialImageView;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *peopleNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *detialLabel;

@end

NS_ASSUME_NONNULL_END
