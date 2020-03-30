//
//  TAlertActionItem.h
//  TUIKit
//
//  Created by liu nian on 2020/3/25.
//  Copyright © 2020 Challenge Everything. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class TAlertAction;
typedef void(^TAlertActionBlock)(TAlertAction *action);

typedef NS_ENUM(NSInteger, TAlertActionStyle) {
    TAlertActionStyleDefault = 0,
    TAlertActionStyleCancel,
	TAlertActionStyleDestructive
};

@interface TAlertAction : NSObject
@property (nullable, nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) TAlertActionStyle style;
@property (nonatomic, copy, readonly)TAlertActionBlock actionBlock;
@property (nonatomic, getter=isEnabled) BOOL enabled;

+ (instancetype)actionWithTitle:(nullable NSString *)title
						  style:(TAlertActionStyle)style
						handler:(void (^ __nullable)(TAlertAction *action))handler;
@end

NS_ASSUME_NONNULL_END
