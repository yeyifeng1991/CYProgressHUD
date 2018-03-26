//
//  CYProgressHUD.m
//  CYProgressHUD
//
//  Created by YeYiFeng on 2018/3/24.
//  Copyright © 2018年 叶子. All rights reserved.
//

#import "CYProgressHUD.h"
#import "CYProgressTextView.h"
@implementation CYProgressHUD
+(instancetype)sharedInstance;
{
    static CYProgressHUD * hud = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hud = [[CYProgressHUD alloc]init];
        
    });
    return hud;
}
-(instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame;
{
    if (self = [super initWithFrame:frame]) {
      
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
// 设置/添加hudView的方法
- (void)setHudView:(UIView *)hudView;
{
    [self addSubview:hudView];
}
// 被window弹出的方法，同时设置显示的时间，当设置的时间小于等于0的时候将不会自动移除
- (void)showWithTime:(CGFloat)time;
{

    UIWindow * window = [[UIApplication sharedApplication].delegate window];
    if (self.superview == nil) {
        [window addSubview:self];
    }
// 这一段代码请查看简书文章
// https://www.jianshu.com/p/372848c7e351
    if (time>0) {
        __weak typeof(self)weakSelf = self;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            __strong typeof(weakSelf) strongSelf = weakSelf;
            if (strongSelf) {
                [strongSelf hide];
            }
        });
    }
}
// 移除hud的方法
- (void)hide;
{
    UIView * hudView = [self.subviews firstObject];
    if (hudView) {
        [hudView removeFromSuperview];
        if (self.subviews.count == 0) {
            [self removeFromSuperview];
        }
    }
    else
    {
        [self removeFromSuperview];
    }
}
// 移除所有hud的方法
- (void)hideAllHUDs;
{
    // 第一种方法，运行数组自带的方法
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self removeFromSuperview];
    
    /*
        // 第二种方法遍历删除
     for (UIView *subView in self.subviews) {
     [subView removeFromSuperview];
     }
     [self removeFromSuperview];
     */
 
  
}
#pragma mark  - 页面布局
- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.superview) {// superView == window
        self.frame = self.superview.bounds;
        
        for (UIView *subview in self.subviews) {
            /// 自定义的hudView
            CGRect frame = subview.frame;
            subview.frame = frame;

        }
    }
}
// 添加hudView视图上的显示内容
+ (void)showStatus:(NSString *)status andAutoHideAfterTime:(CGFloat)showTime;
{
    CYProgressHUD * hudView = [CYProgressHUD sharedInstance];
    CYProgressTextView *textView = [[CYProgressTextView alloc]init];
    textView.text = status;
    [hudView setHudView:textView];
    [hudView showWithTime:showTime];
    
    
}


@end
