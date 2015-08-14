//
//  ViewController.m
//  06.UINavigationController
//
//  Created by gool on 15/1/1.
//  Copyright (c) 2015年 mac os. All rights reserved.
//

#import "ViewController.h"
#import "GLViewController1.h"
#import "GLViewController2.h"
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:self];
    [navigationController setViewControllers:@[
                                               [GLViewController1 new]
                                               ]];
    
    UINavigationController*navigationController2 = [[UINavigationController alloc]initWithRootViewController:self];
    [navigationController2 setViewControllers:@[
                                               [GLViewController2 new]
                                               ]];
    
    [self addChildViewController:navigationController];
    
    [self addChildViewController:navigationController2];
    
    [self.view addSubview:navigationController.view];

//    [self transitionFromViewController:navigationController toViewController:navigationController2 duration:10 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
//    }  completion:^(BOOL finished) {
//        //......
//    }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
