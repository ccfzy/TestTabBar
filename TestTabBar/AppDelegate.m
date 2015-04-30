//
//  AppDelegate.m
//  TestTabBar
//
//  Created by caochuang on 15/4/1.
//  Copyright (c) 2015年 caochuang. All rights reserved.
//

#import "AppDelegate.h"
#import "CCTabbarView.h"
#import "PublishView.h"

@interface AppDelegate ()<UITabBarControllerDelegate,
CCTabbarViewDelegate> {
    CCTabbarView *_tabbar;
}

@end

#define SCREEN_WIDTH        [[UIScreen mainScreen] bounds].size.width    //当前设备的屏幕宽度

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    _tabbar = [[CCTabbarView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
    _tabbar.delegate = self;
    _tabbar.titleArray = @[@"段子",@"发现",@"",@"聊天",@"我的"];
    [[UITabBar appearance] addSubview:_tabbar];

    return YES;
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

#pragma mark - CCTabbarDelegate
- (void)selectedImageIndex:(NSInteger)index {
    if (index == 2) {
        NSLog(@"选择的是第二个选项卡 需要弹出咯");
        PublishView *publish = [[PublishView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        publish.publishBlock = ^() {
            _tabbar.selectedIndex = 2;
        };
        [publish show];
    }
}

@end
