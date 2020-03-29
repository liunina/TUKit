//
//  TBaseCollectionReusableView.h
//  TUKit
//
//  Created by liu nian on 2020/3/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBaseCollectionReusableView : UICollectionReusableView

/**
 *  index
 */
@property (nonatomic, strong) NSIndexPath *indexPath;

/**
 *  代理
 */
@property (nonatomic, weak) id delegate;

/**
 *  功能:获取cell的唯一标识符
 */
+ (NSString *)cellReuseIdentifier;
/**
 *  功能:返回该类的Nib文件
 */
+ (UINib *)nib;

/// 功能:cell根据数据显示ui
/// @param aData cell数据
- (void)updateWithCellData:(id)aData;

/// 功能:获取cell的大小
/// @param aData cell的数据
+ (CGSize)sizeForCellData:(id)aData;
@end

NS_ASSUME_NONNULL_END
