//
//  WHMoreGuideCell.h
//  易书
//
//  Created by 张成敏 on 2021/4/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WHMoreGuideCell : UICollectionViewCell

- (void)setTitle:(NSString *)title;

- (void)setActionBlock:(void(^)(void))block;

@end

NS_ASSUME_NONNULL_END
