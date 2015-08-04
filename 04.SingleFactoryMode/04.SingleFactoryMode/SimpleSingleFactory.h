//
//  SimpleSingleFactory.h
//  04.SingleFactoryMode
//
//  Created by gool on 15/8/4.
//  Copyright (c) 2015年 mac os. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SimpleSingleFactory : NSObject
+(instancetype) sharedSingle;
@end
