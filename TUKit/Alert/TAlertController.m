//
//  TAlertViewController.m
//  TUIKit
//
//  Created by liu nian on 2020/3/25.
//  Copyright © 2020 Challenge Everything. All rights reserved.
//

#import "TAlertController.h"
#import <Masonry/Masonry.h>
#import "TAlertButton.h"
#import "TColor.h"

@interface TAlertController () {
	UIFont *_theTextFont;
	UIColor *_theTextColor;
	UIFont *_theDetailTextFont;
	UIColor *_theDetailTextColor;
}
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong, readwrite) UILabel *textLabel;
@property (nonatomic, strong, readwrite) UILabel *detailLabel;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) NSMutableArray <TAlertAction *> *actions;
@end

@implementation TAlertController
@synthesize textFont = _theTextFont;
@synthesize textColor = _theTextColor;
@synthesize detailTextFont = _theDetailTextFont;
@synthesize detailTextColor = _theDetailTextColor;

+ (instancetype)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message {
	TAlertController *alertVC = [[TAlertController alloc] initWithTitle:title message:message];
	return alertVC;
}

- (instancetype)init {
	self = [super init];
	if (self) {
		self.modalPresentationStyle = UIModalPresentationOverFullScreen;
		self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
	}
	return self;
}

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message {
	self = [self init];
	if (self) {
		self.text = title;
		self.detailText = message;
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	self.textLabel.text = self.text;
	if (self.detailText) {
		self.detailLabel.text = self.detailText;
	}
	__weak typeof(self) ws = self;
	if (self.actions.count >1) {
		
		[self.lineView mas_updateConstraints:^(MASConstraintMaker *make) {
			make.width.mas_equalTo(1);
		}];
		
		NSMutableArray *buttons = @[].mutableCopy;
		/// TODO: 目前只取前两个
		for (NSInteger i = 0; i < 2; i++) {
			TAlertAction *obj = self.actions[i];
			TAlertButton *button = [[TAlertButton alloc] initWithAlertAction:obj];
			button.backgroundColor = [UIColor clearColor];
			button.buttonBlock = ^{
				[ws dismissViewControllerAnimated:YES completion:^{
					obj.actionBlock(obj);
				}];
			};
			[self.bottomView addSubview:button];
			[buttons addObject:button];
		}

		[buttons mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:2 leadSpacing:2 tailSpacing:2];
		
		[buttons mas_makeConstraints:^(MASConstraintMaker *make) {
			make.top.equalTo(@1);
			make.bottom.equalTo(@0);
		}];

	}else if(self.actions.count == 1) {
		[self.lineView mas_updateConstraints:^(MASConstraintMaker *make) {
			make.width.mas_equalTo(0);
		}];
		TAlertAction *obj = self.actions.firstObject;
		TAlertButton *button = [[TAlertButton alloc] initWithAlertAction:obj];
		button.backgroundColor = [UIColor clearColor];
		button.buttonBlock = ^{
			[ws dismissViewControllerAnimated:YES completion:^{
				obj.actionBlock(obj);
			}];
		};
		
		[self.bottomView addSubview:button];
		[button mas_makeConstraints:^(MASConstraintMaker *make) {
			make.edges.mas_equalTo(UIEdgeInsetsMake(1, 0, 0, 0));
		}];
	}else {
		self.bottomView.hidden = YES;
	}
}

- (void)addAction:(TAlertAction *)action {
	if (!action) {
		return;
	}
	[self.actions addObject:action];
}

#pragma mark - setter
- (void)setText:(NSString *)text {
	_text = text;
}

- (void)setTextFont:(UIFont *)textFont {
	_theTextFont = textFont;
}

- (void)setTextColor:(UIColor *)textColor {
	_theTextColor = textColor;
}

- (void)setDetailText:(NSString *)detailText {
	_detailText = detailText;
}

- (void)setDetailTextFont:(UIFont *)detailTextFont {
	_theDetailTextFont = detailTextFont;
}

- (void)setDetailTextColor:(UIColor *)detailTextColor {
	_theDetailTextColor = detailTextColor;
}

#pragma mark - getter
- (UIView *)contentView {
	if (!_contentView) {
		UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 275, 150)];
		view.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.8];
		view.layer.cornerRadius = 10;
		view.clipsToBounds = YES;
		[self.view addSubview:view];
		[view mas_makeConstraints:^(MASConstraintMaker *make) {
			make.width.mas_equalTo(@275);
			make.centerX.equalTo(self.view.mas_centerX);
			make.centerY.equalTo(self.view.mas_centerY);
//			make.height.greaterThanOrEqualTo(@130);
		}];
		
		// blur
		UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
		UIVisualEffectView *visualView = [[UIVisualEffectView alloc]initWithEffect:blurEffect];
		//		visualView.frame = view.frame;
		[view addSubview:visualView];
		[visualView mas_makeConstraints:^(MASConstraintMaker *make) {
			make.edges.mas_equalTo(UIEdgeInsetsZero);
		}];
		
		_contentView = view;
	}
	return _contentView;
}

- (UIView *)bottomView {
	if (!_bottomView) {
		UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
		[self.contentView addSubview:view];
		
		UIView *lineView = [UIView new];
		lineView.backgroundColor = [TColor colorWithRGB:0xBAB2B2];
		[view addSubview:lineView];
		[lineView mas_makeConstraints:^(MASConstraintMaker *make) {
			make.top.equalTo(view.mas_top).offset(0);
			make.left.equalTo(view.mas_left).offset(0);
			make.right.equalTo(view.mas_right).offset(0);
			make.height.mas_equalTo(.5);
		}];
		
		[view mas_makeConstraints:^(MASConstraintMaker *make) {
			make.top.equalTo(self.detailLabel.mas_bottom).offset(10);
			make.left.equalTo(self.contentView.mas_left).offset(0);
			make.right.equalTo(self.contentView.mas_right).offset(0);
			make.height.mas_equalTo(51);
			make.bottom.equalTo(self.contentView.mas_bottom);
		}];
		_bottomView = view;
	}
	return _bottomView;
}

- (UIView *)lineView {
	if (!_lineView) {
		UIView *view = [UIView new];
		view.backgroundColor = [TColor colorWithRGB:0xBAB2B2];
		[self.bottomView addSubview:view];
		[view mas_makeConstraints:^(MASConstraintMaker *make) {
			make.top.equalTo(view.mas_top).offset(1);
			make.bottom.equalTo(view.mas_bottom).offset(0);
			make.centerX.equalTo(view.mas_centerX).offset(0);
			make.width.mas_equalTo(0.5);
		}];
		_lineView = view;
	}
	return _lineView;
}

- (UILabel *)textLabel {
	if (!_textLabel) {
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
		label.backgroundColor = [UIColor clearColor];
		label.textColor = self.textColor;
		label.font = self.textFont;
		label.textAlignment = NSTextAlignmentCenter;
		label.numberOfLines = 0;
		label.text = @"";
		[self.contentView addSubview:label];
		[label mas_makeConstraints:^(MASConstraintMaker *make) {
			make.top.equalTo(self.contentView.mas_top).offset(20);
			make.left.equalTo(self.contentView.mas_left).offset(20);
			make.right.equalTo(self.contentView.mas_right).offset(-20);
			make.height.mas_greaterThanOrEqualTo(16);
		}];
		_textLabel = label;
	}
	return _textLabel;
}

- (UILabel *)detailLabel {
	if (!_detailLabel) {
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
		label.backgroundColor = [UIColor clearColor];
		label.textColor = self.detailTextColor;
		label.font = self.detailTextFont;
		label.textAlignment = NSTextAlignmentCenter;
		label.numberOfLines = 0;
		label.text = @"";
		[self.contentView addSubview:label];
		[label mas_makeConstraints:^(MASConstraintMaker *make) {
			make.top.equalTo(self.textLabel.mas_bottom).offset(12);
			make.left.equalTo(self.textLabel.mas_left).offset(0);
			make.right.equalTo(self.textLabel.mas_right).offset(0);
			make.height.mas_greaterThanOrEqualTo(0);
		}];
		_detailLabel = label;
	}
	return _detailLabel;
}

- (NSMutableArray *)actions {
	if (!_actions) {
		NSMutableArray *array = @[].mutableCopy;
		_actions = array;
	}
	return _actions;
}

- (UIFont *)textFont {
	if (!_theTextFont) {
		_theTextFont = [UIFont fontWithName:@"PingFangSC-Medium" size:16];
	}
	return _theTextFont;
}

- (UIFont *)detailTextFont {
	if (!_theDetailTextFont) {
		_theDetailTextFont = [UIFont fontWithName:@"PingFangSC-Medium" size:14];;
	}
	return _theDetailTextFont;
}

- (UIColor *)textColor {
	if (!_theTextColor) {
		_theTextColor = [TColor colorWithRGB:0x867B7B];
	}
	return _theTextColor;
}

- (UIColor *)detailTextColor {
	if (!_theDetailTextColor) {
		_theDetailTextColor = [TColor colorWithRGB:0x210201];
	}
	return _theDetailTextColor;
}
@end
