//
//  SDCollectionViewCell.h
//  lanlingdai
//
//  Created by zhaodq on 2018/11/23.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SDPhotoItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface SDCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) UIImageView *imageView;

@property (nonatomic, strong) SDPhotoItem *item;

@end

NS_ASSUME_NONNULL_END
