//
//  UIView+TUKit.m
//  TUKit
//
//  Created by liu nian on 2020/3/29.
//

#import "UIView+TUKit.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "TLoadingView.h"

@implementation UIView (IB)

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius>0;
}

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}

- (void)setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)borderWidth {
    return self.layer.borderWidth;
}

@end

@implementation UIView (Loading)
#pragma mark - loading

- (void)showLoading {
    [self showLoadingWithMessage:nil];
}

- (void)showLoadingWithMessage:(NSString *)message
{
    [self showLoadingWithMessage:message hideAfter:0];
}

- (void)showLoadingWithMessage:(NSString *)message hideAfter:(NSTimeInterval)second
{
    [self showLoadingWithMessage:message onView:self hideAfter:second];
}

- (void)showLoadingWithMessage:(NSString *)message onView:(UIView *)aView hideAfter:(NSTimeInterval)second
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:aView animated:YES];
    
    if (message) {
		hud.label.text = message;
        hud.mode = MBProgressHUDModeText;
    }
    else {
        hud.mode = MBProgressHUDModeCustomView;
		hud.offset = CGPointMake(0, self.bounds.size.height * -0.1 + 20.75);
        
        hud.bezelView.color = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.9f];
        hud.customView = [[TLoadingView alloc]initWithCustom:CGSizeMake(41.5, 41.5) :YES];
        [(TLoadingView *)hud.customView startAnimation:20];
    }
    
    if (second > 0) {
		[hud hideAnimated:YES afterDelay:second];
    }
}

- (void)hideLoading
{
    [self hideLoadingOnView:self];
}

- (void)hideLoadingOnView:(UIView *)aView {
	[MBProgressHUD hideHUDForView:aView animated:YES];
}

- (void)showNonModelLoading
{
    [TNonModelLoadingView showLoadingAddedTo:self animated:YES];
}

- (void)hideNonModelLoading
{
    [TNonModelLoadingView hideLoadingForView:self animated:YES];
}

@end
