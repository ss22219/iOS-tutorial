//
//  ThreadSafeSingleFactory.m
//  04.SingleFactoryMode
//
//  Created by gool on 15/8/4.
//  Copyright (c) 2015年 mac os. All rights reserved.
//

#import "ThreadSafeSingleFactory.h"
static ThreadSafeSingleFactory *_singleObject;
@implementation ThreadSafeSingleFactory
+(instancetype)sharedObject{
    if (!_singleObject) {
        static dispatch_once_t once;
        dispatch_once(&once, ^{
            [ThreadSafeSingleFactory new];
        });
    }
    return _singleObject;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    if(!_singleObject)
    {
        static dispatch_once_t once;
        dispatch_once(&once, ^{
            _singleObject = [super allocWithZone:zone];
        });
        return _singleObject;
    }
    return  nil;
}
-(id)copy{
    return self;
}
@end
