//
//  UIView+TUKit.h
//  TUKit
//
//  Created by liu nian on 2020/3/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (IB)

@property (nonatomic) IBInspectable CGFloat cornerRadius;

@end

@interface UIView (Loading)

#pragma mark - loading

/**
 *  功能:显示loading
 */
- (void)showLoading;

/**
 *  功能:显示loading
 */
- (void)showLoadingWithMessage:(NSString * _Nullable)message;

/**
 *  功能:显示loading
 */
- (void)showLoadingWithMessage:(NSString * _Nullable)message hideAfter:(NSTimeInterval)second;

/**
 *  功能:显示loading
 */
- (void)showLoadingWithMessage:(NSString * _Nullable)message onView:(UIView *)aView hideAfter:(NSTimeInterval)second;

/**
 *  功能:隐藏loading
 */
- (void)hideLoading;

/**
 *  功能:隐藏loading
 */
- (void)hideLoadingOnView:(UIView *)aView;

/**
 *  功能:显示非模态loading
 */
- (void)showNonModelLoading;

/**
 *  功能:隐藏非模态loading
 */
- (void)hideNonModelLoading;

@end

NS_ASSUME_NONNULL_END
