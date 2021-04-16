//
//  WHCoursesViewModel.m
//  易书
//
//  Created by 张成敏 on 2021/4/14.
//

#import "WHCoursesViewModel.h"

@interface WHCoursesViewModel()

@property (nonatomic, strong, readwrite) NSArray<WHCourseModel *> *courseModels;

@end

@implementation WHCoursesViewModel

- (instancetype)initWithCourseModels:(NSArray<WHCourseModel *> *)courseModels
{
    if (self = [super init]) {
        self.courseModels = [courseModels copy];
    }
    return self;
}

- (nonnull id<NSObject>)diffIdentifier
{
    return self;
}

- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object
{
    return self == object;
}

@end
