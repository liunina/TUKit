//
//  TBaseTabBarView.h
//  TUKit
//
//  Created by liu nian on 2020/3/29.
//

#import "TBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@class TBaseTabBarItem,TBaseTabBarView;
@protocol TBaseTabBarViewDelegate <NSObject>
- (void)customTabBar:(TBaseTabBarView *)tabBar didSelectItem:(TBaseTabBarItem *)item;
@end

@interface TBaseTabBarView : TBaseView
/**
 *  背景图片
 */
@property (nonatomic, strong) UIImage *backgroundImage;
/**
 *  代理
 */
@property (nonatomic, weak) id<TBaseTabBarViewDelegate> delegate;
/**
 *  当前选中的tabbarItem
 */
@property (nonatomic, weak, readonly) TBaseTabBarItem *selectedItem;
/**
 *  当前选中的tabbarItem的序号
 */
@property (nonatomic, readonly) NSUInteger selectedIndex;

@end

NS_ASSUME_NONNULL_END
