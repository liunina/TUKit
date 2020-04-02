//
//  TBaseTableViewHeaderFooterView.h
//  TUKit
//
//  Created by liu nian on 2020/3/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBaseTableViewHeaderFooterView : UITableViewHeaderFooterView
@property (nonatomic, weak) id delegate;
@property (nonatomic) UIEdgeInsets cellEdgeInsets;

+ (NSString *)cellReuseIdentifier;

- (void)updateWithCellData:(id _Nullable)aData;

+ (CGFloat)heightForCellData:(id _Nullable)aData;

@end

NS_ASSUME_NONNULL_END
