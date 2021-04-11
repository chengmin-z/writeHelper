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
        WHMoreGuideViewModel *guideVM = [[WHMoreGuideViewModel alloc]initWithTitle:@"想看更多内容？快去发现页看看"];
        WHSearchViewModel *searchVM = [[WHSearchViewModel alloc]initWithTitle:@"搜索课程和汉字"];
        WHDashBoardVIewModel *dashboardVM = [[WHDashBoardVIewModel alloc]initWithTodayMin:2 toNextLevel:20 myLevel:@"B2"];
        _viewModels = [NSArray<id<IGListDiffable>> arrayWithObjects:searchVM, dashboardVM, guideVM, nil];
    }
    return _viewModels;
}


@end
