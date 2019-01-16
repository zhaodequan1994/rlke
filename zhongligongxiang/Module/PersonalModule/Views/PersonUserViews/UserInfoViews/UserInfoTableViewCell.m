//
//  UserInfoTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/27.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "UserInfoTableViewCell.h"

@interface UserInfoTableViewCell ()

@property (nonatomic,strong) NSMutableArray * nameArray;

@end

@implementation UserInfoTableViewCell

-(NSMutableArray *)nameArray{
    
    if (!_nameArray) {
        _nameArray = [[NSMutableArray alloc] initWithObjects:@"昵称",@"性别",@"年龄",@"实名认证", nil];
    }
    return _nameArray;
}

-(void)addIndex:(NSInteger)index withModel:(nonnull UserModel *)userModel{
    
    self.lineView.hidden = NO;

    self.nameLabel.text = self.nameArray[index - 1];
    
    if (index == 1) {
        
        self.subNameLabel.text = userModel.name;
        
    }else if (index == 2){
        
        if (userModel.sex.integerValue == SexTypeFemale) {
            
            self.subNameLabel.text = @"女";

        }else if (userModel.sex.integerValue == SexTypeMale){
            
            self.subNameLabel.text = @"男";

        }else{
            
            self.subNameLabel.text = @"未知";
        }
        
    }else if (index == 3){
        
        self.subNameLabel.text = userModel.age;
        
    }else if (index == 4){
        
        self.subNameLabel.text = @"未认证";
        self.subNameLabel.textColor = RGB(255, 84, 85);
        self.lineView.hidden = YES;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    self.lineView.backgroundColor = RGB(230, 230, 230);
    self.subNameLabel.textColor = RGB(179, 179, 179);
    self.nameLabel.textColor = RGB(51, 51, 51);
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
