//
//  NSArray+JJAdd.h
//  JJCategories
//
//  Created by JMZiXun on 2018/2/27.
//  Copyright © 2018年 JMZiXun. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSArray (JJAdd)
/**
 对数组中NSString或NSNumber元素进行排序
 返回一个新的不可变排序数组
 
 @param ascending 是否是升序，YES表示升序，NO表示降序
 @return 排序后数组
 */
- (NSArray *)jj_sortWithAscending:(BOOL)ascending;

/**
 根据模型Model的属性，对模型进行排序,
 NSArray对象调用，返回一个新的不可变排序数组
 NSMutableArray 对象调用，返回可变的排序后self对象
 
 @param key Model的属性
 @param ascending 是否是升序，YES表示升序，NO表示降序
 @return 排序后数组
 */
- (NSArray *)jj_sortWithModelKey:(NSString *)key ascending:(BOOL)ascending;

/**
 数组去重，乱序，去重对象：NSString，NSNumber，自定义模型Model等

 @return 返回新的数组
 */
- (NSArray *)jj_toHeavy;

/**
 根据key值去重，乱序，去重对象:自定义模型Model

 @param key 对象Model的属性字段名
 @return 返回新的数组
 */
- (NSArray *)jj_toHeavyWithKey:(NSString *)key;

/**
 两个数数组交集操作
 如：self = @[@"1",@"2",@"3"]; datas = @[@"1",@"4",@"5"];
 取子集后的结果：@[@"1"];
 
 @param datas 另一个数据源
 @return 取子集数组
 */
- (NSArray *)jj_intersectSetWithArray:(NSArray *)datas;

/**
 两个数数组并集操作
 如：self = @[@"1",@"2",@"3"]; datas = @[@"1",@"4",@"5"];
 并集后的结果：@[@"1",@"2",@"3"，@"4",@"5"];
 
 @param datas 另一个数据源
 @return 取并集数组
 */
- (NSArray *)jj_unionSetWithArray:(NSArray *)datas;
/**
 两个数数组差集操作
 如：self = @[@"1",@"2",@"3"]; datas = @[@"1",@"4",@"5"];
 并集后的结果：@[@"2",@"3"];
 
 @param datas 另一个数据源
 @return 取差集数组
 */
- (NSArray *)jj_minusSetWithArray:(NSArray *)datas;


/**
 判断self数组是否是datas的子集

 @param datas 数据源
 @return YES表示是，NO表示不是
 */
- (BOOL)jj_isSubsetOfArray:(NSArray *)datas;


/**
 对数组中的Model模型进行模糊筛选

 @param key Model模型的属性名称
 @param value 筛选值
 @return 筛选后的数组
 */
- (NSMutableArray *)jj_filteredWithKey:(NSString *)key value:(NSString *)value;


/**
 对数组中的Model模型进行精准筛选
 模型key的值和value值相等
 
 @param key Model模型的属性名称
 @param value 筛选值
 @return 筛选后的数组
 */
- (NSMutableArray *)jj_preciseFilteredWithKey:(NSString *)key value:(id)value;

@end

NS_ASSUME_NONNULL_END

@interface NSMutableArray (JJAdd)

/**
 *  删除第1个对象
 */
- (void)jj_removeFirstObject;
/**
 *  @brief 拿出并删除第1个对象
 *
 *  @return 数组为空时返回nil
 */
- (nullable id)jj_popFirstObject;

/**
 *  @brief 拿出并删除最后1个对象
 *
 *  @return 数组为空时返回nil
 */
- (nullable id)jj_popLastObject;
/**
 *  @brief 在index0前面插入数组
 */
- (void)jj_prependArray:(NSArray *_Nullable)objects;

/**
 *  @brief 任意位置插入数组
 */
- (void)jj_insertArray:(NSArray *_Nullable)objects atIndex:(NSUInteger)index;

@end

