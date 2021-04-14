//
//  WHCourseModel.h
//  易书
//
//  Created by 张成敏 on 2021/4/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WHCourseModel : NSObject

@property (nonatomic, strong, readwrite) NSString *text;

@property (nonatomic, strong, readwrite) NSString *bgImgUrl;

@property (nonatomic, strong, readwrite) NSString *textImgUrl;

@end

NS_ASSUME_NONNULL_END
