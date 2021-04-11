//
//  WHSearchViewModel.m
//  易书
//
//  Created by 张成敏 on 2021/4/11.
//


#import "WHSearchViewModel.h"


@interface WHSearchViewModel()

@property (nonatomic, strong, readwrite) NSString *title;

@end


@implementation WHSearchViewModel

- (instancetype)initWithTitle:(NSString *)title
{
    if (self = [super init]) {
        _title = [title copy];
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
