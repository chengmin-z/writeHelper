//
//  WHNavigationController.m
//  易书
//
//  Created by 张成敏 on 2021/4/2.
//

#import "WHNavigationController.h"
#import "WHColorDefine.h"

@interface WHNavigationController ()

@end

@implementation WHNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage new]];
    [self.navigationBar setTintColor:WH_BLACK_COLOR];
    [self.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont boldSystemFontOfSize:18],
    NSForegroundColorAttributeName:WH_BLACK_COLOR}];
}

@end
