//
//  TBorder.h
//  TUKit
//
//  Created by liu nian on 2020/3/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, TBorderType) {
    TBorderTypeNone      = 0,
    TBorderTypeTop    = 1 << 0,
    TBorderTypeLeft   = 1 << 1,
    TBorderTypeBottom = 1 << 2,
    TBorderTypeRight  = 1 << 3,
    TBorderTypeAll    = TBorderTypeTop | TBorderTypeLeft | TBorderTypeBottom | TBorderTypeRight
};

typedef NS_ENUM(NSInteger, TBorderViewType) {
    TBorderViewTypeTop    = 10086,
    TBorderViewTypeLeft,
    TBorderViewTypeBottom,
    TBorderViewTypeRight,
};

@interface TBorder : NSObject

/**
 *  为view添加边线
 *
 *  @param aView  view
 *  @param aType  边线类型，可以累计
 *  @param aColor 颜色
 */
+ (void)addBorderWithView:(UIView *)aView type:(TBorderType)aType andColor:(UIColor *)aColor;

/**
 *  为view添加边线，可以设置缩进
 *
 *  @param aView  view
 *  @param aType  边线类型，可以累计
 *  @param aColor 颜色
 *  @param aEdgeInset 缩进
 */
+ (void)addBorderWithView:(UIView *)aView type:(TBorderType)aType andColor:(UIColor *)aColor andEdgeInset:(UIEdgeInsets)aEdgeInset;

/**
 *  删除border
 *
 *  @param aView view
 *  @param aType 边线类型，可以累计
 */
+ (void)removeBorderWithView:(UIView *)aView type:(TBorderType)aType;

@end

NS_ASSUME_NONNULL_END
