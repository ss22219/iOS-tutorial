//
//  ThreadSafeSingleFactory.h
//  04.SingleFactoryMode
//
//  Created by gool on 15/8/4.
//  Copyright (c) 2015年 mac os. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThreadSafeSingleFactory : NSObject
+(instancetype)sharedObject;
@end
