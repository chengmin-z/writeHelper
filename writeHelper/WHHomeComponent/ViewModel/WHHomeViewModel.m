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
        
        WHCourseModel *model1 = [[WHCourseModel alloc]init];
        model1.bgImgUrl = @"https://tva1.sinaimg.cn/large/008eGmZEly1gpjkqd6kq2j30ew0ewtbg.jpg";
        model1.text = @"构";
        WHCourseModel *model2 = [[WHCourseModel alloc]init];
        model2.bgImgUrl = @"https://tva1.sinaimg.cn/large/008eGmZEly1gpjkqfp8lnj30ew0ewgqd.jpg";
        model2.text = @"汉";
        NSArray<WHCourseModel *> *models = [NSArray<WHCourseModel *> arrayWithObjects:model1, model2, nil];
        
        WHCoursesViewModel *coursesVM = [[WHCoursesViewModel alloc]initWithCourseModels:models];
        
        WHRecommendViewModel *recommendVM = [[WHRecommendViewModel alloc]initWithBackImgUrl:@"https://tva1.sinaimg.cn/large/008eGmZEly1gpizy6g0dbj30ko05c75e.jpg" title:@"App 推荐广告位"];
        
        WHMoreGuideViewModel *guideVM = [[WHMoreGuideViewModel alloc]initWithTitle:@"想看更多内容？快去发现页看看"];
        
        
        _viewModels = [NSArray<id<IGListDiffable>> arrayWithObjects:searchVM, dashboardVM, coursesVM, recommendVM, guideVM, nil];
    }
    return _viewModels;
}


@end
