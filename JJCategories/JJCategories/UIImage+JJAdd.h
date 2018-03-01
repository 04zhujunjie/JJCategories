//
//  UIImage+JJAdd.h
//  JJCategories
//
//  Created by JMZiXun on 2018/2/27.
//  Copyright © 2018年 JMZiXun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JJAdd)
@property (nonatomic,readonly,assign) CGFloat height;
@property (nonatomic,readonly,assign) CGFloat width;
/**
 修改图片尺寸大小
 
 @param size 要设置的大小
 @return 返回修改过后图片
 */
-(UIImage*)jj_scaleToSize:(CGSize)size;

/**
 将颜色页面转成图片
 @param color 颜色
 @param size 大小
 @return 图片
 */
+ (UIImage *)jj_imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 裁剪图片，取宽和高的最小值为裁剪后的图片的宽高
 
 @return 裁剪图片
 */
- (UIImage *)jj_imageByCropping;

/**
 图片旋转
 
 @param orientation 旋转方向
 @return 旋转后图片
 */
- (UIImage *)jj_imageRotation:(UIImageOrientation)orientation;

/**
 修改图片的透明度
 
 @param alpha 透明度 0～1
 @return 返回修改过后图片
 */
- (UIImage *)jj_changeAlpha:(CGFloat)alpha;

/**
 将图片裁进行边框，圆角设置
 
 @param radius 圆角的设置
 @param borderWidth 图片边框宽度
 @param borderColor 边框颜色
 @return 返回裁剪图片
 */
- (UIImage *)jj_circleRadius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

@end
