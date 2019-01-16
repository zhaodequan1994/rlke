//
//  SDCollectionViewController.h
//  lanlingdai
//
//  Created by zhaodq on 2018/11/23.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SDCollectionViewController : UICollectionViewController

@property (nonatomic,strong) NSMutableArray * imageUrlArray;

+ (instancetype)demoCollectionViewController;




@end

NS_ASSUME_NONNULL_END
