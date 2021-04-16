//
//  WHRecommendViewModel.m
//  易书
//
//  Created by 张成敏 on 2021/4/14.
//

#import "WHRecommendViewModel.h"

@interface WHRecommendViewModel()

@property (nonatomic, strong, readwrite) NSString *backImgUrl;

@property (nonatomic, strong, readwrite) NSString *title;

@end

@implementation WHRecommendViewModel

- (instancetype)initWithBackImgUrl:(NSString *)url title:(NSString *)title
{
    if (self = [super init]) {
        self.backImgUrl = url;
        self.title = title;
    }
    return self;
}

- (nonnull id<NSObject>)diffIdentifier
{
    return self;
}

- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object
{
    return self == object;
}

@end
