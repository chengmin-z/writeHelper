//
//  WHCoursesCell.h
//  易书
//
//  Created by 张成敏 on 2021/4/14.
//

#import <UIKit/UIKit.h>

#import "XLCardSwitch.h"

#import "WHCourseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WHCoursesCell : UICollectionViewCell

- (void)setXLDelegate:(id<XLCardSwitchDelegate>)delegate;

- (void)setCourseData:(NSArray<WHCourseModel *> *)courseModels;

@end

NS_ASSUME_NONNULL_END
