//
//  PersonalAgentInfoTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2019/1/4.
//  Copyright © 2019 zhaodq. All rights reserved.
//

#import "PersonalAgentInfoTableViewCell.h"

@interface PersonalAgentInfoTableViewCell ()

@property (nonatomic,strong) NSMutableArray * titleNameArray;
@property (nonatomic,strong) NSMutableArray * placeHolderArray;

@end

@implementation PersonalAgentInfoTableViewCell

-(NSMutableArray *)titleNameArray{
    
    if (!_titleNameArray) {
        _titleNameArray = [[NSMutableArray alloc] initWithObjects:@"联系人",@"联系方式",@"邮政编码",@"所在地区",@"详细地址", nil];
    }
    return _titleNameArray;
}
-(NSMutableArray *)placeHolderArray{
    
    if (!_placeHolderArray) {
        _placeHolderArray = [[NSMutableArray alloc] initWithObjects:@"请填写姓名",@"请填写手机号",@"请填写邮政编码(选填)",@"请选择所在地区",@"请填写详细地址", nil];
    }
    return _placeHolderArray;
}

-(void)addIndex:(NSInteger)index{
    
    self.titleLabel.text = self.titleNameArray[index];
    self.inputTextField.placeholder = self.placeHolderArray[index];
    if (index == 3) {
        
        self.arrowImageView.hidden = NO;
    }else{
        
        self.arrowImageView.hidden = YES;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.titleLabel.textColor = RGB(51, 51, 51);
    
    self.lineView.backgroundColor = RGB(230, 230, 230);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
