//
//  UITextField+JJAdd.m
//  JJCategories
//
//  Created by JMZiXun on 2018/2/27.
//  Copyright © 2018年 JMZiXun. All rights reserved.
//

#import "UITextField+JJAdd.h"
#import <objc/runtime.h>

@implementation UITextField (JJAdd)

/**
 限制文本输入个数
 
 @param length 限制个数
 */
- (void)jj_length:(NSInteger)length{
    
    self.maxLength = length;
    [self addTarget:self action:@selector(textFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
    
}
/**
 输入文本时回调方法
 
 @param limit 回调Block
 */
- (void)jj_lengthLimit:(LimitBlock)limit{
    self.limitBlock = limit;
    [self addTarget:self action:@selector(textFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
}

- (void)textFieldEditChanged:(UITextField *)textField {
    
    NSString *lang = [[UIApplication sharedApplication]textInputMode].primaryLanguage; // 键盘输入模式
    // 简体中文输入，包括简体拼音，健体五笔，简体手写
    if ([lang isEqualToString:@"zh-Hans"]) {
        UITextRange *selectedRange = [textField markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            [self setupText];
        }
        // 有高亮选择的字符串，则暂不对文字进行统计和限制
        else{
            
        }
    }
    
    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    else{
        
        [self setupText];
    }
    
}
- (void)setupText{
    
    if (self.limitBlock) {
        self.limitBlock();
        return ;
    }
    if (self.text.length > self.maxLength) {
        self.text = [self.text substringToIndex:self.maxLength];
    }
}

/**
 设置placeholder文本，颜色、字体，对齐方式
 
 @param placeholder 文本
 @param color 颜色，可传nil
 @param font 字体，可传nil
 @param alignment 对齐方式
 */
- (void)jj_placeholder:(NSString *)placeholder color:(UIColor *)color font:(UIFont *)font alignment:(JJPlaceholderAlignment)alignment{
    self.placeholder = placeholder;
    UILabel *placeholderLabel = [self valueForKeyPath:@"_placeholderLabel"];
    if (color) {
        placeholderLabel.textColor = color;
    }
    if (font) {
        placeholderLabel.font = font;
    }
    NSTextAlignment am = NSTextAlignmentLeft;
    if (alignment == JJPlaceholderAlignmentCenter) {
        am = NSTextAlignmentCenter;
    }
    placeholderLabel.textAlignment = am;
}

- (void)setMaxLength:(NSInteger)maxLength{
    objc_setAssociatedObject(self, @selector(maxLength), @(maxLength), OBJC_ASSOCIATION_COPY);
}


- (NSInteger)maxLength{
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

- (void)setLimitBlock:(LimitBlock)limitBlock {
    objc_setAssociatedObject(self, @selector(limitBlock), limitBlock, OBJC_ASSOCIATION_COPY);
}

- (LimitBlock)limitBlock {
    return objc_getAssociatedObject(self, _cmd);
}

- (UIColor *)placeholderColor{
    return [self placeholderLabel].textColor;
}

- (UIFont *)placeholderFont{
    return [self placeholderLabel].font;
}

- (JJPlaceholderAlignment)placeholderAlignment{
    return [@([self placeholderLabel].textAlignment) integerValue];
}

- (UILabel *)placeholderLabel{
    
    return [self valueForKeyPath:@"_placeholderLabel"];
}

@end
