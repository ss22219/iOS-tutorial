//
//  FontAttibuted.h
//  03.NSAttributedString
//
//  Created by gool on 15/8/2.
//  Copyright (c) 2015年 mac os. All rights reserved.
//

#import "AttributedString.h"

@interface FontAttibuted : AttributedString
+(instancetype)attributed:(UIFont*)font rang:(NSRange)rang;
@end
