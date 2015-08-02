//
//  AttributedString.h
//  03.NSAttributedString
//
//  Created by gool on 15/8/2.
//  Copyright (c) 2015年 mac os. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AttributedString : NSObject
    @property(nonatomic,copy) NSString *name;
    @property(nonatomic,strong) id value;
    @property(nonatomic,assign) NSRange rang;
+(instancetype) attributedStringWithName:(NSString*) name value:(id)value rang:(NSRange)rang;
@end
