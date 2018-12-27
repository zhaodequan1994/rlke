//
//  CricleCursorView.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/25.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <UIKit/UIKit.h>


@class MenuPageScrollView;
@class MenuPageScrollViewPageItem;
@protocol MenuPageScrollViewDelegate<NSObject>

@optional

- (void)pageScrollViewDidSelectedPageItem:(MenuPageScrollViewPageItem *)selectedPageItem
                    WithSelectedItemIndex:(NSInteger)selectedItemIndex;

@end

@interface MenuPageScrollView : UIView

@property (nonatomic, copy) NSArray *pageMenus;

@property (nonatomic, copy) NSArray *menuPageControllers;

- (instancetype)initWithParentController:(UIViewController *)parentController
                              MenusPages:(NSArray *)pages;

@property (nonatomic, strong) UICollectionView *menuPageCollectionView;

- (void)updateSelectedPage;

@end

@interface MenuPageScrollViewPageItem :UICollectionViewCell

@property (nonatomic, strong) UILabel *itemNameLabel;

@property (nonatomic, copy) NSString *itemName;


@end


