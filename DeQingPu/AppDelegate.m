//
//  AppDelegate.m
//  DeQingPu
//
//  Created by apple on 2017/5/10.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "AppDelegate.h"
#import "TBTabBar.h"
#import "TBTabBarController.h"
#import "UITabBar+TBBadge.h"
#import "LogInViewController.h"
@interface AppDelegate ()
@property(nonatomic,strong)TBTabBarController *tabbar;
@end


@implementation AppDelegate


//测试数据
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.tabbar = [[TBTabBarController alloc] init];
    self.window.rootViewController = self.tabbar;
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"login"]) {
        [self showTabbarVc];
    }else{
        LogInViewController *logVc = [[LogInViewController alloc]init];
        //点击回调到主界面
        logVc.clickBlock= ^{
            [self showTabbarVc];
            
        };
        _window.rootViewController = logVc;
    }
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    // 显示小红点
   // [self showUnreadMessageHotView];
    
    return YES;
}


#pragma mark -显示主界面
-(void)showTabbarVc
{
    self.tabbar = [[TBTabBarController alloc]init];;
    self.window.rootViewController = _tabbar;
    
}
#pragma mark -显示小红点

- (void)showUnreadMessageHotView {
    
    //显示小红点
    [self.tabbar.tabBar showBadgeOnItemIndex:4];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
