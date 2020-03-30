//
//  TAlertActionItem.m
//  TUIKit
//
//  Created by liu nian on 2020/3/25.
//  Copyright © 2020 Challenge Everything. All rights reserved.
//

#import "TAlertAction.h"

@interface TAlertAction ()
@property (nullable, nonatomic, readwrite) NSString *title;
@property (nonatomic, readwrite) TAlertActionStyle style;
@property (nonatomic, copy, readwrite)TAlertActionBlock actionBlock;
@end
@implementation TAlertAction
+ (instancetype)actionWithTitle:(nullable NSString *)title
						  style:(TAlertActionStyle)style
						handler:(void (^ __nullable)(TAlertAction *action))handler {
	
	TAlertAction *action = [TAlertAction new];
	action.title = title;
	action.style = style;
	action.actionBlock = handler;
	return action;
}
@end
