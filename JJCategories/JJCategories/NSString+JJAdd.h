//
//  NSString+JJAdd.h
//  JJCategories
//
//  Created by JMZiXun on 2018/2/28.
//  Copyright © 2018年 JMZiXun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JJAdd)

/**
  判断字符串是否有值,空格不是值
  返回YES表示有值，NO表示为空
 */
@property (nonatomic,readonly,assign) BOOL isHaveValue;

/**
 判断字符串是否有值,空格也是值
 返回YES表示有值，NO表示为空
 */
@property (nonatomic,readonly,assign) BOOL isHaveValueOrSpace;

/**
 去空格
 */
@property (nonatomic,readonly,copy) NSString *removeSpace;

@end
