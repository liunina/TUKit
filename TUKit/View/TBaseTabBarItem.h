//
//  TBaseTabBarItem.h
//  TUKit
//
//  Created by liu nian on 2020/3/29.
//

#import "TBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@class TBaseTabBarItem;

@protocol TBaseTabBarItemDelegate <NSObject>
- (void)tabBarItemDidSelectItem:(TBaseTabBarItem *)item;
@end

@interface TBaseTabBarItem : TBaseView
/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  标题label
 */
@property (nonatomic, strong, readonly) UILabel *titleLabel;
/**
 *  默认图片
 */
@property (nonatomic, strong) UIImage *image;
/**
 *  选中时候的图片
 */
@property (nonatomic, strong) UIImage *selectedImage;
/**
 *  图片的偏移
 */
@property (nonatomic) UIEdgeInsets imageInsets;
/**
 *  提示字符
 */
@property (nonatomic, copy) NSString *badgeValue;
/**
 *  显示红点指示
 */
@property (nonatomic) BOOL showIndicate;
/**
 *  是否选中
 */
@property (nonatomic, getter = isSelected) BOOL selected;
/**
 *  是否显示标题
 */
@property (nonatomic, getter = isShowWord) BOOL showWord;
/**
 *  代理
 */
@property (nonatomic, weak) id<TBaseTabBarItemDelegate> delegate;
/**
 *  创建函数
 *
 *  @param title         标题
 *  @param image         默认图片
 *  @param selectedImage 选中时候的图片
 *
 *  @return OTSTabBarItem
 */
+ (instancetype)itemWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage;

@end


NS_ASSUME_NONNULL_END
