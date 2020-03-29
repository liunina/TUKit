//
//  TBorder.m
//  TUKit
//
//  Created by liu nian on 2020/3/29.
//

#import "TBorder.h"
#import "TBaseView+Create.h"

@implementation TBorder

+ (void)addBorderWithView:(UIView *)aView type:(TBorderType)aType andColor:(UIColor *)aColor
{
    [self addBorderWithView:aView type:aType andColor:aColor andEdgeInset:UIEdgeInsetsZero];
}

+ (void)addBorderWithView:(UIView *)aView type:(TBorderType)aType andColor:(UIColor *)aColor andEdgeInset:(UIEdgeInsets)aEdgeInset
{
    UIView *copyView = [UIView autolayoutView];
    copyView.backgroundColor = aColor;
    
    NSDictionary *insets = @{@"left": @(aEdgeInset.left), @"right": @(aEdgeInset.right), @"top": @(aEdgeInset.top), @"bottom": @(aEdgeInset.bottom)};
    
    CGFloat defaultBorderWidth = 1 / [UIScreen mainScreen].scale;
    
    if (aType & TBorderTypeTop) {
        UIView *borderView = [UIView duplicate:copyView];
        borderView.tag = TBorderViewTypeTop;
        [aView addSubview:borderView];
        
        [aView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(left)-[borderView]-(right)-|" options:0 metrics:insets views:NSDictionaryOfVariableBindings(borderView)]];
        [aView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(top)-[borderView]" options:0 metrics:insets views:NSDictionaryOfVariableBindings(borderView)]];
        [aView addConstraint:[NSLayoutConstraint constraintWithItem:borderView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:defaultBorderWidth + aEdgeInset.bottom]];
    }
    
    if (aType & TBorderTypeLeft) {
        UIView *borderView = [UIView duplicate:copyView];
        borderView.tag = TBorderViewTypeLeft;
        [aView addSubview:borderView];
        
        [aView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(top)-[borderView]-(bottom)-|" options:0 metrics:insets views:NSDictionaryOfVariableBindings(borderView)]];
        [aView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(left)-[borderView]" options:0 metrics:insets views:NSDictionaryOfVariableBindings(borderView)]];
        [aView addConstraint:[NSLayoutConstraint constraintWithItem:borderView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:defaultBorderWidth + aEdgeInset.right]];
    }
    
    if (aType & TBorderTypeBottom) {
        UIView *borderView = [UIView duplicate:copyView];
        borderView.tag = TBorderViewTypeBottom;
        [aView addSubview:borderView];
        
        [aView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(left)-[borderView]-(right)-|" options:0 metrics:insets views:NSDictionaryOfVariableBindings(borderView)]];
        [aView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[borderView]-(bottom)-|" options:0 metrics:insets views:NSDictionaryOfVariableBindings(borderView)]];
        [aView addConstraint:[NSLayoutConstraint constraintWithItem:borderView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:defaultBorderWidth + aEdgeInset.bottom]];
    }
    
    if (aType & TBorderTypeRight) {
        UIView *borderView = [UIView duplicate:copyView];
        borderView.tag = TBorderViewTypeRight;
        [aView addSubview:borderView];
        
        [aView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(top)-[borderView]-(bottom)-|" options:0 metrics:insets views:NSDictionaryOfVariableBindings(borderView)]];
        [aView addConstraint:[NSLayoutConstraint constraintWithItem:borderView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:aView attribute:NSLayoutAttributeRight multiplier:1.f constant:0.f]];
        [aView addConstraint:[NSLayoutConstraint constraintWithItem:borderView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:defaultBorderWidth + aEdgeInset.right]];
    }
}

+ (void)removeBorderWithView:(UIView *)aView type:(TBorderType)aType
{
    if (aType & TBorderTypeTop) {
        UIView *borderView = [aView viewWithTag:TBorderViewTypeTop];
        [borderView removeFromSuperview];
    }
    
    if (aType & TBorderTypeLeft) {
        UIView *borderView = [aView viewWithTag:TBorderViewTypeLeft];
        [borderView removeFromSuperview];
    }
    
    if (aType & TBorderTypeBottom) {
        UIView *borderView = [aView viewWithTag:TBorderViewTypeBottom];
        [borderView removeFromSuperview];
    }
    
    if (aType & TBorderTypeRight) {
        UIView *borderView = [aView viewWithTag:TBorderViewTypeRight];
        [borderView removeFromSuperview];
    }
}

@end
