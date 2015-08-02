//
//  FontAttibuted.m
//  03.NSAttributedString
//
//  Created by gool on 15/8/2.
//  Copyright (c) 2015年 mac os. All rights reserved.
//

#import "FontAttibuted.h"

@implementation FontAttibuted
+(instancetype)attributed:(UIFont*)font rang:(NSRange)rang{
    return [FontAttibuted attributedStringWithName:NSFontAttributeName
                                             value:font
                                              rang:rang];
}
@end
