//
//  TBaseTabBarView.m
//  TUKit
//
//  Created by liu nian on 2020/3/29.
//

#import "TBaseTabBarView.h"
#import "TBaseView+Create.h"
#import "TConstraintHelper.h"
#import "TBaseTabBarItem.h"

@interface TBaseTabBarView () <TBaseTabBarItemDelegate>

@property (nonatomic, copy) NSArray *items;
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UIImageView *backgroundImageView;

@end

@implementation TBaseTabBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews
{
    self.backgroundView = [UIImageView viewWithFrame:CGRectZero];
    [self addSubview:self.backgroundView];
    [TConstraintHelper setView:self.backgroundView fullAsSuperview:self];
    
    self.backgroundImageView = [UIImageView viewWithFrame:CGRectZero];
    [self.backgroundView addSubview:self.backgroundImageView];
    [TConstraintHelper setView:self.backgroundImageView fullAsSuperview:self.backgroundView];
}

- (void)__resizeItems
{
    for (TBaseTabBarItem *item in _items) {
        item.tag = [_items indexOfObject:item];
        [self addSubview:item];
        item.delegate = self;
        
        item.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:item attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.f constant:0.f]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:item attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.f constant:0.f]];
    }
    
    [TConstraintHelper setViews:self.items equalToSuperview:self isHorizontal:YES];
}

- (void)setBackgroundImage:(UIImage *)backgroundImage
{
    self.backgroundImageView.image = backgroundImage;
}

- (void)setItems:(NSArray *)items
{
    for (id object in items) {
        if (![object isKindOfClass:[TBaseTabBarItem class]]) {
//            OTSLogE(@"%@ is not kind of OTSTabBarItem",object);
            return ;
        }
    }
    
    [_items makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    _items = [items copy];
    
    self.selectedItem = _items[0];
    
    [self __resizeItems];
}

- (void)setSelectedItem:(TBaseTabBarItem *)selectedItem
{
    if (_selectedItem == selectedItem) {
        _selectedItem.selected = YES;
        return ;
    }
    
    _selectedItem.selected = NO;
    _selectedItem = selectedItem;
    _selectedItem.selected = YES;
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [self.delegate customTabBar:self didSelectItem:_items[selectedIndex]];
}

- (NSUInteger)selectedIndex
{
    return self.selectedItem.tag;
}

#pragma mark - TBaseTabBarItemDelegate delegate
- (void)tabBarItemDidSelectItem:(TBaseTabBarItem *)item {
    [self.delegate customTabBar:self didSelectItem:item];
}

@end
