//
//  TFont.m
//  TUKit
//
//  Created by liu nian on 2020/3/28.
//

#import "TFont.h"

@implementation TFont
+ (UIFont *)otsNumberFontOfSize:(CGFloat)fontSize {
    return [self fontWithName:@"Futura" size:fontSize];
}

+ (UIFont *)small {
    CGFloat fontSize = 10;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        fontSize = 12;
    }
    return [UIFont systemFontOfSize:fontSize];
}

+ (UIFont *)medium {
    CGFloat fontSize = 12;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        fontSize = 14;
    }
    return [UIFont systemFontOfSize:fontSize];
}

+ (UIFont *)large {
    CGFloat fontSize = 14;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        fontSize = 16;
    }
    return [UIFont systemFontOfSize:fontSize];
}

+ (UIFont *)bigLarge {
    CGFloat fontSize = 18;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        fontSize = 20;
    }
    return [UIFont systemFontOfSize:fontSize];
}
@end
