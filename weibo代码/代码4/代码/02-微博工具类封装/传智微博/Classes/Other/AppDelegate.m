//
//  AppDelegate.m
//  传智微博
//
//  Created by apple on 15-3-4.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "AppDelegate.h"

#import "CZOneViewController.h"


#import "CZOAuthViewController.h"




#import "CZAccountTool.h"
#import "CZRootTool.h"

#import "UIImageView+WebCache.h"
// 偏好设置存储的好处
// 1.不需要关心文件名
// 2.快速进行键值对存储

@interface AppDelegate ()

@end

@implementation AppDelegate
// 补充：控制器的view
// UITabBarController控制器的view在一创建控制器的时候就会加载view
// UIViewController的view，才是懒加载。
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    
    // 选择根控制器
    // 判断下有没有授权
    if ([CZAccountTool account]) { // 已经授权
        
        // 选择根控制器
        [CZRootTool chooseRootViewController:self.window];
        
    }else{ // 进行授权
        CZOAuthViewController *oauthVc = [[CZOAuthViewController alloc] init];
        
        // 设置窗口的根控制器
        self.window.rootViewController = oauthVc;

    }
    
    
    
    // 显示窗口
    [self.window makeKeyAndVisible];
    // makeKeyAndVisible底层实现
    // 1. application.keyWindow = self.window
    // 2. self.window.hidden = NO;
    
    return YES;
}


// 接收到内存警告的时候调用
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    
    // 停止所有的下载
    [[SDWebImageManager sharedManager] cancelAll];
    // 删除缓存
    [[SDWebImageManager sharedManager].imageCache clearMemory];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
