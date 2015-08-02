//
//  NSString+AttributedString.m
//  03.NSAttributedString
//
//  Created by gool on 15/8/2.
//  Copyright (c) 2015年 mac os. All rights reserved.
//

#import "NSString+AttributedString.h"

@implementation NSString (AttributedString)

-(NSMutableAttributedString*) createAttributedString{
    return [[NSMutableAttributedString alloc]initWithString:self];
}
-(NSMutableAttributedString*) createAttributedStringWithStyles:(NSArray *)styles{
    NSMutableAttributedString *attributedString = [self createAttributedString];
    for (AttributedString *attributed in styles) {
        [attributedString addAttribute:attributed.name value:attributed.value range:attributed.rang];
    }
    return attributedString;
}
@end
