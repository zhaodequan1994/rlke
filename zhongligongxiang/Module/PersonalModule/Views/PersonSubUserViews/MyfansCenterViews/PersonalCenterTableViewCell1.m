//
//  PersonalCenterTableViewCell1.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/24.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "PersonalCenterTableViewCell1.h"

//Controllers
#import "SDPhotoBrowser.h"


//Cells
#import "ImagesCollectionViewCell.h"


#define kImageWithAndHeight (self.imagesCollectionView.frame.size.width - 20)/3

@interface PersonalCenterTableViewCell1 ()<UICollectionViewDelegate,UICollectionViewDataSource,SDPhotoBrowserDelegate>


@end

@implementation PersonalCenterTableViewCell1

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    self.lineView.backgroundColor = RGB(230, 230, 230);
    self.shareLabel.textColor = RGB(102, 102, 102);
    self.commitLabel.textColor = RGB(102, 102, 102);
    self.zanLabel.textColor = RGB(102, 102, 102);
    self.contentLabel.textColor = RGB(51, 51, 51);
    self.timeLabel.textColor = RGB(179, 179, 179);
    self.userNameLabel.textColor = RGB(255, 84, 85);

    self.userImageview.layer.masksToBounds = YES;
    self.userImageview.layer.cornerRadius = self.userImageview.frame.size.height/2;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(kImageWithAndHeight, kImageWithAndHeight);
    self.imagesCollectionView.delegate = self;
    self.imagesCollectionView.dataSource = self;
    [self.imagesCollectionView registerNib:[UINib nibWithNibName:@"ImagesCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ImagesCollectionViewCell"];
    self.imagesCollectionView.backgroundColor = [UIColor whiteColor];
    self.imagesCollectionView.scrollEnabled = NO;

}

#pragma mark   ------------  collection  delegate  ----------

//返回section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1 ;
}
//每个section的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 9;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ImagesCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImagesCollectionViewCell" forIndexPath:indexPath];
    
    return cell;
}

//两个cell之间的间距（同一行的cell的间距）
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    return 10;
}

//这个是两行cell之间的间距（上下行cell的间距）
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 10;
}
/**cell的大小*/
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(kImageWithAndHeight, kImageWithAndHeight);
    
}
// 点击图片的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
   
    SDPhotoBrowser *photoBrowser = [SDPhotoBrowser new];

    NSMutableArray * imageArray = [[NSMutableArray alloc] init];

    photoBrowser.delegate = self;
    photoBrowser.currentImageIndex = indexPath.row;
    photoBrowser.imageCount = imageArray.count;
    photoBrowser.sourceImagesContainerView = self;
    [photoBrowser show];
}

#pragma mark  SDPhotoBrowserDelegate

// 返回临时占位图片（即原来的小图）
- (UIImage *)photoBrowser:(SDPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index
{
    // 不建议用此种方式获取小图，这里只是为了简单实现展示而已
    
    
    return nil;
}

// 返回高质量图片的url
- (NSURL *)photoBrowser:(SDPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index
{
    
    
//    return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",[[PublicManager shareInstance].environmentManager getImageCurrentUrl],resorceModel.path]];
    
    return nil;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
