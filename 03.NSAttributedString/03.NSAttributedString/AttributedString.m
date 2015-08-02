//
//  AttributedString.m
//  03.NSAttributedString
//
//  Created by gool on 15/8/2.
//  Copyright (c) 2015年 mac os. All rights reserved.
//

#import "AttributedString.h"

@implementation AttributedString

+(AttributedString *)attributedStringWithName:(NSString *)name value:(id)value rang:(NSRange)rang{
    AttributedString *attributedString =  [[self class]new];
    attributedString.name = name;
    attributedString.value = value;
    attributedString.rang = rang;
    return  attributedString;
}

@end
