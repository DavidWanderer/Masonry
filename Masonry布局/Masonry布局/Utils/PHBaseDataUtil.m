//
//  PHBaseDataUtil.m
//  FBSnapshotTestCase
//
//

#import "PHBaseDataUtil.h"

#define NUMBER(__OBJ) [NSNumber numberWithInt:__OBJ]
#define NUMBER_LONG(__OBJ) [NSNumber numberWithLong:__OBJ]
#define NUMBER_DOUBLE(__OBJ) [NSNumber numberWithDouble:__OBJ]

@implementation PHBaseDataUtil

+ (BOOL)isPHKindOfClass:(id)value class:(Class)class
{
    if (value && ![value isEqual:[NSNull null]] && [value isKindOfClass:class]) {
        return  TRUE;
    }
    
    return FALSE;
}

+ (BOOL)isPHKindOfDictionary:(id)value
{
    return [self isPHKindOfClass:value class:[NSDictionary class]];
}

+ (BOOL)isPHKindOfNSNumber:(id)value
{
    
    return [self isPHKindOfClass:value class:[NSNumber class]];
}

+ (BOOL)isPHKindOfArray:(id)value
{
    
    return [self isPHKindOfClass:value class:[NSArray class]];
}

+ (BOOL)isPHKindOfString:(id)value
{
    return [self isPHKindOfClass:value class:[NSString class]];
}

+ (NSString * _Nonnull)paramStringIsNull:(id)param {
    if ([self isPHKindOfClass:param class:[NSString class]]) { // 是NSString类型,并且非空
        return param;
    } else { // 非NSString类型
        return @"";
    }
}

+ (NSString *)paramStringIsNull:(NSString *)param format:(NSString *)format {
    return ([param isEqual:[NSNull null]] || param == nil || [param isEqualToString:@""]) ? format : param;
}

+ (NSArray * _Nonnull)paramArrayIsNull:(id)param {
    if ([self isPHKindOfClass:param class:[NSArray class]]) { // 是NSArray类型,并且非空
        return param;
    } else { // 非NSArray类型
        return [NSArray array];
    }
}

+ ( NSDictionary * _Nonnull )paramDictIsNull:(id)param {
    if ([self isPHKindOfClass:param class:[NSDictionary class]]) { // 是NSDictionary类型,并且非空
        return param;
    } else { // 非NSDictionary类型
        return [NSDictionary dictionary];
    }
}

+ (NSData * _Nonnull)paramDataIsNull:(id)param {
    if ([self isPHKindOfClass:param class:[NSData class]]) { // 是NSData类型,并且非空
        return param;
    } else { // 非NSData类型
        return [NSData data];
    }
}

+ (NSNumber *)paramNumberIsNull:(NSNumber *)param
{
    if ([param isKindOfClass:[NSNumber class]]) {
        
        return ([param isEqual:[NSNull null]] || param == nil || [param isEqual: @""]) ? NUMBER(0) : param;
    }else if ([param isKindOfClass:[NSString class]]) {
        NSString *num = (NSString *)param;
        return [[self paramStringIsNull:num] isEqualToString:@""] ? NUMBER(0) : [NSNumber numberWithDouble:[num doubleValue]];
    }
    
    return NUMBER(0);
}

+ (NSNumber *)paramNumberDoubleIsNull:(NSNumber *)param
{
    if ([param isKindOfClass:[NSNumber class]]) {
        
        return ([param isEqual:[NSNull null]] || param == nil || [param isEqual: @""]) ? NUMBER(0) : param;
    }else if ([param isKindOfClass:[NSString class]]) {
        NSString *num = (NSString *)param;
        return [[self paramStringIsNull:num] isEqualToString:@""] ? NUMBER(0) : [NSNumber numberWithDouble:[num doubleValue]];
    }
    return NUMBER(0);
}

@end
