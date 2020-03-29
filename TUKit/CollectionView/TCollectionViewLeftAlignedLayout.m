//
//  TCollectionViewLeftAlignedLayout.m
//  TUKit
//
//  Created by liu nian on 2020/3/28.
//

#import "TCollectionViewLeftAlignedLayout.h"

@interface UICollectionViewLayoutAttributes(LeftAlignedLayout)

@end

@implementation  UICollectionViewLayoutAttributes(LeftAlignedLayout)

/// 更新UICollectionViewLayoutAttributes的frame让其左对齐
/// @param insets insets
- (void )updateLeftAlignLayoutAttributesWithSectionInsent:(UIEdgeInsets )insets {
    CGRect updateFrame = self.frame;
    updateFrame.origin.x = insets.left;
    self.frame = updateFrame;
}

@end

@implementation TCollectionViewLeftAlignedLayout

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *originLayoutAttributes =  [super layoutAttributesForElementsInRect:rect].copy;
    NSMutableArray *updateLayoutAttributes = [NSMutableArray arrayWithArray:originLayoutAttributes];
    for (UICollectionViewLayoutAttributes *layoutAttributes in originLayoutAttributes) {
        if (layoutAttributes.representedElementKind.length > 0 ) {
            continue;
        }
        
        NSInteger updateIndex = [updateLayoutAttributes indexOfObject:layoutAttributes];
        //使用新的layout
        updateLayoutAttributes[updateIndex] = [self layoutAttributesForItemAtIndexPath:layoutAttributes.indexPath];
    }
    return updateLayoutAttributes;
}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *currentLayoutAttributes = [super layoutAttributesForItemAtIndexPath:indexPath];
    BOOL isFirstItemInSection = indexPath.item == 0;
    
    UIEdgeInsets sectionInset = [self evaluatedSectionEdgeInsetsForItemAtIndexPath:indexPath];
    if (isFirstItemInSection) {
        [currentLayoutAttributes updateLeftAlignLayoutAttributesWithSectionInsent:sectionInset];
        return currentLayoutAttributes;
    }
    
    NSIndexPath *lastIndexPath = [NSIndexPath indexPathForItem:indexPath.item - 1 inSection:indexPath.section];
    UICollectionViewLayoutAttributes *lastLayoutAttributes = [self layoutAttributesForItemAtIndexPath:lastIndexPath];
    CGRect lastAttributesFrame = lastLayoutAttributes.frame;
    
    UIEdgeInsets currentItemSectionInsets = [self evaluatedSectionEdgeInsetsForItemAtIndexPath:indexPath];
    CGFloat fullRowWidth = self.collectionView.frame.size.width - (currentItemSectionInsets.left + currentItemSectionInsets.right);
    CGRect fullRowRect = CGRectMake(currentItemSectionInsets.left,
                                    currentLayoutAttributes.frame.origin.y,
                                    fullRowWidth,
                                    currentLayoutAttributes.frame.size.height);
    
    /**
     * 上一个item，和当前items覆盖的整个区域没有交集,那么当前item就是当前row的第一个item
     */
    BOOL isFirstItemInRow = !adjustRectIntersectsRect(lastAttributesFrame, fullRowRect);
    if (isFirstItemInRow) {
        [currentLayoutAttributes updateLeftAlignLayoutAttributesWithSectionInsent:sectionInset];
        return currentLayoutAttributes;
    }
    
    CGRect currentItemRect = currentLayoutAttributes.frame;
    currentItemRect.origin.x = (lastAttributesFrame.origin.x + lastAttributesFrame.size.width) + [self evaluatedMinimumLineSpacingForItemAtIndexPath:indexPath];
    currentLayoutAttributes.frame = currentItemRect;
    return currentLayoutAttributes;
}

- (UIEdgeInsets )evaluatedSectionEdgeInsetsForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIEdgeInsets evaluatedSectionEdgeInsets = self.sectionInset;
    if ([self.collectionView.delegate respondsToSelector:@selector(collectionView:layout:insetForSectionAtIndex:)]) {
        id<UICollectionViewDelegateFlowLayout>delegate = (id<UICollectionViewDelegateFlowLayout>)self.collectionView.delegate;
        evaluatedSectionEdgeInsets = [delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:indexPath.section];
    }
    return evaluatedSectionEdgeInsets;
}

- (CGFloat)evaluatedMinimumLineSpacingForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat evaluatedMinimumLineSpacing = self.minimumInteritemSpacing;
    if ([self.collectionView.delegate respondsToSelector:@selector(collectionView:layout:minimumInteritemSpacingForSectionAtIndex:)]) {
       id<UICollectionViewDelegateFlowLayout>delegate = (id<UICollectionViewDelegateFlowLayout>)self.collectionView.delegate;
        evaluatedMinimumLineSpacing = [delegate collectionView:self.collectionView layout:self minimumInteritemSpacingForSectionAtIndex:indexPath.section];
    }
    return evaluatedMinimumLineSpacing;
}

#pragma mark- privateMethod

#define EPSINON 0.00001

static inline bool  adjustRectIntersectsRect(CGRect rect1, CGRect rect2)
{
    float widthA = rect1.size.width;
    float heightA = rect1.size.height;
    
    float widthB = rect2.size.width;
    float heightB = rect2.size.height;
    
    float centerAX = rect1.origin.x + widthA / 2.0f;
    float centerAY = rect1.origin.y + heightA / 2.0f;
    
    float centerBX = rect2.origin.x + widthB / 2.0f;
    float centerBY = rect2.origin.y + heightB / 2.0f;
    /**
     *  比较两个矩形是否相交的逻辑
     *  1） | Xb3-Xa3 | < Wa/2 + Wb/2
        2） | Yb3-Ya3 | < Ha/2 + Hb/2
     */
    
    CGFloat centerGapX = fabsf(centerBX - centerAX);
    CGFloat widthGap = ((widthB + widthA) / 2.0f);
    
   
    CGFloat centerGapY = fabsf(centerAY - centerBY);
    CGFloat heightGap = ((heightB + heightA) / 2.0f);
    
    /**
     *  浮点数比较大小
     */
    if ((centerGapX - widthGap) < -EPSINON
        &&(centerGapY - heightGap) < - EPSINON) {
        return  YES;
    }
    
    return NO;
}
@end
