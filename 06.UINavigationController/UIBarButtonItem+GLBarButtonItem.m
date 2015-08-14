
//
//  UIBarButtonItem+GLBarButtonItem.m
//  06.UINavigationController
//
//  Created by gool on 15/8/14.
//  Copyright (c) 2015年 mac os. All rights reserved.
//

#import "UIBarButtonItem+GLBarButtonItem.h"

@implementation UIBarButtonItem (GLBarButtonItem)
+(instancetype)initWithTitle:(NSString*)title titleColor:(UIColor*)titleColor align:(UIControlContentHorizontalAlignment) align target:(id)target action:(SEL)action{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 200, 40);
    
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [btn setContentHorizontalAlignment:align];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    return barButtonItem;
}
@end
