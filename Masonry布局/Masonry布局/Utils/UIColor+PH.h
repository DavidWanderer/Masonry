//
//  UIColor+PH.h
//  FBSnapshotTestCase
//
//  十六进制字符串获取UIColor

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (PH)

/**
 十六进制转UIColor，默认alpha值为1.0f
 @param color 十六进制色值字符串
 @return UIColor对象
 */
+ (UIColor *)ph_colorWithHexString:(NSString *)color;

/**
 判断HexString是否是有效色值
 @param color 十六进制
 @return yes：是有效色值；No：不是有效色值
 */
+ (BOOL)ph_colorStatusWithHexString:(NSString *)color;

/**
 十六进制转UIColor
 @param color 十六进制色值字符串
 @param alpha 不透明度设置
 @return UIColor对象
 */
+ (UIColor *)ph_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
