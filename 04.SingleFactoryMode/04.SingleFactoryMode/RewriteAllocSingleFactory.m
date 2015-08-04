//
//  RewriteAllocSingleFactory.m
//  04.SingleFactoryMode
//
//  Created by gool on 15/8/4.
//  Copyright (c) 2015年 mac os. All rights reserved.
//

#import "RewriteAllocSingleFactory.h"
static RewriteAllocSingleFactory * _singleObject;
@implementation RewriteAllocSingleFactory
+(instancetype)sharedObject{
    if(!_singleObject){
        [RewriteAllocSingleFactory new];
    }
    return  _singleObject;
}

//重写alloc方法
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    
    if(!_singleObject){
       _singleObject = [super allocWithZone:zone];
        return _singleObject;
    }
    return  nil;
}
//重写copy方法
-(id)copyWithZone:(struct _NSZone *)zone{
    return self;
}
@end
