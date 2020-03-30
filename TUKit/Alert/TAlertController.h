//
//  TAlertViewController.h
//  TUIKit
//
//  Created by liu nian on 2020/3/25.
//  Copyright © 2020 Challenge Everything. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TAlertAction.h"

NS_ASSUME_NONNULL_BEGIN

@interface TAlertController : UIViewController
@property (nonatomic, strong, nullable) NSString *text;
@property (nonatomic, strong, nullable) UIFont *textFont;
@property (nonatomic, strong, nullable) UIColor *textColor;

@property (nonatomic, strong, nullable) NSString *detailText;
@property (nonatomic, strong, nullable) UIFont *detailTextFont;
@property (nonatomic, strong, nullable) UIColor *detailTextColor;

+ (instancetype)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message;
- (void)addAction:(TAlertAction *)action;
@end

NS_ASSUME_NONNULL_END
