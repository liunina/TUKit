//
//  TBaseTableViewCell.h
//  TUKit
//
//  Created by liu nian on 2020/3/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBaseTableViewCell : UITableViewCell
@property (nonatomic, strong, nullable) NSIndexPath *indexPath;
@property (nonatomic, weak) id delegate;
@property (nonatomic) UIEdgeInsets cellEdgeInsets;

/**
 *  功能:获取cell的唯一标识符
 */
+ (NSString *)cellReuseIdentifier;

/// 功能:cell根据数据显示ui
/// @param aData cell数据
- (void)updateWithCellData:(id)aData;

/// 功能:获取cell的高度。如果要根据数据获取cell的高度，必须等数据填充完毕后,再调用此方法才有用
- (CGFloat)getCellHeight;

/// 功能:cell根据数据和位置显示ui
/// @param aData cell数据
/// @param indexPath cell位置
- (void)updateWithCellData:(id)aData atIndexPath:(NSIndexPath *)indexPath;

+ (CGFloat)heightForCellData:(id)aData;

+ (CGFloat)heightForCellData:(id)aData atIndexPath:(NSIndexPath *)indexPath;

+ (UINib *)nib;

@end

NS_ASSUME_NONNULL_END
