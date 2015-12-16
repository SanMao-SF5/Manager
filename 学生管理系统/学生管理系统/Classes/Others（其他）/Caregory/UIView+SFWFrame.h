//
//  UIView+SFWFrame.h
//  彩票
//
//  Created by 沈方武 on 15/7/19.
//  Copyright (c) 2015年 沈方武. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SFWFrame)

/** 分类中使用@property只会自动生成set,get方法，不会生成下划线的成员属性 */
@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat x;

@property (nonatomic, assign) CGFloat y;

@property (nonatomic, assign) CGFloat centerX;

@property (nonatomic, assign) CGFloat centerY;

@end
