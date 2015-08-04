//
//  ViewController.m
//  04.SingleFactoryMode
//
//  Created by gool on 15/8/4.
//  Copyright (c) 2015年 mac os. All rights reserved.
//

#import "ViewController.h"
#import "SimpleSingleFactory.h"
#import "RewriteAllocSingleFactory.h"
#import "ThreadSafeSingleFactory.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",[SimpleSingleFactory sharedSingle]);
    
    NSLog(@"%@",[SimpleSingleFactory new]);
    
    
    NSLog(@"%@",[RewriteAllocSingleFactory sharedObject]);
    
    NSLog(@"%@",[RewriteAllocSingleFactory new]);
    
    NSLog(@"%@",[ThreadSafeSingleFactory sharedObject]);
    
    NSLog(@"%@",[ThreadSafeSingleFactory new]);
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
