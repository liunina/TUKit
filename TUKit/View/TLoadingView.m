//
//  TLoadingView.m
//  TUKit
//
//  Created by liu nian on 2020/3/29.
//

#import "TLoadingView.h"

static CGFloat const logoH = 16;
static CGFloat const logoW = 16;

@interface LoadingLayer : CALayer
@property (nonatomic) CGFloat progress;///<进度
@property (nonatomic) UIColor *color;///<颜色
@property (nonatomic) CGFloat lineWidth;///<线宽
@end
@implementation LoadingLayer

@dynamic progress;
@dynamic color;
@dynamic lineWidth;

//属性变化触发重绘,当progress的值改变的时候,CALayer会标记自己为需要重绘
//Subclasses can override this method and return YES
//if the layer should be redisplayed when the value of the specified attribute changes. Animations changing the value of the attribute also trigger redisplay.
+ (BOOL)needsDisplayForKey:(NSString *)key
{
    if ([key isEqualToString:@"progress"])
    {
        return YES;
    }
    else if ([key isEqualToString:@"color"])
    {
        return YES;
    }
    else if ([key isEqualToString:@"lineWidth"])
    {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

- (void)drawInContext:(CGContextRef)ctx
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGFloat radius = MIN(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)) / 2 - self.lineWidth / 2;
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    //O
    CGFloat originEnd = M_PI * 2;
    CGFloat currentOrigin = originEnd * self.progress;

    
    CGFloat currentDest = currentOrigin - self.progress *6 ;
    if(self.progress >= 0.75){
        currentDest = currentOrigin - ( 1-self.progress) * 6 * 0.75 / (1 - 0.75);
    }
    
    //弧的圆心arcCenter，弧的半径arcRadius，开始角度（我们前文中用O点代表），结束角度（用D点代表）
    [path addArcWithCenter:center radius:radius startAngle:currentOrigin endAngle:currentDest clockwise:NO];
    CGContextAddPath(ctx, path.CGPath);
    CGContextSetLineWidth(ctx, self.lineWidth);
    CGContextSetStrokeColorWithColor(ctx, self.color.CGColor);
    CGContextStrokePath(ctx);
}

@end

@interface TLoadingView ()<CAAnimationDelegate>
@property (nonatomic,strong)UIImageView *loadImg;
@property (nonatomic,strong)LoadingLayer *bgLayer;
@property (nonatomic, assign) NSInteger num;
@property (nonatomic) CGFloat contentViewH;
@property (nonatomic) CGFloat contentViewW;
@end

@implementation TLoadingView

-(UIImageView*)loadImg{
    if (!_loadImg) {
        _loadImg = [UIImageView new];
        _loadImg.contentMode = UIViewContentModeScaleAspectFit;
        _loadImg.image = [UIImage imageNamed:@"loading_slices"];
        _loadImg.contentMode = UIViewContentModeCenter;
    }
    return _loadImg;
}

-(CALayer*)bgLayer{
    if (!_bgLayer) {
        _bgLayer = [LoadingLayer layer];
        _bgLayer.contentsScale = [UIScreen mainScreen].scale;
        _bgLayer.color = [UIColor colorWithRed:204/255.0 green:34/255.0 blue:37/255.0 alpha:1.0];;
        _bgLayer.lineWidth = 3;
    }
    return _bgLayer;
}

- (CGSize)intrinsicContentSize {
    return CGSizeMake(_contentViewW, _contentViewH);
}

-(instancetype)initWithCustom:(CGSize)size :(Boolean)showLogo{
    self = [super init];
    if (self) {
        _contentViewW = size.width;
        _contentViewH = size.height;
        if(showLogo){
            self.loadImg.frame = CGRectMake((_contentViewW-logoW)/2+1, (_contentViewH-logoH)/2+1, logoW, logoH);
            [self addSubview:self.loadImg];
        }
        [self.layer addSublayer:self.bgLayer];
        self.bgLayer.frame = CGRectMake(0, 0, _contentViewW, _contentViewH);
        // animation
        self.bgLayer.progress = 1; // end status
    }
    return self;
}

//第一阶段
- (void)doStep1 {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"progress"];
    animation.duration = 0.3;
    animation.fromValue = @0.0;
    animation.toValue = @0.75;
//    animation.repeatDuration = 60;
    animation.fillMode = kCAFillModeForwards;
    animation.delegate = self;
    [animation setValue:@"step1" forKey:@"name"];
    [self.bgLayer addAnimation:animation forKey:nil];
}

//第一阶段
- (void)doStep2 {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"progress"];
    animation.duration = 0.7;
    animation.fromValue = @0.75;
    animation.toValue = @1.0;
//    animation.repeatDuration = 60;
    animation.delegate = self;
    animation.fillMode = kCAFillModeForwards;
    [animation setValue:@"step2" forKey:@"name"];
    [self.bgLayer addAnimation:animation forKey:nil];
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if(self.num < 0){
        return;
    }
    self.num -= 1;
    if ([[anim valueForKey:@"name"] isEqualToString:@"step1"])
    {
        [self doStep2];
    }else {
        [self doStep1];
    }
}

- (void)startAnimation:(NSInteger)round{
    if(!round){
        round = 50;
    }
    if(!self.num || self.num <=0){
        [self.bgLayer removeAllAnimations];
        self.num = round;
    }else {
        return;
    }
    [self doStep1];
}

- (void)stopAnimation{
    self.num = 0;
    [self.bgLayer removeAllAnimations];
}

@end

@implementation TNonModelLoadingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
		[self.layer setCornerRadius:10.0];

		UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
		[activity startAnimating];
		[self addSubview:activity];
		activity.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);

    }
    return self;
}

+ (instancetype)showLoadingAddedTo:(UIView *)view animated:(BOOL)animated
{
	TNonModelLoadingView *loadingView = [[self alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
	loadingView.center = CGPointMake(view.frame.size.width/2, view.frame.size.height/2);
	[view addSubview:loadingView];
    
    loadingView.alpha = 0.f;
	if (animated) {
        [UIView animateWithDuration:.3f animations:^{
            loadingView.alpha = 1.f;
        }];
    }
    else {
        loadingView.alpha = 1.0;
    }
	return loadingView;
}

+ (void)hideLoadingForView:(UIView *)view animated:(BOOL)animated
{
	NSMutableArray *viewsToRemove = [NSMutableArray array];

	for (UIView *v in [view subviews]) {
		if ([v isKindOfClass:[TNonModelLoadingView class]]) {
			[viewsToRemove addObject:v];
		}
	}

    for (TNonModelLoadingView *loadingView in viewsToRemove){
		if (animated) {
            
            [UIView animateWithDuration:.3f animations:^{
                loadingView.alpha = 0.0;
            } completion:^(BOOL finished) {
                [loadingView removeFromSuperview];
            }];
		}
		else {
			loadingView.alpha = 0.0;
			[loadingView removeFromSuperview];
		}

	}
}

@end
