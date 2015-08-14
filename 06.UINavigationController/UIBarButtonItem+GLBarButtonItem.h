//
//  UIBarButtonItem+GLBarButtonItem.h
//  06.UINavigationController
//
//  Created by gool on 15/8/14.
//  Copyright (c) 2015年 mac os. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (GLBarButtonItem)
+(instancetype)initWithTitle:(NSString*)title titleColor:(UIColor*)titleColor align:(UIControlContentHorizontalAlignment)align target:(id)target action:(SEL)action;
@end
