//
//  NSString+AttributedString.h
//  03.NSAttributedString
//
//  Created by gool on 15/8/2.
//  Copyright (c) 2015年 mac os. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AttributedString.h"
#import "ColorAttibute.h"
#import "FontAttibuted.h"
@interface NSString (AttributedString)

-(NSMutableAttributedString*) createAttributedString;

-(NSMutableAttributedString*) createAttributedStringWithStyles:(NSArray*) styles;
@end
