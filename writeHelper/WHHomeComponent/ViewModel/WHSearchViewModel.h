//
//  WHSearchViewModel.h
//  易书
//
//  Created by 张成敏 on 2021/4/11.
//

#import <Foundation/Foundation.h>

#import <IGListDiffKit/IGListDiffable.h>

NS_ASSUME_NONNULL_BEGIN

@interface WHSearchViewModel : NSObject<IGListDiffable>

@property (nonatomic, strong, readonly) NSString *title;

- (instancetype)initWithTitle:(NSString *)title;

- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
