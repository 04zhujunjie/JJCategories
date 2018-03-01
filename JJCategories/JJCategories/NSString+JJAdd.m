//
//  NSString+JJAdd.m
//  JJCategories
//
//  Created by JMZiXun on 2018/2/28.
//  Copyright © 2018年 JMZiXun. All rights reserved.
//

#import "NSString+JJAdd.h"

@implementation NSString (JJAdd)
/**
 判断字符串是否有值,空格不是值
 返回YES表示有值，NO表示为空
 */
- (BOOL)isHaveValue{
    
    BOOL haveVORS = [self isHaveValueOrSpace];
    //说明有值，需要进一步判断是否全是空格
    if (haveVORS) {
        NSString *valueOrSpace = [NSString stringWithString:self];
        //说明全部是空格
        if ([valueOrSpace stringByReplacingOccurrencesOfString:@" " withString:@""].length == 0) {
            return NO;
        }
    }
    return [self isHaveValueOrSpace];
}
/**
 判断字符串是否有值,空格也是值
 返回YES表示有值，NO表示为空
 */
- (BOOL)isHaveValueOrSpace{
    
    if(self.length){
        return  YES;
    }
    return NO;
    
}
/**
 去空格
 */
- (NSString *)removeSpace{
    
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

@end
