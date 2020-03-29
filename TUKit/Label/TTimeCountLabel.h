//
//  TTimeCountLabel.h
//  TUKit
//
//  Created by liu nian on 2020/3/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TTimeCountLabelDelegate <NSObject>
@required
- (void)timeDrained;
@end

@interface TTimeCountLabel : UILabel

@property(nonatomic, weak) id<TTimeCountLabelDelegate> delegate;
@property(nonatomic, strong)NSString *timeFormat;
/**
 *  功能：设置倒计时时间，time单位为毫秒
 */
- (void)setCountDownTime:(SInt64)time;

/**
 *  功能：设置倒计时的时间，time单位是秒
 */
- (void)setCountDownSecTime:(SInt64)time;
@end

NS_ASSUME_NONNULL_END
