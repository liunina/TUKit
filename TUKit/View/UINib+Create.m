//
//  UINib+Create.m
//  TUKit
//
//  Created by liu nian on 2020/3/29.
//

#import "UINib+Create.h"

@implementation UINib (Create)

+ (instancetype)createWithNibName:(NSString *)aNibName {
    return [self createWithNibName:aNibName bundleName:nil];
}

+ (instancetype)createWithNibName:(NSString *)aNibName bundleName:(NSString *)aBundleName {
    NSBundle *bundle = [NSBundle mainBundle];
    if (aBundleName.length) {
        bundle = [NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:aBundleName withExtension:@"bundle"]];
    }
    return [UINib nibWithNibName:aNibName bundle:bundle];
}

@end
