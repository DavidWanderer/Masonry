//
//  NSString+PH.m
//  Masonry布局
//
//  Created by Hu, Yuping on 2019/12/19.
//  Copyright © 2019 Hu, Yuping. All rights reserved.
//

#import "NSString+PH.h"

@implementation NSString (PH)

//判断手机号是否有效
+ (BOOL)ph_isValidPhoneNumber:(NSString *)phoneNumber {
    NSString *MOBILE = @"^[1][0-9]{10}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    if (([regextestmobile evaluateWithObject:phoneNumber] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

//判断邮箱是否有效
+ (BOOL)ph_isValidEmail:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

//判断是否是纯数字
+ (BOOL)ph_isValidNumber:(NSString *)number {
    NSString *numberRegex = @"[0-9]+";
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
    return [numberTest evaluateWithObject:number];
}

//是否有汉字
+ (BOOL)ph_isChineseCharacters:(NSString *)string {
    NSString * regex        = @".*[\\u4e00-\\u9faf].*";
    NSPredicate * pred      = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:string];
}

//是否是空字符串
+ (BOOL)ph_isNilOrEmpty:(NSString *)value {
    if (value && ![value isEqual:[NSNull null]] && [value isKindOfClass:[NSString class]]) {
        NSString *trimValue = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if (trimValue.length > 0) {
            return NO;
        } else {
            return YES;
        }
    }
    return YES;
}

//字符串是否非空并且非Nil
+ (BOOL)ph_notNilAndNotEmpty:(NSString *)value {
    return ![self ph_isNilOrEmpty:value];
}

//计算一个字符串在特定区域的CGSize
//+ (CGSize)ph_boundSizeWithString:(NSString *)valueStr font:(UIFont *)font size:(CGSize)originSize {
//    NSString *originStr = valueStr;
//    CGSize size = originSize;
//    CGSize labelsize;
//    
//    if (![originStr respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Wdeprecated-declarations"
//        labelsize = [originStr sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
//#pragma clang diagnostic pop
//        
//    } else {
//        NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
//        [style setLineBreakMode:NSLineBreakByWordWrapping];
//        
//        if (@available(iOS 7.0, *)) {
//            labelsize = [originStr boundingRectWithSize:size
//                                                options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
//                                             attributes:@{ NSFontAttributeName:font, NSParagraphStyleAttributeName : style}
//                                                context:nil].size;
//        } else {
//            // Fallback on earlier versions
//        }
//    }
//    
//    return CGSizeMake(ceilf(labelsize.width), ceilf(labelsize.height));
//}

@end
