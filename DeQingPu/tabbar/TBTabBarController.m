//
//  TBTabBarController.m
//  TabbarBeyondClick
//
//  Created by 卢家浩 on 2017/4/17.
//  Copyright © 2017年 lujh. All rights reserved.
//

#import "TBTabBarController.h"
#import "BussinessViewController.h"
#import "ManagerLiveViewController.h"
#import "AddressBookViewController.h"
#import "MyCenterViewController.h"
#import "TBNavigationController.h"
#import "TBTabBar.h"
#import "LifeHouseViewController.h"
@interface TBTabBarController ()

@end

@implementation TBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.tabBar.barTintColor = [UIColor blackColor];
    // 初始化所有控制器
    [self setUpChildVC];
    self.selectedIndex = 2;
    // 创建tabbar中间的tabbarItem
   // [self setUpMidelTabbarItem];
    
}



#pragma mark -初始化所有控制器 

- (void)setUpChildVC {

    BussinessViewController *homeVC = [[BussinessViewController alloc] init];
    [self setChildVC:homeVC title:@"商家联盟" image:@"tab_business_sel" selectedImage:@"tab_business"];
    
    ManagerLiveViewController *fishpidVC = [[ManagerLiveViewController alloc] init];
    [self setChildVC:fishpidVC title:@"掌柜直播" image:@"tab_manager_sel" selectedImage:@"tab_manager"];
    
    ManagerLiveViewController *liveVc = [[ManagerLiveViewController alloc]init];
    [self setChildVC:liveVc title:nil image:@"tab_lifeHouse_sel" selectedImage:@"tab_lifeHouse"];
    
    
    AddressBookViewController *messageVC = [[AddressBookViewController alloc] init];
    [self setChildVC:messageVC title:@"通讯录" image:@"tab_address_sel" selectedImage:@"tab_address"];
    
    MyCenterViewController  *myVC = [[MyCenterViewController alloc] init];
    [self setChildVC:myVC title:@"个人中心" image:@"tab_mycenter_sel" selectedImage:@"tab_mycenter"];

    
    
}

- (void) setChildVC:(UIViewController *)childVC title:(NSString *) title image:(NSString *) image selectedImage:(NSString *) selectedImage {
    
    childVC.tabBarItem.title = title;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    [childVC.tabBarItem setTitleTextAttributes:dict forState:UIControlStateNormal];
    childVC.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    TBNavigationController *nav = [[TBNavigationController alloc] initWithRootViewController:childVC];
    //nav.navigationBar.backgroundColor = [UIColor blackColor];
    nav.navigationBar.barTintColor = [UIColor blackColor];
     [self addChildViewController:nav];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    NSLog(@"item name = %@", item.title);
    NSInteger index = [self.tabBar.items indexOfObject:item];
    [self animationWithIndex:index];
    if([item.title isEqualToString:@"发现"])
    {
        // 也可以判断标题,然后做自己想做的事<img alt="得意" src="http://static.blog.csdn.net/xheditor/xheditor_emot/default/proud.gif" />
    }
}
- (void)animationWithIndex:(NSInteger) index {
    NSMutableArray * tabbarbuttonArray = [NSMutableArray array];
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabbarbuttonArray addObject:tabBarButton];
        }
    }
    CABasicAnimation*pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulse.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulse.duration = 0.2;
    pulse.repeatCount= 1;
    pulse.autoreverses= YES;
    pulse.fromValue= [NSNumber numberWithFloat:0.7];
    pulse.toValue= [NSNumber numberWithFloat:1.3];
    [[tabbarbuttonArray[index] layer] 
     addAnimation:pulse forKey:nil]; 
}

@end
