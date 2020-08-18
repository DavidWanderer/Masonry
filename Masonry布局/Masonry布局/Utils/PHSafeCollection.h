//
//  PHSafeCollection.h
//  PHUtils
//
//  集合类的防护

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PHSafeCollection : NSObject

@end

@interface NSArray (PH)

/**
 获取NSArray中索引位置的对象，数组越界就返回 nil
 @param index 索引
 @return 索引位置的对象
 */
- (id)ph_objectAtIndex:(NSUInteger)index;

/**
 一组非空对象放入数组，空对象会被丢弃，返回新的NSArray对象
 @param objects 一组对象
 @param cnt 数组长度
 @return 数组对象
 */
+ (id)ph_arrayWithObjects:(const id _Nonnull [ _Nonnull]) objects count:(NSUInteger)cnt;
@end

@interface NSMutableArray (PH)

/**
 获取NSMutableArray中索引位置的对象，数组越界返回nil
 @param index 索引
 @return 索引位置对象
 */
- (id)ph_objectAtIndex:(NSUInteger)index;

/**
 添加一个对象到数组中，如果对象为空，则不做任何操作
 @param anObject 需要添加的对象
 */
- (void)ph_addObject:(id)anObject;

/**
 替换索引位置的对象，如果索引越界或传入的对象为空，则不做任何操作
 @param index 索引
 @param anObject 需要插入的对象
 */
- (void)ph_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;

/**
 在特定的索引位置插入对象，如果索引越界或需要插入的对象为空，则不做任何操作
 @param anObject 需要插入的对象
 @param index 索引
 */
- (void)ph_insertObject:(id)anObject atIndex:(NSUInteger)index;
@end

@interface NSDictionary (PH)

/**
 根据Value Array和Key Array返回一个NSDictionary

 @param objects 值对象
 @param keys 键对象
 @return 返回一个NSDictionary对象
 */
+ (instancetype)ph_dictionaryWithObjects:(NSArray *)objects forKeys:(NSArray *)keys;

/**
 根据Value Array和Key Array返回一个特定长度的NSDictionary

 @param objects 值对象数组
 @param keys 键对象数组
 @param cnt 字典长度
 @return 返回一个NSDictionary对象
 */
+ (instancetype)ph_dictionaryWithObjects:(const id _Nonnull [_Nonnull])objects forKeys:(const _Nonnull id <NSCopying> [_Nonnull])keys count:(NSUInteger)cnt;
@end

@interface NSMutableDictionary (PH)

/**
 设置字典中的Key对应的值，如果Key为空或对应的值为空，则不做任何操作

 @param anObject 值对象
 @param aKey 键对象
 */
- (void)ph_setObject:(id)anObject forKey:(id<NSCopying>)aKey;
@end

NS_ASSUME_NONNULL_END
