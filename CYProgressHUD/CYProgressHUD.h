//
//  CYProgressHUD.h
//  CYProgressHUD
//
//  Created by YeYiFeng on 2018/3/24.
//  Copyright © 2018年 叶子. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYProgressHUD : UIView
+(instancetype)sharedInstance;
-(instancetype)init;
- (instancetype)initWithFrame:(CGRect)frame;
// 设置/添加hudView的方法
- (void)setHudView:(UIView *)hudView;
// 被window弹出的方法，同时设置显示的时间，当设置的时间小于等于0的时候将不会自动移除
- (void)showWithTime:(CGFloat)time;
// 移除hud的方法
- (void)hide;
// 移除所有hud的方法
- (void)hideAllHUDs;
+ (void)showStatus:(NSString *)status andAutoHideAfterTime:(CGFloat)showTime;

@end

@interface CYProgressHUD (Public)


@end
