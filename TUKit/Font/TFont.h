//
//  TFont.h
//  TUKit
//
//  Created by liu nian on 2020/3/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TFont : UIFont

+ (UIFont *)otsNumberFontOfSize:(CGFloat)fontSize;

/// 小号字体 iPhone:10,ipad:12
+ (UIFont *)small;

/// 中号字体 iPhone:12,ipad:14
+ (UIFont *)medium;

/// 大号字体 iPhone:14,ipad:16
+ (UIFont *)large;

/// 超大号字体 iPhone:18,ipad:20
+ (UIFont *)bigLarge;
@end

NS_ASSUME_NONNULL_END
