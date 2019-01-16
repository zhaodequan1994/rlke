//
//  SDCollectionViewCell.m
//  lanlingdai
//
//  Created by zhaodq on 2018/11/23.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "SDCollectionViewCell.h"

@implementation SDCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}

- (void)setupView
{
    UIImageView *imageView = [UIImageView new];
    [self.contentView addSubview:imageView];
    self.imageView = imageView;
    
    self.backgroundColor = [UIColor orangeColor];
}

- (void)setItem:(SDPhotoItem *)item
{
    _item = item;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:item.thumbnail_pic]];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = self.bounds;
}

@end
