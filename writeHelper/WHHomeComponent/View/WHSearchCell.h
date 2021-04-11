//
//  WHSearchCell.h
//  易书
//
//  Created by 张成敏 on 2021/4/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WHSearchCell : UICollectionViewCell

- (void)setTitle:(NSString *)title;

- (void)setSearchClickBlock:(void(^)(void))block;

- (void)setButtonClickBlock:(void(^)(void))block;

@end

NS_ASSUME_NONNULL_END
