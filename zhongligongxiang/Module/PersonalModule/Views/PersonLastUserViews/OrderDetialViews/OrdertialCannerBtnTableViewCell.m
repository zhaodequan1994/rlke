//
//  OrdertialCannerBtnTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/16.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "OrdertialCannerBtnTableViewCell.h"

@implementation OrdertialCannerBtnTableViewCell

-(void)addCannerState:(BOOL)isDetial{
    
    if (isDetial) {
        
        [self.cannerBtn setTitle:@"取消发单" forState:UIControlStateNormal];
        
        [self.cannerBtn addTarget:self action:@selector(cannerBtnClick) forControlEvents:UIControlEventTouchUpInside];

    }else{
        
        [self.cannerBtn setTitle:@"立即导航" forState:UIControlStateNormal];
        
        [self.cannerBtn addTarget:self action:@selector(navigationClick) forControlEvents:UIControlEventTouchUpInside];


    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.cannerBtn.layer.masksToBounds = YES;
    self.cannerBtn.layer.cornerRadius = self.cannerBtn.frame.size.height/2;
    self.backgroundColor = RGB(247, 247, 247);
    
}

#pragma mark  -------- event click  -------

-(void)cannerBtnClick{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"是否取消发单？"message:@"如取消发单需扣除发单总金额的20%作为违约金" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"再想想" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
    }]];

    
    [self.fahterConroller presentViewController:alert animated:YES completion:nil];

}

-(void)navigationClick{
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
