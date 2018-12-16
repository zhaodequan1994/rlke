//
//  UIViewController+Convenience.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "UIViewController+Convenience.h"

@implementation UIViewController (Convenience)

+ (id)instantiateViewControllerInStoryboard:(NSString *)storyboard withStoryboardID:(NSString *)storyboardID
{
    UIStoryboard *currentStoryboard = [UIStoryboard storyboardWithName:storyboard bundle:nil];
    
    return [currentStoryboard instantiateViewControllerWithIdentifier:storyboardID];
}

+ (UIViewController *)currentTopViewController
{
    return [self topViewControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

+ (UIViewController *)topViewControllerWithRootViewController:(UIViewController *)rootViewController
{
    if ([rootViewController isKindOfClass:[UITabBarController class]])
    {
        UITabBarController *tabBarController = (UITabBarController *)rootViewController;
        
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
    }
    else if ([rootViewController isKindOfClass:[UINavigationController class]])
    {
        UINavigationController * navigationController = (UINavigationController *)rootViewController;
        
        return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
    }
    else if (rootViewController.presentedViewController)
    {
        UIViewController *presentedViewController = rootViewController.presentedViewController;
        
        return [self topViewControllerWithRootViewController:presentedViewController];
    }
    else
    {
        if (rootViewController.childViewControllers.count > 0)
        {
            for (UIViewController *controller in rootViewController.childViewControllers)
            {
                if ([controller isKindOfClass:[UITabBarController class]])
                {
                    UITabBarController *tabBarController = (UITabBarController *)rootViewController;
                    
                    return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
                }
                else if ([controller isKindOfClass:[UINavigationController class]])
                {
                    UINavigationController *navigationController = (UINavigationController *)(rootViewController.childViewControllers.firstObject);
                    
                    return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
                }
                else if (controller.presentedViewController)
                {
                    UIViewController *presentedViewController = rootViewController.presentedViewController;
                    
                    return [self topViewControllerWithRootViewController:presentedViewController];
                }
            }
        }
        
        return rootViewController;
    }
}

@end
