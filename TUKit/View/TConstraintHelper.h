//
//  TConstraintHelper.h
//  TUKit
//
//  Created by liu nian on 2020/3/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TConstraintHelper : NSObject

/**
 *  设置view的大小同父view大小
 *
 *  @param aSuperview 父view
 *  @param aView      需要设置的view
 */
+ (void)setView:(UIView *)aView fullAsSuperview:(UIView *)aSuperview;

/*  设置view的大小同父view大小
*
*  @param aSuperview 父view
*  @param aView      需要设置的view
*  @param aInsets    相对于父view的缩进
*/
+ (void)setView:(UIView *)aView fullAsSuperview:(UIView *)aSuperview andEdgeInsets:(UIEdgeInsets)aInsets;

/*  设置view的大小同父view大小
 *
 *  @param aSuperview 父view
 *  @param aView      需要设置的view
 *  @param aInsets    相对于父view的缩进
 *  @param propert    缩进的优先级
 */
+ (void)setView:(UIView *)aView fullAsSuperview:(UIView *)aSuperview andEdgeInsets:(UIEdgeInsets)aInsets propert:(CGFloat)property;

/*  设置view的大小同父view大小
 *
 *  @param aSuperview 父view
 *  @param aView      需要设置的view
 *  @param aInsets    相对于父view的缩进
 *  @param properts   各方向缩进的优先级
 */
+ (void)setView:(UIView *)aView fullAsSuperview:(UIView *)aSuperview andEdgeInsets:(UIEdgeInsets)aInsets propertys:(UIEdgeInsets)propertys;

+ (void)setViews:(NSArray *)aViews equalToSuperview:(UIView *)aSuperview isHorizontal:(BOOL)isHorizontal;

+ (void)testAmbiguity:(UIView *)aView;

@end

NS_ASSUME_NONNULL_END
