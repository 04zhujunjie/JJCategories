//
//  UITextField+JJAdd.h
//  JJCategories
//
//  Created by JMZiXun on 2018/2/27.
//  Copyright © 2018年 JMZiXun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LimitBlock)(void);

typedef NS_ENUM(NSInteger, JJPlaceholderAlignment) {
    JJPlaceholderAlignmentLeft = 0,
    JJPlaceholderAlignmentCenter = 1,
};

@interface UITextField (JJAdd)

@property (nonatomic ,readonly,strong) UIColor *placeholderColor;
@property (nonatomic ,readonly,strong) UIFont *placeholderFont;
@property (nonatomic ,readonly,assign) JJPlaceholderAlignment placeholderAlignment;

/**
 限制文本输入个数
 
 @param length 限制个数
 */
- (void)jj_length:(NSInteger)length;

/**
 输入文本时回调方法
 
 @param limit 回调Block
 */
- (void)jj_lengthLimit:(LimitBlock)limit;

/**
 设置placeholder文本，颜色、字体，对齐方式
 
 @param placeholder 文本
 @param color 颜色，可传nil
 @param font 字体，可传nil
 @param alignment 对齐方式
 */
- (void)jj_placeholder:(NSString *)placeholder color:(UIColor *)color font:(UIFont *)font alignment:(JJPlaceholderAlignment)alignment;

@end
