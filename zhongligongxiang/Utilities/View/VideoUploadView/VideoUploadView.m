//
//  VideoUploadView.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/26.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "VideoUploadView.h"

@interface VideoUploadView ()

@property (nonatomic,strong) UIView * backView;
@property (nonatomic,strong) UIImageView * uploadImageView;
@property (nonatomic,strong) UILabel * titleLabel;
@property (nonatomic,strong) UILabel * subTitleLabel;


@end

@implementation VideoUploadView

-(UIView *)backView{
    
    if (!_backView) {
        _backView = [[UIView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 150)/2, SCREEN_HEIGHT * 0.37, 150, 150)];
        _backView.layer.masksToBounds = YES;
        _backView.layer.cornerRadius = 4.0f;
        _backView.backgroundColor = RGB(255, 255, 255);
    }
    return _backView;
}

-(UIImageView *)uploadImageView{
    
    if (!_uploadImageView) {
        _uploadImageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 35, 51, 30)];
        _uploadImageView.image = [UIImage imageNamed:@""];
    }
    return _uploadImageView;
}
-(UILabel *)titleLabel{
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.uploadImageView.frame.origin.y + self.uploadImageView.frame.size.height + 15, self.backView.frame.size.width, 13)];
        [_titleLabel SetLabelText:@"视频生成中..." textColor:RGB(51, 51, 51) textFont:14 textAlignment:NSTextAlignmentCenter];
    }
    return _titleLabel;
}
-(UILabel *)subTitleLabel{
    
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height + 15, self.backView.frame.size.width, 13)];
        [_subTitleLabel SetLabelText:@"42%" textColor:RGB(255, 84, 85) textFont:14 textAlignment:NSTextAlignmentCenter];
    }
    return _subTitleLabel;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        UIColor *color = [UIColor blackColor];
        self.backgroundColor = [color colorWithAlphaComponent:0.6];
    }
    
    return self;
}

-(void)videoUploadShow{
    
    [[PublicMethod getWindow] addSubview:self];
    
    [self addSubview:self.backView];
    [self.backView addSubview:self.uploadImageView];
    [self.backView addSubview:self.titleLabel];
    [self.backView addSubview:self.subTitleLabel];
    
}

@end
