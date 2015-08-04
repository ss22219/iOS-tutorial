//
//  SimpleSingleFactory.m
//  04.SingleFactoryMode
//
//  Created by gool on 15/8/4.
//  Copyright (c) 2015年 mac os. All rights reserved.
//

#import "SimpleSingleFactory.h"

static SimpleSingleFactory *_singleObject;
@implementation SimpleSingleFactory

+(instancetype) sharedSingle{
    if(!_singleObject)
        _singleObject = [SimpleSingleFactory new];
    return _singleObject;
}
@end
