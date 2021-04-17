//
//  WHCoursesViewModel.h
//  易书
//
//  Created by 张成敏 on 2021/4/14.
//

#import <Foundation/Foundation.h>

#import <IGListDiffKit/IGListDiffable.h>

#include "WHCourseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WHCoursesViewModel : NSObject<IGListDiffable>

@property (nonatomic, strong, readonly) NSArray<WHCourseModel *> *courseModels;

- (void)setCourseModels:(NSArray<WHCourseModel *> *)courseModels;

+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
