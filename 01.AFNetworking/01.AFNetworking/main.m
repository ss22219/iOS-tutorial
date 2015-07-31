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

void JSONParse();

void UploadFile();

int main(int argc, char * argv[]) {
    
    httpGet();
    
    httpPost();
    
    JSONParse();
    
    UploadFile();
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

#pragma mark --简单请求
void httpPost(){
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    //设置为http通用序列化 默认是JSON
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //post数据
    NSDictionary *postData = @{@"param1":@"1",@"param2":@"2"};
    
    [manager POST:@"http://www.baidu.com/" parameters:postData
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


#pragma mark --JSON
void JSONParse(){
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    //设置为http通用序列化 默认是JSON
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager GET:@"http://api.openweathermap.org/data/2.5/weather?q=London,uk" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //responeseObject 为NSData
        
        NSLog(@"success:\r\n%@", responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"failure:%@",error);
    }];
    
}

#pragma mark --上传文件
void UploadFile(){
    
    UIImage *img = [UIImage imageNamed:@"img"];
    //uiimg to data
    NSData *imgData = UIImageJPEGRepresentation(img, 1.f);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //设置超时时间
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 10.f;
    [manager.responseSerializer didChangeValueForKey:@"timeoutInterval"];
    
    
    //获取异步请求操作 使用constructingBodyWithBlock之后，会将上传方式改成多个方式 multipart/form-data
    AFHTTPRequestOperation *operation = [manager POST:@"http://www.baidu.com/"
                                           parameters: @{@"param1":@"1"}
                            constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                                
                                [formData appendPartWithFileData:imgData name:@"uploadImg" fileName:@"img.jpg" mimeType:@""];
                                
                                //支持多个文件上传
//                                [formData appendPartWithFileData:imgData name:@"uploadImg" fileName:@"img.jpg" mimeType:@""];
                                                }
                                              success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                                  
                                                  NSLog(@"headers:\r\n%@",operation.request.allHTTPHeaderFields);
                                                  
                                                  NSLog(@"success");
                                              } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                  NSLog(@"headers:\r\n%@",operation.request.allHTTPHeaderFields);
                                                  
                                                  NSLog(@"failure:%@", error);
                                              }];
    
    //设置无缓存
    [operation setCacheResponseBlock:nil];
}
