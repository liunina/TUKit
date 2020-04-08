//
//  UIImage+Addition.m
//  TUKit
//
//  Created by liu nian on 2020/3/28.
//

#import "UIImage+Addition.h"

@implementation UIImage (Barcode)

+ (UIImage *)barcodeImageWithContent:(NSString *)content imageSize:(CGSize)size {
	CIImage *image = [self barcodeImageWithContent:content];
	
	CGRect extent = CGRectIntegral(image.extent);
	CGFloat scaleWidth = size.width/CGRectGetWidth(extent);
	CGFloat scaleHeight = size.height/CGRectGetHeight(extent);
	size_t width = CGRectGetWidth(extent) * scaleWidth;
	size_t height = CGRectGetHeight(extent) * scaleHeight;
	CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceGray();
	CGContextRef contentRef = CGBitmapContextCreate(nil, width, height, 8, 0, colorSpaceRef, (CGBitmapInfo)kCGImageAlphaNone);
	CIContext *context = [CIContext contextWithOptions:nil];
	CGImageRef imageRef = [context createCGImage:image fromRect:extent];
	CGContextSetInterpolationQuality(contentRef, kCGInterpolationNone);
	CGContextScaleCTM(contentRef, scaleWidth, scaleHeight);
	CGContextDrawImage(contentRef, extent, imageRef);
	CGImageRef imageRefResized = CGBitmapContextCreateImage(contentRef);
	CGContextRelease(contentRef);
	CGImageRelease(imageRef);
	return [UIImage imageWithCGImage:imageRefResized];
}

+ (CIImage *)barcodeImageWithContent:(NSString *)content {
	CIFilter *qrFilter = [CIFilter filterWithName:@"CICode128BarcodeGenerator"];
	NSData *contentData = [content dataUsingEncoding:NSUTF8StringEncoding];
	[qrFilter setValue:contentData forKey:@"inputMessage"];
	[qrFilter setValue:@(0.00) forKey:@"inputQuietSpace"];
	CIImage *image = qrFilter.outputImage;
	return image;
}

@end

@implementation UIImage (bundleRes)

+ (UIImage *)imageNamed:(NSString *)name bundleName:(NSString *)bundleName {
	if (bundleName.length) {
		name = [NSString stringWithFormat:@"%@.bundle/%@",bundleName,name];
	}
	return [UIImage imageNamed:name];
}

@end
@implementation UIImage (TColor)

- (UIImage *)imageTintedWithColor:(UIColor *)color {
	// This method is designed for use with template images, i.e. solid-coloured mask-like images.
	return [self imageTintedWithColor:color fraction:0.0]; // default to a fully tinted mask of the image.
}


- (UIImage *)imageTintedWithColor:(UIColor *)color fraction:(CGFloat)fraction {
	if (color) {
		// Construct new image the same size as this one.
		UIImage *image;
		
		if ([UIScreen instancesRespondToSelector:@selector(scale)]) {
			UIGraphicsBeginImageContextWithOptions([self size], NO, 0.f); // 0.f for scale means "scale for device's main screen".
		} else {
			UIGraphicsBeginImageContext([self size]);
		}
		CGRect rect = CGRectZero;
		rect.size = [self size];
		
		// Composite tint color at its own opacity.
		[color set];
		UIRectFill(rect);
		
		// Mask tint color-swatch to this image's opaque mask.
		// We want behaviour like NSCompositeDestinationIn on Mac OS X.
		[self drawInRect:rect blendMode:kCGBlendModeDestinationIn alpha:1.0];
		
		// Finally, composite this image over the tinted mask at desired opacity.
		if (fraction > 0.0) {
			// We want behaviour like NSCompositeSourceOver on Mac OS X.
			[self drawInRect:rect blendMode:kCGBlendModeSourceAtop alpha:fraction];
		}
		image = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
		
		return image;
	}
	return self;
}

@end

@implementation UIImage (tool)

+ (UIImage *)imageWithColor:(UIColor *)aColor {
	return [self imageWithColor:aColor imageSize:CGSizeMake(1, 1)];
}

+ (UIImage *)imageWithColor:(UIColor *)aColor imageSize:(CGSize)imageSize {
	CGRect rect = CGRectMake(0.0f, 0.0f, imageSize.width, imageSize.height);
	UIGraphicsBeginImageContext(rect.size);
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetFillColorWithColor(context, [aColor CGColor]);
	CGContextFillRect(context, rect);
	UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return theImage;
}

+ (UIImage *)imageWithColor:(UIColor *)aColor cornerRadius:(float)cornerRadius
{
	CGFloat minSize = cornerRadius * 2 + 1;;
	CGRect rect = CGRectMake(0, 0, minSize, minSize);
	UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius];
	roundedRect.lineWidth = 0;
	UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0f);
	[aColor setFill];
	[roundedRect fill];
	UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return [image resizableImageWithCapInsets:UIEdgeInsetsMake(cornerRadius, cornerRadius, cornerRadius, cornerRadius)];
}

+ (UIImage *)imageWithView:(UIView *)view
{
	CGFloat scale = [UIScreen mainScreen].scale;
	
	UIGraphicsBeginImageContextWithOptions(CGSizeMake(view.frame.size.width,
													  view.frame.size.height),
										   NO,
										   scale);
	CGContextRef context = UIGraphicsGetCurrentContext();
	[view.layer renderInContext:context];
	CGContextRestoreGState(context);
	
	//开始生成图片
	UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return image;
}

+ (UIImage *)image:(UIImage *)image WithTintColor:(UIColor *)tintColor
{
	//We want to keep alpha, set opaque to NO; Use 0.0f for scale to use the scale factor of the device’s main screen.
	UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
	[tintColor setFill];
	CGRect bounds = CGRectMake(0, 0, image.size.width, image.size.height);
	UIRectFill(bounds);
	
	//Draw the tinted image in context
	[image drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
	
	UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return tintedImage;
}

//设置图片透明度
- (UIImage *)imageByApplyingAlpha:(CGFloat)alpha
{
	UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
	
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGRect area = CGRectMake(0, 0, self.size.width, self.size.height);
	
	CGContextScaleCTM(ctx, 1, -1);
	CGContextTranslateCTM(ctx, 0, -area.size.height);
	
	CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
	
	CGContextSetAlpha(ctx, alpha);
	
	CGContextDrawImage(ctx, area, self.CGImage);
	
	UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
	
	UIGraphicsEndImageContext();
	
	return newImage;
}

//等比例缩放
-(UIImage*)scaleToSize:(CGSize)size
{
	//不用CGImageGetHeight(self.CGImage)，图片拍摄后会旋转90度，exif属性会记录，CGImageGetHeight实际会获得宽度而不是高度
	CGFloat width = self.size.width;
	CGFloat height = self.size.height;
	
	float verticalRadio = size.height*1.0/height;
	float horizontalRadio = size.width*1.0/width;
	
	float radio = 1;
	if(verticalRadio>1 && horizontalRadio>1)
	{
		radio = verticalRadio > horizontalRadio ? horizontalRadio : verticalRadio;
	}
	else
	{
		radio = verticalRadio < horizontalRadio ? verticalRadio : horizontalRadio;
	}
	
	width = width*radio;
	height = height*radio;
	
	int xPos = (size.width - width)/2;
	int yPos = (size.height - height)/2;
	
	// 创建一个bitmap的context
	// 并把它设置成为当前正在使用的context
	UIGraphicsBeginImageContext(size);
	
	// 绘制改变大小的图片
	[self drawInRect:CGRectMake(xPos, yPos, width, height)];
	
	// 从当前context中创建一个改变大小后的图片
	UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
	
	// 使当前的context出堆栈
	UIGraphicsEndImageContext();
	
	// 返回新的改变大小后的图片
	return scaledImage;
}

/**
 *	按照尺寸缩放图片
 *
 *	@param aSize
 *
 *	@return
 */
- (UIImage *)shrinkImageForSize:(CGSize)aSize
{
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGContextRef context = CGBitmapContextCreate(NULL,
												 aSize.width ,
												 aSize.height ,
												 8,
												 0,
												 colorSpace,
												 kCGBitmapByteOrderDefault|kCGImageAlphaPremultipliedLast);
	CGContextDrawImage(context,
					   CGRectMake(0, 0, aSize.width , aSize.height ),
					   self.CGImage);
	CGImageRef shrunken = CGBitmapContextCreateImage(context);
	UIImage *final = [UIImage imageWithCGImage:shrunken];
	CGContextRelease(context);
	CGImageRelease(shrunken);
	CGColorSpaceRelease(colorSpace);
	return final;
}

- (NSString *)saveImageWithName:(NSString *)imageName
		  forCompressionQuality:(CGFloat )aQuality {
	if (aQuality < 0) {
		aQuality = 0;
	}
	if (aQuality > 1.0f) {
		aQuality = 1.0f;
	}
	
	NSData* imageData=UIImageJPEGRepresentation(self, aQuality);
	
	NSString* fullPathToFile = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",imageName]];
	if ([[NSFileManager defaultManager] fileExistsAtPath:fullPathToFile]) {
		[[NSFileManager defaultManager] removeItemAtPath:fullPathToFile error:nil];
	}
	
	NSLog(@"save image%@ At path %@",self,fullPathToFile);
	
	if (![imageData writeToFile:fullPathToFile atomically:NO]) {
		return nil;
	}
	return fullPathToFile;
}


@end
