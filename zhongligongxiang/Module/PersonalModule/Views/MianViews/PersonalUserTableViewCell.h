//
//  PersonalUserTableViewCell.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/10.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonalUserTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *fansTitileLabel;
@property (weak, nonatomic) IBOutlet UILabel *fansSubTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *fansBtn;
@property (weak, nonatomic) IBOutlet UILabel *followTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *followSubTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *followBtn;

@property (weak, nonatomic) IBOutlet UILabel *zanTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *zanSubTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *zanBtn;
@property (weak, nonatomic) IBOutlet UILabel *zanedTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *zanedSubtitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *zanedBtn;

@property (weak, nonatomic) IBOutlet UILabel *myVideoLabel;
@property (weak, nonatomic) IBOutlet UIButton *myVideoBtn;

@property (weak, nonatomic) IBOutlet UILabel *myCollectionLabel;
@property (weak, nonatomic) IBOutlet UIButton *myCollectionBtn;
@property (weak, nonatomic) IBOutlet UILabel *myCommitLabel;
@property (weak, nonatomic) IBOutlet UIButton *myCommitBtn;
@property (weak, nonatomic) IBOutlet UILabel *myBrowseLabel;
@property (weak, nonatomic) IBOutlet UIButton *myBrowseBtn;

@property (nonatomic,strong) UIViewController * fatherController;


@end

NS_ASSUME_NONNULL_END
