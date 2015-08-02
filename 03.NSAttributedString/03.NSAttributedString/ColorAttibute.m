
//
//  ColorAttibute.m
//  03.NSAttributedString
//
//  Created by gool on 15/8/2.
//  Copyright (c) 2015年 mac os. All rights reserved.
//

#import "ColorAttibute.h"

@implementation ColorAttibute

+(instancetype) arributed:(UIColor*)color rang:(NSRange)rang{
    return [ColorAttibute attributedStringWithName:NSForegroundColorAttributeName value:color rang:rang];
}

@end
