//
//  IssureImageCollectionViewCell.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/26.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IssureImageCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIView *contentsView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *delectBtn;

@end

NS_ASSUME_NONNULL_END
