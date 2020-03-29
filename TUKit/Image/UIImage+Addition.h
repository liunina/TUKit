//
//  UIImage+Addition.h
//  TUKit
//
//  Created by liu nian on 2020/3/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Barcode)

/// 生成条形码
/// @param content  号码
/// @param size 图片大小（如果条码的长度比较长，分辨率设置要高一些）
+ (UIImage *)barcodeImageWithContent:(NSString *)content imageSize:(CGSize)size;

@end

@interface UIImage (bundleRes)

/// 从bundle中创建image
/// @param name image名称
/// @param bundleName bundle名称
+ (UIImage *)imageNamed:(NSString *)name bundleName:(NSString *)bundleName;

@end

@interface UIImage (TColor)
- (UIImage *)imageTintedWithColor:(UIColor *)color;
- (UIImage *)imageTintedWithColor:(UIColor *)color fraction:(CGFloat)fraction;
@end

@interface UIImage (tool)

/// 通过颜色创建image
/// @param aColor 颜色
+ (UIImage *)imageWithColor:(UIColor *)aColor;

+ (UIImage *)imageWithColor:(UIColor *)aColor cornerRadius:(float)cornerRadius;

/// 视图转换为UIImage
/// @param view view
+ (UIImage *)imageWithView:(UIView *)view;

+ (UIImage *)image:(UIImage *)image WithTintColor:(UIColor *)tintColor;

///	设置图片透明度
- (UIImage *)imageByApplyingAlpha:(CGFloat)alpha;

/// 等比例缩放
/// @param size 大小
- (UIImage*)scaleToSize:(CGSize)size;

/// 按照尺寸缩放图片
/// @param aSize aSize
- (UIImage *)shrinkImageForSize:(CGSize)aSize;

/// 功能:存储图片到doc目录
/// @param imageName 图片名称
/// @param aQuality 压缩比率
- (NSString *)saveImageWithName:(NSString *)imageName
		  forCompressionQuality:(CGFloat )aQuality;

@end


NS_ASSUME_NONNULL_END
