//
//  TBaseCollectionView.m
//  TUKit
//
//  Created by liu nian on 2020/3/28.
//

#import "TBaseCollectionView.h"
#import "TBaseCollectionViewCell.h"
#import "TBaseCollectionReusableView.h"

@implementation TBaseCollectionView

- (void)dealloc {
//    [self unobserveAllNotifications];
}

- (id)dequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [super dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    if ([cell isKindOfClass:[TBaseCollectionViewCell class]]) {
        [(TBaseCollectionViewCell *)cell setIndexPath:indexPath];
    }
    
    return cell;
}

- (id)dequeueReusableSupplementaryViewOfKind:(NSString *)elementKind withReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [super dequeueReusableSupplementaryViewOfKind:elementKind withReuseIdentifier:identifier forIndexPath:indexPath];
    
    if ([cell isKindOfClass:[TBaseCollectionReusableView class]]) {
        [(TBaseCollectionReusableView *)cell setIndexPath:indexPath];
    }
    
    return cell;
}

- (void)setDelegate:(id<UICollectionViewDelegate>)delegate {
    [super setDelegate:delegate];
    if (delegate == nil) {
        return;
    }
//
//    OTSWeakObjectDeathNotifier *wo = [OTSWeakObjectDeathNotifier new];
//    [wo setOwner:delegate];
//    WEAK_SELF;
//    [wo setBlock:^(OTSWeakObjectDeathNotifier *sender) {
//        STRONG_SELF;
//        self.delegate = nil;
//        self.dataSource = nil;
//    }];
}

- (void)reloadData {
    [self.collectionViewLayout invalidateLayout];
    [super reloadData];
}

@end
