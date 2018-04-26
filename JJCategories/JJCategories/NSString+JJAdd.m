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
- (void)jj_removeSpace{
    [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

/**
 是否是有效手机号码
 */
- (BOOL)jj_isCellPhoneNumber{
    if (self.length == 0){
        return NO;
    }
    
    NSString *mobile = [self mutableCopy];
    [mobile jj_removeSpace];
    /**
     * 正则：手机号（精确）
     * 移动：134(0-8)、135、136、137、138、139、147、150、151、152、157、158、159、178、182、183、184、187、188、198
     * 联通：130、131、132、145、155、156、175、176、185、186、166
     * 电信：133、153、173、177、180、181、189、199
     * 全球星：1349
     * 虚拟运营商：170
     */
    
    NSString *num = @"^((13[0-9])|(14[5,7])|(15[0-3,5-9])|(17[0,3,5-8])|(18[0-9])|166|198|199|(147))\\d{8}$";
    NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", num];
    BOOL isValid = [pred1 evaluateWithObject:mobile];
    if (isValid) {
        return YES;
    }
    return NO;
}

/**
 判断是否是全是数字
 */
- (BOOL)jj_isAllNum{
    if (self.length == 0){
        return NO;
    }
    NSString *regex = @"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:self]) {
        return YES;
    }
    return NO;
}

- (BOOL)jj_isEmail{
    if (self.length == 0){
        return NO;
    }
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [predicate evaluateWithObject:self];
}

/**
 判断是否全汉字
 */
- (BOOL)jj_isChinese{
    if (self.length == 0){
        return NO;
    }
    NSString *regex = @"[\u4e00-\u9fa5]+";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pred evaluateWithObject:self];

}
/**
 判断是否全字母
 */
- (BOOL)jj_isLetter{
    if (self.length == 0){
        return NO;
    }
    NSString *regex =@"[a-zA-Z]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pred evaluateWithObject:self];
}

/**
 判断是否是数字或字母
 */
- (BOOL)jj_isLetterOrNum{
    if (self.length == 0) return NO;
    NSString *regex =@"[a-zA-Z0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pred evaluateWithObject:self];
}

@end
