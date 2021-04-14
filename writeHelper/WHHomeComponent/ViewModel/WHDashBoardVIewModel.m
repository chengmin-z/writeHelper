//
//  WHDashBoardVIewModel.m
//  易书
//
//  Created by 张成敏 on 2021/4/11.
//

#import "WHDashBoardVIewModel.h"


@interface WHDashBoardVIewModel()

@property (nonatomic, assign, readwrite) NSInteger todayStudyMin;

@property (nonatomic, assign, readwrite) NSInteger toNextLevel;

@property (nonatomic, strong, readwrite) NSString *myLevel;

@end


@implementation WHDashBoardVIewModel

- (instancetype)initWithTodayMin:(NSInteger)todayMin toNextLevel:(NSInteger)toNextLevel myLevel:(NSString *)level
{
    if (self = [super init]) {
        self.myLevel = [level copy];
        self.toNextLevel = toNextLevel;
        self.todayStudyMin = todayMin;
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
