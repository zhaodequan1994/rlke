//
//  PublicManager.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "PublicManager.h"

static PublicManager *publicManager = nil;

@implementation PublicManager

+(instancetype)shareInstance{
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^
                  {
                      publicManager = [[PublicManager alloc] init];
                  });
    
    return publicManager;
    
}

#pragma mark - ********** Setters / Getters **********


@end
