//
//  WHCourseViewController.h
//  易书
//
//  Created by 张成敏 on 2021/4/17.
//

#import <UIKit/UIKit.h>

#import "WHCourseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WHCourseViewController : UIViewController

- (instancetype)initWithCourseModel:(WHCourseModel *)courseModel;

- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
