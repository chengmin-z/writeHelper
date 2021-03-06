//
//  WHSquarePreviewView.h
//  易书
//
//  Created by 张成敏 on 2021/4/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WHSquarePreviewView : UIView

- (instancetype)initWithPreviewImage:(nullable UIImage *)image;

- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)new NS_UNAVAILABLE;

- (void)setBackPreviewImage:(UIImage *)image;

- (void)setInputPreviewImage:(UIImage *)image;

- (void)setBackPreviewImageHidden:(BOOL)hidden;

- (void)setInputPreviewImageHidden:(BOOL)hidden;

@end

NS_ASSUME_NONNULL_END
