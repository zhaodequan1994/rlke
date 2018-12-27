//
//  LocationManager.h
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/25.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LocationManager : NSObject

-(void)registerGaode;

-(void)startUpdateingLocation;

-(void)stopUpdateingLocation;

@end

NS_ASSUME_NONNULL_END
