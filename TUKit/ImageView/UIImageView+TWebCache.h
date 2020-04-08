//
//  UIImageView+TWebCache.h
//  TUKit
//
//  Created by liu nian on 2020/4/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (TWebCache)
@property (nonatomic, strong) CAGradientLayer *loadingGradientLayer;

- (void)t_setImageWithURL:(NSURL *)url;
- (void)t_setImageWithURL:(NSURL *)url placeholderImage:(UIImage * _Nullable)placeholder;
@end

NS_ASSUME_NONNULL_END
