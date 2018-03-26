//
//  ViewController.m
//  CYProgressHUD
//
//  Created by YeYiFeng on 2018/3/24.
//  Copyright © 2018年 叶子. All rights reserved.
//

#import "ViewController.h"
#import "CYProgressHUD.h"
#import "ZJProgressHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [CYProgressHUD showStatus:@"来着何人" andAutoHideAfterTime:5];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
