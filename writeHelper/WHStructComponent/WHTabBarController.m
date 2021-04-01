//
//  WHHomeStructTabBarController.m
//  易书
//
//  Created by 张成敏 on 2021/4/1.
//

#import "WHTabBarController.h"

#import "WHColorDefine.h"
#import "WHNavigationController.h"
#import "WHHomeViewController.h"

@interface WHTabBarController ()

@end

@implementation WHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configChildVC];
    [self configTabbar];
}

- (void)configChildVC {
    WHNavigationController *homeVC = [[WHNavigationController alloc]initWithRootViewController: [[WHHomeViewController alloc]init]];
    WHNavigationController *discoverVC = [[WHNavigationController alloc]init];
    WHNavigationController *reviewVC = [[WHNavigationController alloc]init];
    WHNavigationController *profileVC = [[WHNavigationController alloc]init];
    
    [self setViewControllers:[NSArray arrayWithObjects:homeVC, discoverVC, reviewVC, profileVC, nil]];
}

- (void)configTabbar {
    UITabBar *tabBar = self.tabBar;
    [tabBar setBackgroundColor:WH_WHITE_COLOR];
    [tabBar setTranslucent:NO];
    
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];
    UITabBarItem *tabBarItem4 = [tabBar.items objectAtIndex:3];
    
    [tabBarItem1 setTitle:@"学习"];
    [tabBarItem2 setTitle:@"发现"];
    [tabBarItem3 setTitle:@"复习"];
    [tabBarItem4 setTitle:@"我的"];
    
    [tabBarItem1 setSelectedImage:[[UIImage imageNamed:@"HomeTabBarButtonSelected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [tabBarItem2 setSelectedImage:[[UIImage imageNamed:@"DiscoverTabBarButtonSelected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [tabBarItem3 setSelectedImage:[[UIImage imageNamed:@"ReviewTabBarButtonSelected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [tabBarItem4 setSelectedImage:[[UIImage imageNamed:@"ProfileTabBarButtonSelected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [tabBarItem1 setImage:[[UIImage imageNamed:@"HomeTabBarButtonNormal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [tabBarItem2 setImage:[[UIImage imageNamed:@"DiscoverTabBarButtonNormal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [tabBarItem3 setImage:[[UIImage imageNamed:@"ReviewTabBarButtonNormal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [tabBarItem4 setImage:[[UIImage imageNamed:@"ProfileTabBarButtonNormal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setTitleTextAttributes:@{NSForegroundColorAttributeName:WH_MIAN_THEME_COLOR,
                                      NSFontAttributeName:[UIFont boldSystemFontOfSize:10.0]}
                           forState:UIControlStateSelected];
        [obj setTitleTextAttributes:@{NSForegroundColorAttributeName:WH_GARY_COLOR,
                                      NSFontAttributeName:[UIFont boldSystemFontOfSize:10.0]}
                           forState:UIControlStateNormal];
        [obj setImageInsets:UIEdgeInsetsMake(4.0, 3.0, 4.0, 4.0)];
    }];
    

}

#pragma mark - Lazy Load

@end
