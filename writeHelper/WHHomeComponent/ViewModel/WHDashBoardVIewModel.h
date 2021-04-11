//
//  WHDashBoardVIewModel.h
//  易书
//
//  Created by 张成敏 on 2021/4/11.
//

#import <Foundation/Foundation.h>

#import <IGListDiffKit/IGListDiffable.h>

NS_ASSUME_NONNULL_BEGIN

@interface WHDashBoardVIewModel : NSObject<IGListDiffable>

@property (nonatomic, assign, readonly) NSInteger todayStudyMin;

@property (nonatomic, assign, readonly) NSInteger toNextLevel;

@property (nonatomic, strong, readonly) NSString *myLevel;

- (instancetype)initWithTodayMin:(NSInteger)todayMin toNextLevel:(NSInteger)toNextLevel myLevel:(NSString *)level;

- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
