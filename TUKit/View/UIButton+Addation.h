//
//  UIButton+Addation.h
//  TUKit
//
//  Created by liu nian on 2020/3/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, OTSUIButtonLayoutStyle) {
    OTSDefalutStyle = 0,//默认的方式
	OTSImageLeftTitleRightStyle = 1, // image左 title右
	OTSTitleLeftImageRightStyle = 2, // image右,title左
	OTSImageTopTitleBottomStyle = 3, //image上，title下
	OTSTitleTopImageBottomStyle = 4, // image下,title上
};

@interface UIButton(LayoutStyle)

/// 图片和文字显示方向
@property(nonatomic)IBInspectable OTSUIButtonLayoutStyle layoutStyle;

///  图片和文字之间的间距
@property (nonatomic, assign) IBInspectable CGFloat layoutSpacing;

/// 功能:设置UIButton的布局，图片和文字按照指定方向显示
/// @param aLayoutStyle aLayoutStyle:参见OTSUIButtonLayoutStyle
/// @param aSpacing aSpacing:图片和文字之间的间隔
- (void)setLayout:(OTSUIButtonLayoutStyle )aLayoutStyle
		  spacing:(CGFloat)aSpacing;
@end


NS_ASSUME_NONNULL_END
