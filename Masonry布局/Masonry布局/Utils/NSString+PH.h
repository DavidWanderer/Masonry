//
//  NSString+PH.h
//  Masonry布局
//
//  Created by Hu, Yuping on 2019/12/19.
//  Copyright © 2019 Hu, Yuping. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (PH)

/**
 判断手机号是否有效
 
 @param phoneNumber 手机号
 
 @return 返回Yes:有效； No:无效
 */
+ (BOOL)ph_isValidPhoneNumber:(NSString *)phoneNumber;

/**
 判断邮箱是否有效
 
 @param email 邮箱
 
 @return 返回Yes:有效； No:无效
 */
+ (BOOL)ph_isValidEmail:(NSString *)email;

/**
 判断是否是纯数字
 
 @param number 字符串
 
 @return 返回Yes:是； No:不是
 */
+ (BOOL)ph_isValidNumber:(NSString *)number;

/**
 *  判断是否包含汉字
 *
 *  @param string 字符串
 *
 *  @return Yes 包含汉字   No 不包含汉字
 */
+ (BOOL)ph_isChineseCharacters:(NSString *)string;

/**
 忽略首尾空格后，判断字符串是否为空或nil，是空就返回YES，非空返回NO
 
 @param value 待判断的字符串
 @return 返回 YES 或 NO
 */
+ (BOOL)ph_isNilOrEmpty:(NSString *)value;

/**
 忽略首尾空格后，判断字符串是否为非空或非nil，非空返回YES，是空返回NO
 
 @param value 待判断的字符串
 @return 返回YES 或 NO
 */
+ (BOOL)ph_notNilAndNotEmpty:(NSString *)value;

/**
 计算一个字符串在特定区域的CGSize
 
 @param valueStr 原始字符串
 @param font 字符串的字体大小
 @param originSize 字符串显示的区域
 @return 字符串的宽度和高度
 */
//+ (CGSize)ph_boundSizeWithString:(NSString *)valueStr font:(UIFont *)font size:(CGSize)originSize;

@end

NS_ASSUME_NONNULL_END
