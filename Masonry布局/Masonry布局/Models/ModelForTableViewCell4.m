//
//  ModelForTableViewCell4.m
//  Masonry布局
//
//  Created by Hu, Yuping on 2020/11/17.
//  Copyright © 2020 Hu, Yuping. All rights reserved.
//

#import "ModelForTableViewCell4.h"

@implementation ModelForTableViewCell4

- (instancetype)initWithImg:(NSString *)imgName name:(NSString *)name address:(NSString *)address {
    ModelForTableViewCell4 *model = [[ModelForTableViewCell4 alloc] init];
    model.imgName = imgName;
    model.name = name;
    model.address = address;
    return model;
}

@end
