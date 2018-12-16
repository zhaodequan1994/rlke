//
//  CommitSuccessView.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/16.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "CommitSuccessView.h"

@interface CommitSuccessView ()

@property (nonatomic,strong) UIView * contentbackView;
@property (nonatomic,strong) UIView * backView;
@property (nonatomic,strong) UIImageView * successImageView;
@property (nonatomic,strong) UILabel * subTitileLabel;
@property (nonatomic,strong) UITapGestureRecognizer * gestureRecognizer;


@end

@implementation CommitSuccessView

-(UIView *)contentbackView{
    
    if (!_contentbackView) {
        _contentbackView = [[UIView alloc] initWithFrame:SCREEN_RECT];
    }
    return _contentbackView;
}

-(UIView *)backView{
    
    if (!_backView) {
        _backView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.3, SCREEN_HEIGHT * 0.37, SCREEN_WIDTH * 0.4, 0.4*SCREEN_WIDTH)];
        _backView.layer.masksToBounds = YES;
        _backView.layer.cornerRadius = 4.0f;
        _backView.backgroundColor = RGB(255, 255, 255);
    }
    return _backView;
}

-(UIImageView *)successImageView{
    
    if (!_successImageView) {
        _successImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.backView.frame.size.width * 0.3, self.backView.frame.size.height * 0.2, self.backView.frame.size.height * 0.4, self.backView.frame.size.height * 0.44)];
        _successImageView.image = [UIImage imageNamed:@"View_commitsuccessed"];
    }
    return _successImageView;
}

-(UILabel *)subTitileLabel{
    
    if (!_subTitileLabel) {
        _subTitileLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.successImageView.frame.origin.y + self.successImageView.frame.size.height + self.backView.frame.size.height * 0.1, self.backView.frame.size.width, 16)];
        [_subTitileLabel SetLabelText:@"评价成功" textColor:RGB(51, 51, 51) textFont:16 textAlignment:NSTextAlignmentCenter];
    }
    return _subTitileLabel;
}

-(UITapGestureRecognizer *)gestureRecognizer{
    
    if (!_gestureRecognizer) {
        _gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doTapTouch)];
        _gestureRecognizer.numberOfTapsRequired = 1;
    }
    return _gestureRecognizer;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        UIColor *color = [UIColor blackColor];
        self.backgroundColor = [color colorWithAlphaComponent:0.6];
    }
    
    return self;
}

-(void)commitSuccessShow{
    
    [[PublicMethod getWindow] addSubview:self];
    
    [self addSubview:self.contentbackView];
    [self.contentbackView addSubview:self.backView];
    [self.backView addSubview:self.successImageView];
    [self.backView addSubview:self.subTitileLabel];
    [self.contentbackView addGestureRecognizer:self.gestureRecognizer];
}


#pragma mark  -------  guster   -------

-(void)doTapTouch{
    
    [self removeFromSuperview];
}

@end
