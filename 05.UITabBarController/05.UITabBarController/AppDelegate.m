//
//  AppDelegate.m
//  05.UITabBarController
//
//  Created by gool on 15/8/5.
//  Copyright (c) 2015年 mac os. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
-(void)initRootVC{
    //初始化3个控制器
    UIViewController *vc1 = [UIViewController new];
    vc1.view.backgroundColor = [UIColor redColor];
    UIViewController *vc2 = [UIViewController new];
    
    vc2.view.backgroundColor = [UIColor blueColor];
    UIViewController *vc3 = [UIViewController new];
    
    vc3.view.backgroundColor = [UIColor yellowColor];
    NSArray *controllers = @[vc1,vc2,vc3];
    
    
    //设置根控制器为TabBarControler
    self.rootTabBarVC = [UITabBarController new];
    self.window.rootViewController = self.rootTabBarVC;
    
    [self.rootTabBarVC setViewControllers:controllers animated:YES];
    
    //获取到tabBar对象
    UITabBar *tabBar = self.rootTabBarVC.tabBar;
    
    //获取到tabBar的三个选项
    UITabBarItem *item1 =  [tabBar.items objectAtIndex:0];
    UITabBarItem *item2 =  [tabBar.items objectAtIndex:1];
    UITabBarItem *item3 =  [tabBar.items objectAtIndex:2];
    
    //给每个选项设置图标
    item1.image = [UIImage imageNamed:@"bottom_tab1_pre"];
    item2.image = [UIImage imageNamed:@"bottom_tab2_pre"];
    item3.image = [UIImage imageNamed:@"bottom_tab3_pre"];
    
    //设置当前窗口为主窗口并显示
    [self.window makeKeyAndVisible];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initRootVC];
    // Override point for customization after application launch.
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

@end
