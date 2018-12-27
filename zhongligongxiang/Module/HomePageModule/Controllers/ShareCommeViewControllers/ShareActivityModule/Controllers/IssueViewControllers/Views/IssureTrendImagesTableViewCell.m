//
//  IssureTrendImagesTableViewCell.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/26.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "IssureTrendImagesTableViewCell.h"

#define kImageWithAndHeight (self.imagesCollectionView.frame.size.width - 10)/3

//Cells
#import "IssureImageCollectionViewCell.h"

@interface IssureTrendImagesTableViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource>


@end

@implementation IssureTrendImagesTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(kImageWithAndHeight, kImageWithAndHeight);
    self.imagesCollectionView.delegate = self;
    self.imagesCollectionView.dataSource = self;
    [self.imagesCollectionView registerNib:[UINib nibWithNibName:@"IssureImageCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"IssureImageCollectionViewCell"];
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
    
    IssureImageCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"IssureImageCollectionViewCell" forIndexPath:indexPath];
    
    
    return cell;
}

//两个cell之间的间距（同一行的cell的间距）
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    return 5;
}

//这个是两行cell之间的间距（上下行cell的间距）
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 5;
}
/**cell的大小*/
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(kImageWithAndHeight, kImageWithAndHeight);
    
}
// 点击图片的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
