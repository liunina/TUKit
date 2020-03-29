//
//  UINib+Create.h
//  TUKit
//
//  Created by liu nian on 2020/3/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINib (Create)
+ (instancetype)createWithNibName:(NSString *)aNibName;

+ (instancetype)createWithNibName:(NSString *)aNibName bundleName:(NSString * _Nullable)aBundleName;
@end

NS_ASSUME_NONNULL_END
