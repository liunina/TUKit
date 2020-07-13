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
+ (instancetype)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message;

+ (instancetype)alertControllerWithAttributedTitle:(nullable NSAttributedString *)attributedTitle attributedMessage:(nullable NSAttributedString *)attributedMessage;

- (void)addAction:(TAlertAction *)action;
@end

NS_ASSUME_NONNULL_END
