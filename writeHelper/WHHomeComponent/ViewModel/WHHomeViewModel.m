//
//  WHHomeViewModel.m
//  易书
//
//  Created by 张成敏 on 2021/4/2.
//

#import "WHHomeViewModel.h"

#import "WHMoreGuideViewModel.h"
#import "WHSearchViewModel.h"
#import "WHDashBoardVIewModel.h"
#import "WHRecommendViewModel.h"
#import "WHCoursesViewModel.h"

#import <AFNetworking/AFNetworking.h>
#import <Mantle/Mantle.h>

@interface WHHomeViewModel()

@property (nonatomic, strong, readwrite) NSArray<id<IGListDiffable>> *viewModels;

@end

@implementation WHHomeViewModel

- (instancetype)init
{
    self = [super init];
    return self;
}


#pragma mark - Lazy Load

- (NSArray<id<IGListDiffable>> *)viewModels
{
    if (!_viewModels) {
        
        WHSearchViewModel *searchVM = [[WHSearchViewModel alloc]initWithTitle:@"搜索课程和汉字"];
        WHDashBoardVIewModel *dashboardVM = [[WHDashBoardVIewModel alloc]initWithTodayMin:2 toNextLevel:20 myLevel:@"B2"];
        
        WHCoursesViewModel *coursesVM = [[WHCoursesViewModel alloc]init];
        
        WHRecommendViewModel *recommendVM = [[WHRecommendViewModel alloc]initWithBackImgUrl:@"https://tva1.sinaimg.cn/large/008eGmZEly1gpizy6g0dbj30ko05c75e.jpg" title:@"App 推荐广告位"];
        
        WHMoreGuideViewModel *guideVM = [[WHMoreGuideViewModel alloc]initWithTitle:@"想看更多内容？快去发现页看看"];
        
        
        _viewModels = [NSArray<id<IGListDiffable>> arrayWithObjects:searchVM, dashboardVM, coursesVM, recommendVM, guideVM, nil];
    }
    return _viewModels;
}


@end
