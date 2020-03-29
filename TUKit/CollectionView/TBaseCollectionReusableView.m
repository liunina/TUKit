//
//  TBaseCollectionReusableView.m
//  TUKit
//
//  Created by liu nian on 2020/3/28.
//

#import "TBaseCollectionReusableView.h"

@implementation TBaseCollectionReusableView
- (void)dealloc {
}

+ (NSString *)cellReuseIdentifier {
    return NSStringFromClass([self class]);
}

+ (UINib *)nib{
    NSString *className = NSStringFromClass([self class]);
    return [UINib nibWithNibName:className bundle:nil];
}

- (void)updateWithCellData:(id)aData {
    
}

+ (CGSize)sizeForCellData:(id)aData {
    return CGSizeZero;
}

@end
