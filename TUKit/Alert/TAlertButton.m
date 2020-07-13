//
//  TAlertButton.m
//  TUIKit
//
//  Created by liu nian on 2020/3/25.
//  Copyright © 2020 Challenge Everything. All rights reserved.
//

#import "TAlertButton.h"
#import <Masonry/Masonry.h>
#import "TColor.h"

@interface TAlertButton ()
@property (nonatomic, strong) TAlertAction *alertAction;
@property (nonatomic, strong) UIButton *actionButton;
@end
@implementation TAlertButton

- (instancetype)initWithAlertAction:(TAlertAction *)action {
	self = [self initWithFrame:CGRectZero];
	if (self) {
		self.alertAction = action;
		[self.actionButton setTitle:action.title forState:UIControlStateNormal];
		UIColor *titleColor = [TColor colorWithRGB:0x210201];;
		switch (action.style) {
			case TAlertActionStyleDefault: {
				titleColor = [TColor colorWithRGB:0x210201];
			}
				break;
			case TAlertActionStyleCancel: {
				titleColor =  [TColor colorWithRGB:0x210201];
			}
				break;
			case TAlertActionStyleDestructive: {
				titleColor = [TColor colorWithRGB:0xE54538];
			}
				break;
			default:
				break;
		}
		
		[self.actionButton setTitleColor:titleColor forState:UIControlStateNormal];
	}
	return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		
	}
	return self;
}

- (void)buttonClick:(id)sender {
	if (self.buttonBlock) {
		self.buttonBlock();
	}
}

#pragma mark - getter
- (UIButton *)actionButton {
	if (!_actionButton) {
		UIButton *button = [[UIButton alloc] initWithFrame:self.bounds];
		button.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
		[button setBackgroundColor:[UIColor clearColor]];
		[button setTitleColor:[TColor colorWithRGB:0xE54538] forState:UIControlStateNormal];
		
		[button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:button];
		[button mas_makeConstraints:^(MASConstraintMaker *make) {
			make.edges.mas_equalTo(UIEdgeInsetsZero);
		}];
		_actionButton = button;
	}
	return _actionButton;
}
@end
