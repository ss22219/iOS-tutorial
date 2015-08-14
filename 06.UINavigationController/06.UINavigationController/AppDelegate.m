//
//  AppDelegate.m
//  06.UINavigationController
//
//  Created by gool on 15/1/1.
//  Copyright (c) 2015年 mac os. All rights reserved.
//

#import "AppDelegate.h"
#import "UIBarButtonItem+GLBarButtonItem.h"
@interface AppDelegate ()
@property(nonatomic,strong)UIViewController *vc2;
@property(nonatomic,strong)UIViewController *vc1;
@property(nonatomic,strong)UINavigationController *navVc;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //初始化两个viewcontroller
    
    _vc1 = [[UIViewController alloc]init];
    UILabel *lab1 = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 40)];
    lab1.text = @"view controller 1";
    [_vc1.view addSubview:lab1];
    
    _vc2 = [UIViewController new];
    UILabel *lab2 = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 40)];
    lab2.text = @"view controller 2";
    [_vc2.view addSubview:lab2];
    
    // Override point for customization after application launch.
    
    //初始化一个导航控制器，导航控制器的根控制器为第一个viewcontroller
    _navVc = [[UINavigationController alloc]initWithRootViewController:_vc1];
    _navVc.view.backgroundColor = [UIColor whiteColor];
    
    
    //为每个控制器设置不同的导航按钮，有些按钮必须在viewDidLoad里面修改
    //直接修改navigationController里面的navigationItem是不行的
    
    _vc1.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithTitle:@"goto vc2" titleColor:[UIColor blueColor] align:UIControlContentHorizontalAlignmentLeft target:self action:@selector(click
                                                                                                                                                                                                 )];
    _vc1.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithTitle:@"back btn" titleColor:[UIColor blueColor] align:UIControlContentHorizontalAlignmentRight target:self action:@selector(rightBtnClick)];

    _vc2.navigationItem.rightBarButtonItem = _vc1.navigationItem.rightBarButtonItem;
    _vc1.view.backgroundColor = [UIColor greenColor];
    _vc2.view.backgroundColor = [UIColor blueColor];
//    _vc2.navigationItem.leftBarButtonItem = nil;并不能隐藏返回按钮，需要继承viewcontroller然后在viewDidLoad里面操作，否则无效!
    
    
    self.window.rootViewController = _navVc;
    
    
    
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)click{
    NSLog(@"btn is clicked!");
    [_navVc pushViewController:_vc2 animated:YES];
}
-(void)rightBtnClick{
    [_navVc popViewControllerAnimated:YES];
    NSLog(@"right btn is clicked!");
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
