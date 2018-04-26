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
- (void)jj_removeSpace;

/**
 是否是有效手机号码
 */
- (BOOL)jj_isCellPhoneNumber;

/**
 判断是否是全数字
 */
- (BOOL)jj_isAllNum;

/**
 判断是否邮箱
 
 */
- (BOOL)jj_isEmail;

/**
 判断是否全汉字
 */
- (BOOL)jj_isChinese;
/**
 判断是否全字母
 */
- (BOOL)jj_isLetter;

/**
 判断是否是数字或字母
 */
- (BOOL)jj_isLetterOrNum;

@end
