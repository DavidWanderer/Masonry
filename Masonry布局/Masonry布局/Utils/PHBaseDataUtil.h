//
//  PHBaseDataUtil.h
//  FBSnapshotTestCase
//
//  基本类型数据容错处理

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 *
 *
 *  @param X dic
 *  @param Y param
 *
 *  @return
 */
#define PHParseString(X,Y) [PHBaseDataUtil paramStringIsNull:[X objectForKey:Y]]
#define PHParseArray(X,Y) [PHBaseDataUtil paramArrayIsNull:[X objectForKey:Y]]
#define PHParseDict(X,Y) [PHBaseDataUtil paramDictIsNull:[X objectForKey:Y]]
#define PHParseNumber(X,Y) [PHBaseDataUtil paramNumberIsNull:[X objectForKey:Y]]
#define PHParseNumberDouble(X,Y) [PHBaseDataUtil paramNumberIsNull:[X objectForKey:Y]]
#define PHParseData(X,Y) [PHBaseDataUtil paramDataIsNull:[X objectForKey:Y]]
/**
 *
 *
 *  @param X param
 *
 *  @return
 */
#define PHParseStringS(X) [PHBaseDataUtil paramStringIsNull:X]
#define PHParseArrayS(X) [PHBaseDataUtil paramArrayIsNull:X]
#define PHParseDictS(X) [PHBaseDataUtil paramDictIsNull:X]
#define PHParseNumberS(X) [PHBaseDataUtil paramNumberIsNull:X]
#define PHParseNumberDoubleS(X) [PHBaseDataUtil paramNumberIsNull:X]
#define PHParseDataS(X) [PHBaseDataUtil paramDataIsNull:X]

@interface PHBaseDataUtil : NSObject

/**
 判断当前参数是不是一个NSString类型？返回 YES 或 NO
 @param value 未知参数
 @return 返回 YES 或 NO
 */
+ (BOOL)isPHKindOfString:(id)value;

/**
 判断当前参数是不是一个NSDictionary类型？返回 YES 或 NO
 @param value 未知参数
 @return 返回 YES 或 NO
 */
+ (BOOL)isPHKindOfDictionary:(id)value;

/**
 判断当前参数是不是NSArray类型？返回 YES 或 NO
 @param value 未知参数
 @return 返回 YES 或 NO
 */
+ (BOOL)isPHKindOfArray:(id)value;

/**
 判断当前参数是不是NSNumber类型？返回 YES 或 NO
 @param value 未知参数
 @return 返回 YES 或 NO
 */
+ (BOOL)isPHKindOfNSNumber:(id)value;

/**
 未知类型转换成安全的NSString类型，返回真实的字符串或者空字符串对象，返回值不为nil
 @param param 参数是id类型
 @return 返回真实的字符串或者空字符串对象，返回值不为nil
 */
+ (NSString * _Nonnull)paramStringIsNull:(id)param;

/**
 未知类型转换成安全的NSArray类型，返回真实的数组类型或者空的数组对象，返回值不为nil
 @param param 参数是id类型
 @return 返回真实的数组类型或者空的数组对象，返回值不为nil
 */
+ (NSArray * _Nonnull)paramArrayIsNull:(id)param;

/**
 未知类型转换成安全的NSDictionary类型，返回真实的字典或空字典对象，返回值不为nil
 @param param 参数是id类型
 @return 返回真实的字典或空字典对象，返回值不为nil
 */
+ (NSDictionary * _Nonnull)paramDictIsNull:(id)param;

/**
 未知类型转换成安全的NSData类型，返回真实的NSData对象或空的NSData对象，返回值不为nil
 @param param 参数是id类型
 @return 返回真实的NSData对象或空的NSData对象，返回值不为nil
 */
+ (NSData * _Nonnull)paramDataIsNull:(id)param;

+ (NSNumber *)paramNumberIsNull:(NSNumber *)param;
+ (NSNumber *)paramNumberDoubleIsNull:(NSNumber *)param;

@end

NS_ASSUME_NONNULL_END
