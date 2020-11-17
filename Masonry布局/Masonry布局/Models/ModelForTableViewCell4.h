//
//  ModelForTableViewCell4.h
//  Masonry布局
//
//  Created by Hu, Yuping on 2020/11/17.
//  Copyright © 2020 Hu, Yuping. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ModelForTableViewCell4 : NSObject

@property (nonatomic, copy) NSString *imgName;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *address;

/// 模型初始化
/// @param imgName 图标
/// @param name 名字
/// @param address 地址
- (instancetype)initWithImg:(NSString *)imgName name:(NSString *)name address:(NSString *)address;

@end

NS_ASSUME_NONNULL_END
