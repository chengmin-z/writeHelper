//
//  WHHomeViewModel.m
//  易书
//
//  Created by 张成敏 on 2021/4/2.
//

#import "WHHomeViewModel.h"

#import "WHMoreGuideViewModel.h"

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
        WHMoreGuideViewModel *guideVM = [[WHMoreGuideViewModel alloc]initWithTitle:@"OpenCV 开发测试页面"];
        _viewModels = [NSArray<id<IGListDiffable>> arrayWithObjects:guideVM, nil];
    }
    return _viewModels;
}


@end
