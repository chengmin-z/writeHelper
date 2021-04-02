//
//  WHHomeViewModel.h
//  易书
//
//  Created by 张成敏 on 2021/4/2.
//

#import <Foundation/Foundation.h>

#import <IGListDiffKit/IGListDiffable.h>

NS_ASSUME_NONNULL_BEGIN

@interface WHHomeViewModel : NSObject

@property (nonatomic, strong, readonly) NSArray<id<IGListDiffable>> *viewModels;

@end

NS_ASSUME_NONNULL_END
