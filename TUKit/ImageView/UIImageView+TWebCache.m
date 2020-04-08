//
//  UIImageView+TWebCache.m
//  TUKit
//
//  Created by liu nian on 2020/4/8.
//

#import "UIImageView+TWebCache.h"
#import "UIImage+Addition.h"
#import "TColor.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <objc/runtime.h>

static char TAG_LOADING_GRADIENT;

@interface UIImageView (Private)
- (void)addLoading;
- (void)removeLoading;
@end

@implementation UIImageView (TWebCache)
@dynamic loadingGradientLayer;

- (CAGradientLayer *)loadingGradientLayer {
    return (CAGradientLayer *)objc_getAssociatedObject(self, &TAG_LOADING_GRADIENT);
}

- (void)setLoadingGradientLayer:(CAGradientLayer *)loadingGradientLayer {
    objc_setAssociatedObject(self, &TAG_LOADING_GRADIENT, loadingGradientLayer, OBJC_ASSOCIATION_RETAIN);
}

- (void)addLoading {
	if (!self.loadingGradientLayer) {
		CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];
		gradientLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
		gradientLayer.startPoint = CGPointMake(0, 0);
		gradientLayer.endPoint = CGPointMake(1, 1);
		gradientLayer.locations = @[@(0.0),@(0.1),@(0.2)];
		gradientLayer.colors = @[(__bridge id)[UIColor colorWithWhite:1 alpha:.5].CGColor,
								(__bridge id)[UIColor whiteColor].CGColor,
								(__bridge id)[UIColor colorWithWhite:1 alpha:.5].CGColor];
		self.loadingGradientLayer = gradientLayer;
		dispatch_async(dispatch_get_main_queue(), ^(void) {
			[self.layer addSublayer:self.loadingGradientLayer];
		});
	}
	
	CABasicAnimation *gradientAnimation = [CABasicAnimation animation];
	gradientAnimation.keyPath = @"locations";
	gradientAnimation.fromValue = @[@(0.0),@(0.1),@(0.2)];
	gradientAnimation.toValue = @[@(0.8),@(0.9),@(1.0)];
	gradientAnimation.duration = 1.5;
	gradientAnimation.repeatCount = 100;
	
	dispatch_async(dispatch_get_main_queue(), ^(void) {
		[self.loadingGradientLayer addAnimation:gradientAnimation forKey:nil];
	});
}

- (void)removeLoading {
	[self.layer removeAllAnimations];
	[self.loadingGradientLayer removeFromSuperlayer];
}

- (void)t_setImageWithURL:(NSURL *)url {
	UIImage *image = [UIImage imageWithColor:[TColor hex:@"FCFBFA"] imageSize:self.bounds.size];
	[self t_setImageWithURL:url placeholderImage:image];
}

- (void)t_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder {
	[self addLoading];
	__weak typeof(self) ws = self;
	[self sd_setImageWithURL:url placeholderImage:placeholder completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
		[ws removeLoading];
	}];
}
@end
