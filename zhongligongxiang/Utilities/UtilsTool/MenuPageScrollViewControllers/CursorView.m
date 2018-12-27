//
//  CricleCursorView.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/25.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "CursorView.h"


static NSString *const itemReuseIdentifier = @"__item__cell";

#define ZH_SCREEN_WIDTH             ([[UIScreen mainScreen] bounds].size.width)

@interface MenuPageScrollView ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (nonatomic, strong) UIViewController *parentViewController;

@property (nonatomic, strong) UIScrollView *menuPageScrollView;

@property (nonatomic, strong) UIView *indicatorFactorView;

@property (nonatomic, assign) NSInteger didSelectedIndex;
@end

@implementation MenuPageScrollView

- (instancetype)initWithParentController:(UIViewController *)parentController MenusPages:(NSArray *)pages {
    if (self = [super init]) {
        self.parentViewController = parentController;
        self.menuPageControllers  = pages;
        [self setUp];
    }
    return self;
    
}

- (void)setUp {
    self.didSelectedIndex = 0;
    self.backgroundColor  = [UIColor clearColor];
}

- (void)updateSelectedPage {
    [self.menuPageCollectionView reloadData];
    CGFloat point_x = ZH_SCREEN_WIDTH *_didSelectedIndex;
    [_menuPageScrollView setContentOffset:CGPointMake(point_x, 0) animated:NO];
    
}

- (void)setPageMenus:(NSArray *)pageMenus {
    _pageMenus = pageMenus;
    [self.menuPageScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self);
        make.top.equalTo(self.mas_bottom);
        make.bottom.equalTo(self.parentViewController.view.mas_bottom);
    }];
    MASAttachKeys(_menuPageScrollView);
    UIView *horizontalBackGroundView = [[UIView alloc]init];
    [self.menuPageScrollView addSubview:horizontalBackGroundView];
    [horizontalBackGroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.menuPageScrollView);
        make.height.equalTo(self.menuPageScrollView);
    }];
    UIView *previousView = nil;
    for (int i = 0; i < _menuPageControllers.count; i ++) {
        UIViewController *vc = _menuPageControllers[i];
        [self.parentViewController addChildViewController:vc];
        [_menuPageScrollView addSubview:vc.view];
        [vc didMoveToParentViewController:self.parentViewController];
        [vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.bottom.equalTo(horizontalBackGroundView);
            make.width.equalTo(_menuPageScrollView);
            if (previousView) {
                make.left.mas_equalTo(previousView.mas_right);
            } else {
                make.left.mas_equalTo(0);
            }
        }];
        previousView = vc.view;
    }
    [horizontalBackGroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(previousView.mas_right);
    }];
    
}

/**
 *  设置collectionView的偏移量，使得选中的项目居中
 */
- (void)setCollectionViewOffsetWithSelectedItemRect:(CGRect)frame {
    CGFloat width = CGRectGetWidth(self.menuPageCollectionView.frame) / 2;
    CGFloat point_offset_x = 0;
    
    if (CGRectGetMidX(frame) <= width) {
        
        point_offset_x = 0;
        
    } else if (CGRectGetMidX(frame) + width >= self.menuPageCollectionView.contentSize.width) {
        
        point_offset_x = self.menuPageCollectionView.contentSize.width - CGRectGetWidth(self.menuPageCollectionView.frame);
    } else {
        point_offset_x = CGRectGetMidX(frame)-CGRectGetWidth(self.menuPageCollectionView.frame)/2;
    }
    [self.menuPageCollectionView setContentOffset:CGPointMake(point_offset_x, 0) animated:YES];
}

/**
 *  设置标识线的frame
 */
- (void)stretchIndicatorFactorWithSelectedItemRect:(CGRect)frame animated:(BOOL)animated {
    CGFloat height = 2.0f;
    UIEdgeInsets lineEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 3);
    
    CGRect rect = CGRectMake(CGRectGetMinX(frame) + lineEdgeInsets.left + CGRectGetWidth(frame)/4,
                             CGRectGetHeight(self.menuPageCollectionView.frame) - height -lineEdgeInsets.bottom,
                             CGRectGetWidth(frame)/2 - lineEdgeInsets.left*2, height - lineEdgeInsets.top);
    
    if (animated) {
        [UIView animateWithDuration:0.1f animations:^{
            self.indicatorFactorView.frame = rect;
        }];
    } else {
        self.indicatorFactorView.frame = rect;
    }
    
}
/**
 *  主动设置cursor选中item
 *
 *  @param index index
 */
- (void)selectedPageWithItemIndex:(NSInteger)index {
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:_didSelectedIndex inSection:0];
    [self.menuPageCollectionView selectItemAtIndexPath:indexPath
                                              animated:YES
                                        scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
    [self selecedPageWithItemIndexPath:indexPath];
    
}
/**
 *  设置计算选中的item状态
 *
 *  @param indexPath indexPath
 */
-(void)selecedPageWithItemIndexPath:(NSIndexPath*)indexPath {
    MenuPageScrollViewPageItem *item = (MenuPageScrollViewPageItem*)[self.menuPageCollectionView cellForItemAtIndexPath:indexPath];
    item.selected = YES;
    CGRect rect = item.frame;
    if (!item) {
        UICollectionViewLayoutAttributes *attributes = [self.menuPageCollectionView layoutAttributesForItemAtIndexPath:indexPath];
        rect = attributes.frame;
    }
    //    [self setCollectionViewOffsetWithSelectedItemRect:rect];
    [self stretchIndicatorFactorWithSelectedItemRect:rect animated:YES];
    
    CGFloat startX = ZH_SCREEN_WIDTH *_didSelectedIndex;
    [_menuPageScrollView setContentOffset:CGPointMake(startX, 0) animated:NO];
}

- (void)deselectedItemAtIndex:(NSInteger)index {
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
    [self.menuPageCollectionView deselectItemAtIndexPath:indexPath animated:NO];
    MenuPageScrollViewPageItem *item = (MenuPageScrollViewPageItem*)[self.menuPageCollectionView cellForItemAtIndexPath:indexPath];
    item.selected = NO;
    
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if ([_menuPageScrollView isEqual:scrollView]) {
        CGFloat offset_x = scrollView.contentOffset.x;
        if (offset_x >= 0) {
            NSInteger index = offset_x / CGRectGetWidth(self.bounds);
            if (_didSelectedIndex != index) {
                [self deselectedItemAtIndex:_didSelectedIndex];
                _didSelectedIndex = index;
                [self selectedPageWithItemIndex:_didSelectedIndex];
            }
        }
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _pageMenus.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MenuPageScrollViewPageItem *item = [collectionView dequeueReusableCellWithReuseIdentifier:itemReuseIdentifier forIndexPath:indexPath];
    NSString *title = _pageMenus[indexPath.item];
    item.itemName = title;
    item.selected = (indexPath.item == _didSelectedIndex);
    
    if (collectionView.indexPathsForSelectedItems.count <= 0) {
        [self.menuPageCollectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:_didSelectedIndex inSection:0]
                                                  animated:NO
                                            scrollPosition:UICollectionViewScrollPositionNone];
        
        [self stretchIndicatorFactorWithSelectedItemRect:item.frame animated:NO];
    }
    return item;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_didSelectedIndex == indexPath.item) { return; }
    _didSelectedIndex = indexPath.item;
    [self selecedPageWithItemIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    MenuPageScrollViewPageItem *item = (MenuPageScrollViewPageItem*)[collectionView cellForItemAtIndexPath:indexPath];
    item.selected = NO;
}


#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *title = _pageMenus[indexPath.item];
    CGSize size = [title sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]}];
    size = CGSizeMake(size.width+36, CGRectGetHeight(self.bounds));
    
    return size;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout*)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section {
    
    if ([PublicMethod getCurrentVersion].doubleValue < 11) {
        
        return UIEdgeInsetsMake(0, 10, 20, 0);
        
    }else{
        
        return UIEdgeInsetsMake(0, 10, 0, 0);
        
    }
}

#pragma mark - SETUP UI
- (UIScrollView*)menuPageScrollView {
    if (!_menuPageScrollView) {
        _menuPageScrollView = [[UIScrollView alloc]init];
        _menuPageScrollView.backgroundColor = [UIColor clearColor];
        _menuPageScrollView.pagingEnabled = YES;
        _menuPageScrollView.delegate = self;
        _menuPageScrollView.alwaysBounceHorizontal = YES;
        _menuPageScrollView.showsVerticalScrollIndicator = NO;
        _menuPageScrollView.showsHorizontalScrollIndicator = NO;
        _menuPageScrollView.scrollsToTop = NO;
        _menuPageScrollView.bounces = YES;
        [self.parentViewController.view addSubview:_menuPageScrollView];
    }
    return _menuPageScrollView;
}

- (UIView*)indicatorFactorView {
    if (!_indicatorFactorView) {
        _indicatorFactorView = [[UIView alloc]init];
        _indicatorFactorView.backgroundColor = RGB(51, 146, 255);
        [self.menuPageCollectionView addSubview:_indicatorFactorView];
    }
    return _indicatorFactorView;
}

- (UICollectionView*)menuPageCollectionView {
    if (!_menuPageCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _menuPageCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 75*3)/2, 0, 75*3, 40) collectionViewLayout:flowLayout];
        _menuPageCollectionView.showsVerticalScrollIndicator = NO;
        _menuPageCollectionView.showsHorizontalScrollIndicator = NO;
        _menuPageCollectionView.scrollsToTop = NO;
        _menuPageCollectionView.backgroundColor = [UIColor whiteColor];
        _menuPageScrollView.scrollEnabled = NO;
        _menuPageCollectionView.delegate = self;
        _menuPageCollectionView.dataSource = self;
        [_menuPageCollectionView registerClass:[MenuPageScrollViewPageItem class] forCellWithReuseIdentifier:itemReuseIdentifier];
        
        [self addSubview:_menuPageCollectionView];
    }
    return _menuPageCollectionView;
}
@end


@implementation MenuPageScrollViewPageItem

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.itemNameLabel];
    }
    return self;
}

- (UILabel *)itemNameLabel {
    if (!_itemNameLabel) {
        _itemNameLabel = [[UILabel alloc]init];
        _itemNameLabel.textAlignment = NSTextAlignmentCenter;
        _itemNameLabel.backgroundColor = [UIColor whiteColor];
    }
    return _itemNameLabel;
}

- (void)setSelected:(BOOL)selected {
    super.selected = selected;
    if (selected) {
        self.itemNameLabel.textColor = RGB(51, 146, 255);
    } else {
        self.itemNameLabel.textColor = [UIColor blackColor];
    }
}

- (void)setItemName:(NSString *)itemName {
    if (_itemName != itemName) {
        _itemName = itemName;
    }
    _itemNameLabel.text = itemName;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.itemNameLabel.frame = self.bounds;
}
@end

