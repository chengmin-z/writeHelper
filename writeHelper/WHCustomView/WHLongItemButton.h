//
//  WHLongItemButton.h
//  易书
//
//  Created by 张成敏 on 2021/4/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WHLongItemButton : UIButton

- (instancetype)initWithTitle:(NSString *)title;

- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)new NS_UNAVAILABLE;

- (void)setTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
