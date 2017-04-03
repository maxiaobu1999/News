//
//  CodingHelper.h
//  CodingHelper
//
//  Created by 徐伟博 on 16/5/18.
//  Copyright © 2016年 保得利(北京)科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 固定高度 -
// 状态栏高度
#define kStaH                       20
// 导航栏高度
#define kNavH                       44
// 标签栏高度
#define kTabH                       49
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 屏幕界限 -
// 屏幕界限
#define kScreenB                    [[UIScreen mainScreen] bounds]
// 屏幕宽度
#define kScreenW                    kScreenB.size.width
// 屏幕高度
#define kScreenH                    kScreenB.size.height
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 创建颜色 -
// 创建单色
#define kRed                        [UIColor redColor]
#define kOrange                     [UIColor orangeColor]
#define kYellow                     [UIColor yellowColor]
#define kGreen                      [UIColor greenColor]
#define kCyan                       [UIColor cyanColor]
#define kBlue                       [UIColor blueColor]
#define kPurple                     [UIColor purpleColor]
#define kMagenta                    [UIColor magentaColor]
#define kBrown                      [UIColor brownColor]
#define kBlack                      [UIColor blackColor]
#define kDarkGray                   [UIColor darkGrayColor]
#define kGray                       [UIColor grayColor]
#define kLightGray                  [UIColor lightGrayColor]
#define kWhite                      [UIColor whiteColor]
#define kClear                      [UIColor clearColor]
// 十进制RGB颜色
#define kColor10(R, G, B, A)        [UIColor colorWithRed:(R) / 255.0 green:(G) / 255.0 blue:(B) / 255.0 alpha:(A)]
// 十六进制RGB颜色
#define kColorFromRGB16(RGB, A)     [UIColor colorWithRed:(((RGB) & 0xFF0000) >> 16) / 255.0 green:(((RGB) & 0xFF00) >> 8) / 255.0 blue:((RGB) & 0xFF) / 255.0 alpha:(A)]
// 随机颜色
#define kRandomColor(A)             [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:(A)]
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 视图定位 -
// 视图的X坐标
#define kViewX(view)                (view).frame.origin.x
// 视图的Y坐标
#define kViewY(view)                (view).frame.origin.y
// 视图的宽度
#define kViewW(view)                (view).frame.size.width
// 视图的高度
#define kViewH(view)                (view).frame.size.height
// 视图的右边X坐标
#define kViewR(view)                (kViewX(view) + kViewW(view))
// 视图的下边Y坐标
#define kViewB(view)                (kViewY(view) + kViewH(view))
// ----------------------------------------------------------------------------------------------------------------
// 编程小助手
@interface CodingHelper : NSObject
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - UIView -
// UIView
+ (UIView *)createViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor;
// 设置圆角
+ (void)setView:(UIView *)view withCornerRadius:(CGFloat)cornerRadius;
// 设置边框宽度和颜色
+ (void)setView:(UIView *)view withBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
// 设置目标和动作
+ (void)setView:(UIView *)view withTarget:(id)target action:(SEL)action;
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - UIImageView -
// 以名字获得图片
#define kImageN(name)               [UIImage imageNamed:(name)]
// 以沙盒路径获得图片
#define kImageP(path)               [UIImage imageWithContentsOfFile:(path)]
// 以二进制数据获得图片
#define kImageD(data)               [UIImage imageWithData:(data)]
// UIImageView
+ (UIImageView *)createImageViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor image:(UIImage *)image;
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - UILabel -
// 系统默认字体仅设置字号
#define kSysFont(A)                 [UIFont systemFontOfSize:(A)]
// 系统默认粗体仅设置字号
#define kBoldFont(A)                [UIFont boldSystemFontOfSize:(A)]
// 同时设置字体和字号
#define kFontNA(N, A)               [UIFont fontWithName:(N) size:(A)]
// UILabel
+ (UILabel *)createLabelWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor text:(NSString *)text lines:(NSInteger)lines font:(UIFont *)font textColor:(UIColor *)textColor align:(NSTextAlignment)align breakMode:(NSLineBreakMode)breakMode;
// 根据宽度自适应高度
+ (CGFloat)adaptedHeightOfLabel:(UILabel *)label withWidth:(CGFloat)width;
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - UIButton -
// UIButton
+ (UIButton *)createButtonWithType:(UIButtonType)type frame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor title:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action;
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - UITextField
// UITextField
+ (UITextField *)createTextFieldWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor borderStyle:(UITextBorderStyle)borderStyle placeHolder:(NSString *)placeHolder text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor align:(NSTextAlignment)align keyboardType:(UIKeyboardType)keyboardType delegate:(id<UITextFieldDelegate>)delegate;
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - UITextView
// UITextView
+ (UITextView *)createTextViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor align:(NSTextAlignment)align delegate:(id<UITextViewDelegate>)delegate;
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - UIScrollView -
// UIScrollView
+ (UIScrollView *)createScrollViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor delegate:(id<UIScrollViewDelegate>)delegate;
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - UITableView -
// UITableView
+ (UITableView *)createTableViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor style:(UITableViewStyle)style dataSource:(id<UITableViewDataSource>)dataSource delegate:(id<UITableViewDelegate>)delegate;
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - UIAlertView -
+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message delegate:(id<UIAlertViewDelegate>)delegate cancelTitle:(NSString *)cancelTitle otherTitle:(NSString *)otherTitle;
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 常用宏 -
// 系统版本浮点数
#define kSystemVSN                  [[[UIDevice currentDevice] systemVersion] floatValue]
// ----------------------------------------------------------------------------------------------------------------
// 用户偏好设置
#define kUserDefaults               [NSUserDefaults standardUserDefaults]
// 根据KEY获取一个对象
#define kObjFK(key)                 [kUserDefaults objectForKey:(key)]
// ----------------------------------------------------------------------------------------------------------------
// NSNotificationCenter
#define kNTFC                       [NSNotificationCenter defaultCenter]
// ----------------------------------------------------------------------------------------------------------------
// NSLog
#define kOutput(obj)                NSLog(@"%@", (obj))
// ----------------------------------------------------------------------------------------------------------------
// 沙盒根目录
#define kHomePath                   NSHomeDirectory()
// document目录
#define kDocPath                    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
// Library/Cache目录
#define kCachePath                  [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]
// Library目录
#define kLibPath                    [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0]
// temp目录
#define kTempPath                   NSTemporaryDirectory()
// ----------------------------------------------------------------------------------------------------------------
// NSFileManager
#define kFileManager                [NSFileManager defaultManager]
// 文件是否存在
#define kFileExists(path)           [kFileManager fileExistsAtPath:(path)]
// ----------------------------------------------------------------------------------------------------------------
// GCD并发队列
#define kCONCURRENT_QUEUE           dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
// 主队列
#define kMAIN_QUEUE                 dispatch_get_main_queue()
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 功能方法 -
// 把一个图片对象写到指定的沙盒路径
+ (void)writeImage:(UIImage *)image toFilePath:(NSString *)path;
// 获得指定URL的图片
+ (UIImage *)imageWithURLStr:(NSString *)str;
// 字符串判空
+ (BOOL)isBlankString:(NSString *)string;
// 判断手机号合法性
+ (BOOL)isValidCellphoneNumber:(NSString *)aNumber;
// 汉字转大写拼音
+ (NSString *)latinStringOfMandarin:(NSString *)string;
// 日期TO字符串
+ (NSString *)stringWithFormat:(NSString *)format ofDate:(NSDate *)date;
// 字符串TO日期
+ (NSDate *)dateWithFormat:(NSString *)format ofString:(NSString *)string;
// ----------------------------------------------------------------------------------------------------------------
#define IPHONE              @"iPhone"
#define IPHONE_3G           @"iPhone 3G"
#define IPHONE_3GS          @"iPhone 3GS"
#define IPHONE_4            @"iPhone 4"
#define IPHONE_4S           @"iPhone 4S"
#define IPHONE_5            @"iPhone 5"
#define IPHONE_5C           @"iPhone 5C"
#define IPHONE_5S           @"iPhone 5S"
#define IPHONE_6            @"iPhone 6"
#define IPHONE_6_PLUS       @"iPhone 6 Plus"
#define IPHONE_6S           @"iPhone 6S"
#define IPHONE_6S_PLUS      @"iPhone 6S Plus"
#define IPHONE_SE           @"iPhone SE"
#define IPHONE_7            @"iPhone 7"
#define IPHONE_7_PLUS       @"iPhone 7 Plus"
#define IPHONE_SIMULATOR    @"iPhone Simulator"
#define IPOD_TOUCH_OR_IPAD  @"iPod Touch or iPad"
// ----------------------------------------------------------------------------------------------------------------
// 判断iPhone型号, 用于获取设备具体机型, 包含所有的iPhone真实机型, 另外把模拟器归为一类, 其他iOS设备归为一类
+ (NSString *)iPhoneType;
// 简单判断一下iPhone的宽度, 做屏幕适配用, 目前有4/5/SE, 6/7, 6P/7P三种宽度
+ (BOOL)isiPhone45SE;
// 6或者6S
+ (BOOL)isiPhone67;
// 6P或者6SP
+ (BOOL)isiPhone6P7P;
// 选择非空对象
+ (id)object:(id)anObj defaultObject:(id)defaultObj;
// 选择非空字符串
+ (NSString *)string:(NSString *)aStr defaultString:(NSString *)defaultStr;
// 取得字典对应键的值, 一律转换为字符串, 如果值不存在则返回默认文字, 减少崩溃
+ (NSString *)valueOfDict:(NSDictionary *)dict forKey:(NSString *)key defaultValue:(NSString *)dft;
// 取得字典对应键的值, 一律转换为字符串, 如果值不存在则返回空字符串, 减少崩溃
+ (NSString *)valueOfDict:(NSDictionary *)dict forKey:(NSString *)key;
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 数据存取 -
// 保存一个对象
+ (void)setObject:(id)anObj forKey:(NSString *)string;
// 读取一个对象
+ (id)objectForKey:(NSString *)string;
// 删除一个键值对
+ (void)removeObjectForKey:(NSString *)string;
// 清空plist文件
+ (void)clear;
// ----------------------------------------------------------------------------------------------------------------
@end
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 高效圆角 -
@interface UIView (RoundCorner)
- (void)setCornerRadius:(CGFloat)cr borderWidth:(CGFloat)bw borderColor:(UIColor *)bc backgroundColor:(UIColor *)backgroundColor;
@end
// ----------------------------------------------------------------------------------------------------------------
#pragma mark - 图片圆角 -
@interface UIImage (RoundCorner)
- (UIImage *)imageWithCornerRadius:(CGFloat)radius size:(CGSize)size;
@end
// ----------------------------------------------------------------------------------------------------------------
