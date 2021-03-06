//
//  TColor.h
//  TUKit
//
//  Created by liu nian on 2020/3/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TColor : UIColor

/// Create a color from a HEX string.- #RGB ARGB RRGGBB AARRGGBB
/// @param hexString HEX string
+ (UIColor *)hex:(NSString *)hexString;

/// 通过0xffffff的16进制数字创建颜色
/// @param aRGB 0xffffff
+ (UIColor *)colorWithRGB:(NSUInteger)aRGB;

/// 公用颜色系.背景颜色#eeeeee
+ (UIColor *)bgColor;

/**
 *	公用的颜色系 #757575
 *
 *	@return UIColor
 */
+ (UIColor *)gray;

/**
 *	公用的颜色系 #0xbdbdbd
 *
 *	@return UIColor
 */
+ (UIColor *)lightGray;

/**
 *	公用的颜色系 #0x212121
 *
 *	@return UIColor
 */
+(UIColor *)darkGray;
/**
 *	公用的颜色系 #0xff3c25
 *
 *	@return UIColor
 */
+ (UIColor *)red;

/**
 *	公用的颜色系 #0xff9800
 *
 *	@return UIColor
 */
+ (UIColor *)orange;
/**
 *	公用的颜色系 #0xd32d21
 *
 *	@return UIColor
 */
+ (UIColor *)darkRed;
/**
 *	公用的颜色系 #0x97d054
 *
 *	@return UIColor
 */
+ (UIColor *)green;
/**
 *	我店红，擦擦
 *
 *	@return UIColor
 */
+(UIColor*)bgRed;

/**
 *	我店字体灰，呵呵呵
 *
 *	@return UIColor
 */
+(UIColor*)textGray;

/**
 *	 青色绿
 *
 *	@return UIColor
 */
+(UIColor*)lightGreen;

/**
 *   全白
 *
 *	@return UIColor
 */
+(UIColor*)allWhite;

/**
 *   全黑
 *
 *	@return UIColor
 */
+(UIColor*)allBlack;

/**
 *
 *  蓝色
 *	@return UIColor
 */
+(UIColor*)Blue;

/**
 *
 *  深色黑
 *	@return UIColor
 */
+(UIColor*)heightBlack;

/**
 *
 *  深色灰
 *	@return UIColor
 */
+(UIColor*)heightGray;

/**
 *
 *  轻色灰
 *	@return UIColor
 */
+(UIColor*)theLightGray;

/**
 *
 *  轻量蓝色
 *	@return UIColor
 */
+(UIColor*)lightBlue;

/**
 *
 *  浅色黑
 *	@return UIColor
 */
+(UIColor*)lightBlack;

/**
 *
 *  灰底色
 *	@return UIColor
 */
+(UIColor*)theGrayColor;


/**
 *
 *  红色
 *	@return UIColor
 */
+(UIColor*)theRedColor;

/**
 *
 *  黄色
 *	@return UIColor
 */
+(UIColor*)theYellowColor;

/**
 *
 *  紫色
 *	@return UIColor
 */
+(UIColor*)thePurpleColor;

/**
 *
 *  蓝色
 *	@return UIColor
 */
+(UIColor*)theBlueColor;

/**
 *
 *  橘色
 *	@return UIColor
 */
+(UIColor*)theOrangeColor;

/**
 *
 *  轻灰色
 *	@return UIColor
 */

+(UIColor*)lightGrayColor;

/**
 *
 *  罗兰色
 *	@return UIColor
 */

+(UIColor*)naveColor;

/**
 *
 *  浅红
 *	@return UIColor
 */

+(UIColor*)paleRedColor;

/**
 *
 *  浅黑色
 *	@return UIColor
 */

+(UIColor*)theLightBlack;

/**
 *
 *  水绿色
 *	@return UIColor
 */

+(UIColor*)waterGreenColor;

//随机颜色
+ (UIColor *)randomColor;


@end

NS_ASSUME_NONNULL_END
