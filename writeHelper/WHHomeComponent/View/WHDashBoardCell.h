//
//  WHDashBoardCell.h
//  易书
//
//  Created by 张成敏 on 2021/4/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WHDashBoardCell : UICollectionViewCell

- (void)setTodayStudyMin:(NSInteger)min;

- (void)setToNextLevel:(NSInteger)nums;

- (void)setMyLevel:(NSString *)level;

@end

NS_ASSUME_NONNULL_END
