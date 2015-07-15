//
//  CKKIt.h
//  GoodIOSExample
//
//  Created by chksong on 15/7/12.
//  Copyright (c) 2015年 chksong company. All rights reserved.
//

#ifndef GoodIOSExample_CKKIt_h
#define GoodIOSExample_CKKIt_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <SystemConfiguration/SystemConfiguration.h>

#pragma mark - 宏定义




// 屏幕大小
#define T_SCREEN_WIDTH      [UIScreen mainScreen].bounds.size.width
#define T_SCREEN_HEIGHT     [UIScreen mainScreen].bounds.size.height


#pragma mark  左滑动窗口
#define kSwitchLeftViewNotification @"kSwitchLeftViewNotification"


#pragma mark 常用函数


/**
 *  获得屏幕缩放大小
 *
 *  @return 缩放大小
 */
CGFloat TProportion(void);




#endif
