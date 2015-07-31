//
//  main.m
//  01.AFNetworking
//
//  Created by gool on 15/7/31.
//  Copyright (c) 2015年 mac os. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "AFNetworking.h"
void httpGet();
void httpPost();


int main(int argc, char * argv[]) {
    
    httpGet();
    
    httpPost();
    
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

void httpPost(){
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    //设置为http通用序列化 默认是JSON
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:@"http://www.baidu.com/" parameters:@"q=x"
        success:^(AFHTTPRequestOperation *operation, id responseObject) {
            //获取头部信息
            NSLog(@"headers:\r\n%@",operation.response.allHeaderFields);
            //获取body信息
            NSLog(@"body:\r\n%@",operation.responseString);
            
            NSLog(@"post success");
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            //获取头部信息
            NSLog(@"headers:\r\n%@",operation.response.allHeaderFields);
            //获取body信息
            NSLog(@"body:\r\n%@",operation.responseString);
            NSLog(@"post failure");
    }];
}

void httpGet(){
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    //设置为http通用序列化 默认是JSON
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:@"http://www.baidu.com" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //responeseObject 为NSData
        
        NSLog(@"success:\r\n%@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"failure:%@",error);
    }];
}
