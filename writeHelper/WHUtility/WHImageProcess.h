//
//  WHImageProcess.h
//  易书
//
//  Created by 张成敏 on 2021/4/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WHImageProcess : NSObject

+ (UIImage *)imageToGrayImage:(UIImage *)image;

+ (UIImage *)reduceNoiseImage:(UIImage *)image;

+ (UIImage *)thresholdImage:(UIImage *)image;

+ (UIImage *)makeTransparent:(UIImage *)image;

+ (UIImage *)makeTransparentImage:(UIImage *)image AndToR:(NSInteger)r G:(NSInteger)g B:(NSInteger)b;

@end

NS_ASSUME_NONNULL_END
