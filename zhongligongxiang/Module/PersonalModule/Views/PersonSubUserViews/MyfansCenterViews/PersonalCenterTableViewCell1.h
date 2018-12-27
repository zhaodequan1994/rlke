//
//  PersonalCenterTableViewCell1.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/24.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonalCenterTableViewCell1 : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *contentsView;
@property (weak, nonatomic) IBOutlet UIImageView *userImageview;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UILabel *shareLabel;
@property (weak, nonatomic) IBOutlet UILabel *commitLabel;
@property (weak, nonatomic) IBOutlet UILabel *zanLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *imagesCollectionView;

@end

NS_ASSUME_NONNULL_END
