//
//  NSArray+JJAdd.m
//  JJCategories
//
//  Created by JMZiXun on 2018/2/27.
//  Copyright © 2018年 JMZiXun. All rights reserved.
//

#import "NSArray+JJAdd.h"

@implementation NSArray (JJAdd)


/**
 对数组中NSString或NSNumber元素进行排序
 返回一个新的不可变排序数组
 
 @param ascending 是否是升序，YES表示升序，NO表示降序
 @return 排序后数组
 */
- (NSArray *)jj_sortWithAscending:(BOOL)ascending{
    
    NSArray *array =  [self sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        
        if (ascending) {
            return [obj1 compare:obj2];
        }else{
            return [obj2 compare:obj1];
        }
    }];
    return array;
}

/**
 根据模型Model的属性，对模型进行排序
 NSArray对象调用，返回一个新的不可变排序数组
 NSMutableArray 对象调用，返回可变的排序后self对象
 
 @param key Model的属性
 @param ascending 是否是升序，YES表示升序，NO表示降序
 @return 排序后数组
 */
- (NSArray *)jj_sortWithModelKey:(NSString *)key ascending:(BOOL)ascending{
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:key ascending:ascending];
    NSArray *sortDescriptorArr = [NSArray arrayWithObject:sortDescriptor];
    if ([self isKindOfClass:[NSMutableArray class]]) {
        
        NSMutableArray *dataArray = (NSMutableArray *)self;
        [dataArray sortUsingDescriptors:sortDescriptorArr];
        return self;
    }
    return  [self sortedArrayUsingDescriptors:sortDescriptorArr];
}
/**
 数组去重，乱序，去重对象：NSString，NSNumber，自定义模型Model等
 
 @return 返回新的数组
 */
- (NSArray *)jj_toHeavy{
    return [NSSet setWithArray:self].allObjects;
}

/**
 根据key值去重，乱序，去重对象:自定义模型Model
 
 @param key 对象Model的属性字段名
 @return 返回新的数组
 */
- (NSArray *)jj_toHeavyWithKey:(NSString *)key{
    
   
    if (!self.count) {
        return self;
    }
    id firstObject = self.firstObject;
    NSMutableDictionary *newDic = [NSMutableDictionary dictionary];
    NSBundle *mainB = [NSBundle bundleForClass:[firstObject class]];
    if (mainB == [NSBundle mainBundle]) {
//        NSLog(@"自定义的类");
        for (id object in self) {
            
            NSString *value = [NSString stringWithFormat:@"%@",[object valueForKey:key]];
            if (value.length) {
                [newDic setObject:object forKey:value];
            }else{
                [newDic setObject:object forKey:@"JJAddKey"];
            }
        }
        return newDic.allValues;
    }else{
//         NSLog(@"系统的类");
        return self;
    }
    
}

/**
 两个数数组交集操作
 如：self = @[@"1",@"2",@"3"]; datas = @[@"1",@"4",@"5"];
 取子集后的结果：@[@"1"];
 
 @param datas 另一个数据源
 @return 取子集数组
 */
- (NSArray *)jj_intersectSetWithArray:(NSArray *)datas{
    
    NSMutableSet *set1 = [NSMutableSet setWithArray:self];
    NSMutableSet *set2 = [NSMutableSet setWithArray:datas];
    [set1 intersectSet:set2];
    return set1.allObjects;
}

/**
 两个数数组并集操作
 如：self = @[@"1",@"2",@"3"]; datas = @[@"1",@"4",@"5"];
 并集后的结果：@[@"1",@"2",@"3"，@"4",@"5"];
 
 @param datas 另一个数据源
 @return 取并集数组
 */
- (NSArray *)jj_unionSetWithArray:(NSArray *)datas{
    NSMutableSet *set1 = [NSMutableSet setWithArray:self];
    NSMutableSet *set2 = [NSMutableSet setWithArray:datas];
    [set1 unionSet:set2];
    return set1.allObjects;
}

/**
 两个数数组差集操作
 如：self = @[@"1",@"2",@"3"]; datas = @[@"1",@"4",@"5"];
 并集后的结果：@[@"2",@"3"];
 
 @param datas 另一个数据源
 @return 取差集数组
 */
- (NSArray *)jj_minusSetWithArray:(NSArray *)datas{
    NSMutableSet *set1 = [NSMutableSet setWithArray:self];
    NSMutableSet *set2 = [NSMutableSet setWithArray:datas];
    [set1 minusSet:set2];
    return set1.allObjects;
}

/**
 判断self数组是否是datas的子集
 
 @param datas 数据源
 @return YES表示是，NO表示不是
 */
- (BOOL)jj_isSubsetOfArray:(NSArray *)datas{
    NSSet *set1 = [NSSet setWithArray:self];
    NSSet *set2 = [NSSet setWithArray:datas];
    return [set1 isSubsetOfSet:set2];
}

/**
 对数组中的Model模型进行模糊筛选
 
 @param key Model模型的属性名称
 @param value 筛选值
 @return 筛选后的数组
 */
- (NSMutableArray *)jj_filteredWithKey:(NSString *)key value:(NSString *)value{
    
    NSMutableArray *filteredArray = [NSMutableArray new];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
          id objV = [obj valueForKey:key];
        if (objV) {
            NSString *objValue = [NSString stringWithFormat:@"%@",objV];
            NSRange range = [objValue rangeOfString:value];
            if (range.length) {
                [filteredArray addObject:obj];
            }
        }
    }];
    return filteredArray;
    //谓词筛选时，属性要为NSString, 如果属性为NSInteger会报错
    //     NSPredicate *filteredPredicate = [NSPredicate predicateWithFormat:@"SELF.%@ CONTAINS[c]%@",key,value];
//    NSMutableArray *dataArray = [self mutableCopy];
//   return  [dataArray filteredArrayUsingPredicate:filteredPredicate];
    
}

/**
 对数组中的Model模型进行精准筛选
 模型key的值和value值相等
 
 @param key Model模型的属性名称
 @param value 筛选值
 @return 筛选后的数组
 */
- (NSMutableArray *)jj_preciseFilteredWithKey:(NSString *)key value:(id)value{
    NSMutableArray *filteredArray = [NSMutableArray new];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        id objV = [obj valueForKey:key];
        if (objV) {
            NSString *objValue = [NSString stringWithFormat:@"%@",objV];
            
            if ([objValue isEqualToString:[NSString stringWithFormat:@"%@",value]]) {
                [filteredArray addObject:obj];
            }
        }
    }];
    return filteredArray;
}

@end

@implementation NSMutableArray (JJAdd)

/**
 *  删除第1个对象
 */
- (void)jj_removeFirstObject{
    
    if (self.count) {
        [self removeObjectAtIndex:0];
    }
}
/**
 *  @brief 拿出并删除第1个对象
 *
 *  @return 数组为空时返回nil
 */
- (nullable id)jj_popFirstObject{
    id obj = nil;
    if (self.count) {
        obj = self.firstObject;
        [self jj_removeFirstObject];
    }
    return obj;
}

/**
 *  @brief 拿出并删除最后1个对象
 *
 *  @return 数组为空时返回nil
 */
- (nullable id)jj_popLastObject{
    id obj = nil;
    if (self.count) {
        obj = self.lastObject;
        [self removeLastObject];
    }
    return obj;
}
/**
 *  @brief 在index0前面插入数组
 */
- (void)jj_prependArray:(NSArray *)objects{
    [self jj_insertArray:objects atIndex:0];
}

/**
 *  @brief 任意位置插入数组
 */
- (void)jj_insertArray:(NSArray *)objects atIndex:(NSUInteger)index{
    if (!objects.count) {
        return;
    }
    NSUInteger i = index;
    for (id obj in objects) {
        [self insertObject:obj atIndex:i++];
    }
}

@end
