//
//  TLoadingView.h
//  TUKit
//
//  Created by liu nian on 2020/3/29.
//

#import "TBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface TLoadingView : TBaseView
- (instancetype)initWithCustom:(CGSize)size :(Boolean)showLogo;
- (void)startAnimation:(NSInteger)round;
- (void)stopAnimation;
@end

@interface TNonModelLoadingView : TBaseView

+ (instancetype)showLoadingAddedTo:(UIView *)view animated:(BOOL)animated;

+ (void)hideLoadingForView:(UIView *)view animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
