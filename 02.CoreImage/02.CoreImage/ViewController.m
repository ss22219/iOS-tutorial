//
//  ViewController.m
//  02.CoreImage
//
//  Created by gool on 15/8/1.
//  Copyright (c) 2015年 mac os. All rights reserved.
//

#import "ViewController.h"
#import <GLKit/GLKit.h>
@interface ViewController ()

@property(nonatomic,strong) CIFilter *filter;
@property(nonatomic,strong) GLKView *glkView;
@property(nonatomic,strong) CIContext *ciContext;
@property(nonatomic,strong) EAGLContext *eaglContext;
@property(nonatomic,strong) CIImage *ciImage;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self openGLESDraw];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark --简单的马赛克模糊
-(void)onceFilter{
    
    //使用UIImage 创建 CIImage
    CIImage *ciImg = [[CIImage alloc] initWithImage: [UIImage imageNamed:@"1"]];
    //iOS中内置了许多滤镜，可以通过名字来获取一个滤镜
    CIFilter *filter = [CIFilter filterWithName:@"CIPixellate"];
    
    //一个滤镜中包含一些参数，这些参数的名字可以通过kCI枚举获取
    
    //为滤镜设置 输入图Y片参数
    [filter setValue:ciImg forKey:kCIInputImageKey];
    
    //其他一些参数使用默认参数
    [filter setDefaults];
    
    //打印属性信息
    NSLog(@"%@",filter.attributes);
    
    //获取参数 输出的结果图片
    CIImage *outImage = [filter valueForKey:kCIOutputImageKey];
    
    //创建一个CoreImage上下文环境
    CIContext *ciContext = [CIContext contextWithOptions:nil];
    
    //使用当前上下文将输出结果转换成CGImage
    CGImageRef cgImage = [ciContext createCGImage:outImage fromRect:[outImage extent]];
    
    
    UIImage *outUIimage = [UIImage imageWithCGImage:cgImage];
    
    
    //释放Core Graphics Image
    CGImageRelease(cgImage);
    
    
    //显示
    UIImageView *showImageView = [[UIImageView alloc]initWithImage:outUIimage];
    
    showImageView.center = self.view.center;
    
    [self.view addSubview:showImageView];
}

#pragma mark --多个滤镜组合

-(void)multipelFilter{
    
    CIImage *ciImg = [[CIImage alloc]initWithImage:[UIImage imageNamed:@"1"]];
    
    CIFilter *filterOne = [CIFilter filterWithName:@"CIPixellate"];
    
    [filterOne setValue:ciImg forKey:kCIInputImageKey];
    [filterOne setDefaults];
    [filterOne setValue:@15 forKey:kCIInputScaleKey];
    NSLog(@"%@",filterOne.attributes);
    
    CIImage *outImage = [filterOne valueForKey:kCIOutputImageKey];
    
    CIFilter *filterTow = [CIFilter filterWithName:@"CIHueAdjust"];
    [filterTow setValue:outImage forKey:kCIInputImageKey];
    [filterTow setDefaults];
    NSLog(@"%@",filterTow.attributes);
    [filterTow setValue:@1.5f forKey:kCIInputAngleKey];
    
    outImage = [filterTow valueForKey:kCIOutputImageKey];
    
    CIContext *context = [CIContext contextWithOptions:nil];
    
    CGImageRef cgImg = [context createCGImage:outImage fromRect:[outImage extent]];
    
    UIImageView *iv = [[UIImageView alloc]initWithImage:[UIImage imageWithCGImage:cgImg]];
    
    CGImageRelease(cgImg);
    
    iv.center = self.view.center;
    [self.view addSubview:iv];
}

#pragma mark 使用OpenGLES渲染
-(void)openGLESDraw{
    
    //创建EAGL上下文
    _eaglContext = [[EAGLContext alloc]initWithAPI:kEAGLRenderingAPIOpenGLES2];
    
    //使用创建CoreImage上下文
    _ciContext = [CIContext contextWithEAGLContext:_eaglContext options:@{kCIContextWorkingColorSpace :[NSNull null]}];
    
    
    UIImage *image =  [UIImage imageNamed:@"1"];
    _ciImage = [[CIImage alloc]initWithImage: image];
    
    //将glkView大小设置为屏幕大小
    CGRect rect = [UIScreen mainScreen].bounds;


    //创建一个大小跟图片相等的glkView
    _glkView = [[GLKView alloc] initWithFrame:_ciImage.extent context:_eaglContext];
    NSLog(@"%@",NSStringFromCGRect(_ciImage.extent));
    [_glkView bindDrawable];
    
    _filter = [CIFilter filterWithName:@"CISepiaTone"];

    [_filter setValue:_ciImage forKey:kCIInputImageKey];
    [_filter setValue:@0 forKey:kCIInputIntensityKey];
    
    //在glkView可绘区域绘制结果图片
    [_ciContext drawImage:[_filter outputImage] inRect:CGRectMake(0, 0, _glkView.drawableWidth, _glkView.drawableHeight) fromRect:_ciImage.extent];
    
    _glkView.center = self.view.center;
    [self.view addSubview:_glkView];
    
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(0, rect.size.height - 50, rect.size.width, 20)];
    slider.minimumValue = 0.f;
    slider.maximumValue = 1.f;
    
    [slider addTarget:self action:@selector(didSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
    //呈现结果
    [_glkView display];
}

-(void)didSliderValueChanged:(UISlider*)slider{
    [_filter setValue:@(slider.value) forKey:kCIInputIntensityKey];
    [_ciContext drawImage:[_filter outputImage] inRect:CGRectMake(0, 0, _glkView.drawableWidth, _glkView.drawableHeight) fromRect:_ciImage.extent];
    [_glkView display];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
