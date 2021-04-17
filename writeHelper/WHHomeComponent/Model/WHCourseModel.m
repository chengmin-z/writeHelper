//
//  WHCourseModel.m
//  易书
//
//  Created by 张成敏 on 2021/4/14.
//

#import "WHCourseModel.h"

@implementation WHCourseModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
        @"courseTitle" : @"course_title",
        @"text" : @"text",
        @"bgImgUrl" : @"back_img",
        @"textImgUrl" : @"text_img"
    };
}

@end
