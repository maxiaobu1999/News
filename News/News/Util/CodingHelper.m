//
//  CodingHelper.m
//  CodingHelper
//
//  Created by 徐伟博 on 16/5/18.
//  Copyright © 2016年 保得利(北京)科技有限公司. All rights reserved.
//

#import "CodingHelper.h"
#import "sys/utsname.h"

@implementation CodingHelper

#pragma mark - UIView -

+ (UIView *)createViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor {
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = backgroundColor;
    return view;
}

+ (void)setView:(UIView *)view withCornerRadius:(CGFloat)cornerRadius {
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = cornerRadius;
}

+ (void)setView:(UIView *)view withBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    view.layer.masksToBounds = YES;
    view.layer.borderWidth = borderWidth;
    view.layer.borderColor = borderColor.CGColor;
}

+ (void)setView:(UIView *)view withTarget:(id)target action:(SEL)action {
    view.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [view addGestureRecognizer:tap];
}

#pragma mark - UIImageView -

+ (UIImageView *)createImageViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor image:(UIImage *)image {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.backgroundColor = backgroundColor;
    imageView.image = image;
    return imageView;
}

#pragma mark - UILabel -

+ (UILabel *)createLabelWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor text:(NSString *)text lines:(NSInteger)lines font:(UIFont *)font textColor:(UIColor *)textColor align:(NSTextAlignment)align breakMode:(NSLineBreakMode)breakMode {
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = backgroundColor;
    label.text = text;
    label.numberOfLines = lines;
    label.font = font;
    label.textColor = textColor;
    label.textAlignment = align;
    label.lineBreakMode = breakMode;
    return label;
}

+ (CGFloat)adaptedHeightOfLabel:(UILabel *)label withWidth:(CGFloat)width {
    NSDictionary *dict = @{NSFontAttributeName : label.font};
    CGSize realSize = [label.text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return realSize.height;
}

#pragma mark - UIButton -

+ (UIButton *)createButtonWithType:(UIButtonType)type frame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor title:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:type];
    button.frame = frame;
    button.backgroundColor = backgroundColor;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = font;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

#pragma mark - UITextField -

+ (UITextField *)createTextFieldWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor borderStyle:(UITextBorderStyle)borderStyle placeHolder:(NSString *)placeHolder text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor align:(NSTextAlignment)align keyboardType:(UIKeyboardType)keyboardType delegate:(id<UITextFieldDelegate>)delegate {
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.backgroundColor = backgroundColor;
    textField.borderStyle = borderStyle;
    textField.placeholder = placeHolder;
    textField.text = text;
    textField.font = font;
    textField.textColor = textColor;
    textField.textAlignment = align;
    textField.keyboardType = keyboardType;
    textField.delegate = delegate;
    return textField;
}

#pragma mark - UITextView -

+ (UITextView *)createTextViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor align:(NSTextAlignment)align delegate:(id<UITextViewDelegate>)delegate {
    UITextView *textView = [[UITextView alloc] initWithFrame:frame];
    textView.backgroundColor = backgroundColor;
    textView.text = text;
    textView.font = font;
    textView.textColor = textColor;
    textView.textAlignment = align;
    textView.delegate = delegate;
    return textView;
}

#pragma mark - UIScrollView -

+ (UIScrollView *)createScrollViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor delegate:(id<UIScrollViewDelegate>)delegate {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame];
    scrollView.backgroundColor = backgroundColor;
    scrollView.delegate = delegate;
    return scrollView;
}

#pragma mark - UITableView -

+ (UITableView *)createTableViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor style:(UITableViewStyle)style dataSource:(id<UITableViewDataSource>)dataSource delegate:(id<UITableViewDelegate>)delegate {
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:style];
    tableView.backgroundColor = backgroundColor;
    tableView.dataSource = dataSource;
    tableView.delegate = delegate;
    return tableView;
}

#pragma mark - UIAlertView -

+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message delegate:(id<UIAlertViewDelegate>)delegate cancelTitle:(NSString *)cancelTitle otherTitle:(NSString *)otherTitle {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelTitle otherButtonTitles:otherTitle, nil];
    [alert show];
}

#pragma mark - 功能方法 -

+ (void)writeImage:(UIImage *)image toFilePath:(NSString *)path {
    NSData *imageData = UIImagePNGRepresentation(image);
    [imageData writeToFile:path atomically:YES];
}

+ (UIImage *)imageWithURLStr:(NSString *)str {
    NSURL *url = [NSURL URLWithString:str];
    NSData *data = [NSData dataWithContentsOfURL:url];
    return kImageD(data);
}

+ (BOOL)isBlankString:(NSString *)string {
    if (!string) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0) {
        return YES;
    }
    return NO;
}

+ (BOOL)isValidCellphoneNumber:(NSString *)aNumber {
    // 宁滥勿缺
    NSString *mobileRegex = @"^1(3|4|5|7|8)\\d{9}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobileRegex];
    return [predicate evaluateWithObject:aNumber];
}

+ (NSString *)latinStringOfMandarin:(NSString *)string {
    NSMutableString *preString = [string mutableCopy];
    CFStringTransform((CFMutableStringRef)preString, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((CFMutableStringRef)preString, NULL, kCFStringTransformStripDiacritics, NO);
    return [[preString stringByReplacingOccurrencesOfString:@" " withString:@""] uppercaseString];
}

+ (NSString *)stringWithFormat:(NSString *)format ofDate:(NSDate *)date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = format;
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}

+ (NSDate *)dateWithFormat:(NSString *)format ofString:(NSString *)string {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = format;
    NSDate *date = [formatter dateFromString:string];
    return date;
}

+ (NSString *)iPhoneType {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    // 未考虑iPod和iPad设备
    // https://www.theiphonewiki.com/wiki/Models
    if ([deviceString isEqualToString:@"iPhone1,1"]) {
        return IPHONE;
    }
    if ([deviceString isEqualToString:@"iPhone1,2"]) {
        return IPHONE_3G;
    }
    if ([deviceString isEqualToString:@"iPhone2,1"]) {
        return IPHONE_3GS;
    }
    if ([deviceString hasPrefix:@"iPhone3"]) {
        return IPHONE_4;
    }
    if ([deviceString isEqualToString:@"iPhone4,1"]) {
        return IPHONE_4S;
    }
    if ([deviceString isEqualToString:@"iPhone5,1"] || [deviceString isEqualToString:@"iPhone5,2"]) {
        return IPHONE_5;
    }
    if ([deviceString isEqualToString:@"iPhone5,3"] || [deviceString isEqualToString:@"iPhone5,4"]) {
        return IPHONE_5C;
    }
    if ([deviceString hasPrefix:@"iPhone6"]) {
        return IPHONE_5S;
    }
    if ([deviceString isEqualToString:@"iPhone7,2"]) {
        return IPHONE_6;
    }
    if ([deviceString isEqualToString:@"iPhone7,1"]) {
        return IPHONE_6_PLUS;
    }
    if ([deviceString isEqualToString:@"iPhone8,1"]) {
        return IPHONE_6S;
    }
    if ([deviceString isEqualToString:@"iPhone8,2"]) {
        return IPHONE_6S_PLUS;
    }
    if ([deviceString isEqualToString:@"iPhone8,4"]) {
        return IPHONE_SE;
    }
    if ([deviceString isEqualToString:@"iPhone9,1"] || [deviceString isEqualToString:@"iPhone9,3"]) {
        return IPHONE_7;
    }
    if ([deviceString isEqualToString:@"iPhone9,2"] || [deviceString isEqualToString:@"iPhone9,4"]) {
        return IPHONE_7_PLUS;
    }
    if ([deviceString isEqualToString:@"i386"] || [deviceString isEqualToString:@"x86_64"]) {
        return IPHONE_SIMULATOR;
    }
    return IPOD_TOUCH_OR_IPAD;
}

+ (BOOL)isiPhone45SE {
    // 不管横竖屏都会判断正确
    // 320 * 568
    if (MAX(kScreenW, kScreenH) == 568) {
        return YES;
    }
    return NO;
}

+ (BOOL)isiPhone67 {
    // 375 * 667
    if (MAX(kScreenW, kScreenH) == 667) {
        return YES;
    }
    return NO;
}

+ (BOOL)isiPhone6P7P {
    // 414 * 736
    if (MAX(kScreenW, kScreenH) == 736) {
        return YES;
    }
    return NO;
}

+ (id)object:(id)anObj defaultObject:(id)defaultObj {
    return anObj ? anObj : defaultObj;
}

+ (NSString *)string:(NSString *)aStr defaultString:(NSString *)defaultStr {
    return [self isBlankString:aStr] ? defaultStr : aStr;
}

+ (NSString *)valueOfDict:(NSDictionary *)dict forKey:(NSString *)key defaultValue:(NSString *)dft {
    NSString *value = [NSString stringWithFormat:@"%@", dict[key]];
    return [self string:value defaultString:dft];
}

+ (NSString *)valueOfDict:(NSDictionary *)dict forKey:(NSString *)key {
    return [self valueOfDict:dict forKey:key defaultValue:@""];
}

#pragma mark - 数据存储 -

/*
 Writes a property list representation of the contents of the dictionary to a given path.
 This method recursively validates that all the contained objects are property list objects (instances of NSData, NSDate, NSNumber, NSString, NSArray, or NSDictionary) before writing out the file, and returns NO if all the objects are not property list objects, since the resultant file would not be a valid property list.
 If the dictionary’s contents are all property list objects, the file written by this method can be used to initialize a new dictionary with the class method dictionaryWithContentsOfFile: or the instance method initWithContentsOfFile:.
 */

+ (NSString *)dictPath {
    NSString *dictPath = [kLibPath stringByAppendingPathComponent:@"sundry.plist"];
    if (!kFileExists(dictPath)) {
        [[NSMutableDictionary dictionary] writeToFile:dictPath atomically:YES];
    }
    return dictPath;
}

+ (NSMutableDictionary *)readDict {
    kOutput([self dictPath]);
    return [NSMutableDictionary dictionaryWithContentsOfFile:[self dictPath]];
}

+ (void)writeDict:(NSMutableDictionary *)aDict {
    [aDict writeToFile:[self dictPath] atomically:YES];
}

+ (void)setObject:(id)anObj forKey:(NSString *)string {
    NSMutableDictionary *dict = [self readDict];
    [dict setObject:anObj forKey:string];
    [self writeDict:dict];
}

+ (id)objectForKey:(NSString *)string {
    return [[self readDict] objectForKey:string];
}

+ (void)removeObjectForKey:(NSString *)string {
    NSMutableDictionary *dict = [self readDict];
    [dict removeObjectForKey:string];
    [self writeDict:dict];
}

+ (void)clear {
    NSMutableDictionary *dict = [self readDict];
    [dict removeAllObjects];
    [self writeDict:dict];
}

@end

#pragma mark - 高效圆角 -

@implementation UIView (RoundCorner)

- (void)setCornerRadius:(CGFloat)cr borderWidth:(CGFloat)bw borderColor:(UIColor *)bc backgroundColor:(UIColor *)backgroundColor {
    UIView *view = [[UIView alloc] initWithFrame:self.frame];
    view.backgroundColor = backgroundColor;
    view.layer.cornerRadius = cr;
    view.layer.borderWidth = bw;
    view.layer.borderColor = bc.CGColor;
    [self.superview insertSubview:view belowSubview:self];
}

@end

#pragma mark - 图片圆角 -

@implementation UIImage (RoundCorner)

- (UIImage *)imageWithCornerRadius:(CGFloat)radius size:(CGSize)size {
    CGFloat drawRadius = radius * (self.size.width / size.width);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddPath(context, [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(drawRadius, drawRadius)].CGPath);
    CGContextClip(context);
    [self drawInRect:rect];
    CGContextDrawPath(context, kCGPathFillStroke);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
