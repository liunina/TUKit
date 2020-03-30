//
//  TAlertButton.h
//  TUIKit
//
//  Created by liu nian on 2020/3/25.
//  Copyright © 2020 Challenge Everything. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TAlertAction.h"

NS_ASSUME_NONNULL_BEGIN
typedef void (^AlertButtonBlock)(void);
@interface TAlertButton : UIView
@property (nonatomic, copy) AlertButtonBlock buttonBlock;
- (instancetype)initWithAlertAction:(TAlertAction *)action;
@end

NS_ASSUME_NONNULL_END
