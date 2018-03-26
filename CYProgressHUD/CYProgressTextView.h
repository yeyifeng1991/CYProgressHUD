//
//  CYProgressTextView.h
//  CYProgressHUD
//
//  Created by YeYiFeng on 2018/3/26.
//  Copyright © 2018年 叶子. All rights reserved.
//

#import <UIKit/UIKit.h>
// 只显示text的视图
@interface CYProgressTextView : UIView
/** 设置提示文字*/
@property (strong, nonatomic) NSString *text;
/** 设置文字颜色 */
@property (strong, nonatomic) UIColor *textColor;
@end
