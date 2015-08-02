//
//  ViewController.m
//  03.NSAttributedString
//
//  Created by gool on 15/8/2.
//  Copyright (c) 2015年 mac os. All rights reserved.
//

#import "ViewController.h"
#import <GONMarkupParser.h>
#import "NSString+AttributedString.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *uiLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.uiLabel.center = self.view.center;
    //支持多行
    self.uiLabel.numberOfLines = 0;
//    [self setLabelTextStyle];
//    [self setLabelLineAndParagraphStyle];
    [self myAttributedString];
//    [self useMarkupParser];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark --使用NSAttributedString为label设置字文字样式
-(void) setLabelTextStyle{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:@"hello gool!"];
    
    //将整个文本设置为绿色
    [attributedString addAttribute:NSForegroundColorAttributeName
                             value:[UIColor greenColor]
                             range:NSMakeRange(0, attributedString.length)];
    
    //将gool设置为红色
    [attributedString addAttribute:NSForegroundColorAttributeName
                             value:[UIColor redColor]
                             range:NSMakeRange(6, 4)];
    //设置gool的字体大小
    [attributedString addAttribute:NSFontAttributeName
                             value:[UIFont systemFontOfSize:32.f]
                             range:NSMakeRange(6,4)];
    
    self.uiLabel.attributedText = attributedString;
}

#pragma mark --使用NSAttributedString设置段落样式
-(void) setLabelLineAndParagraphStyle{
    //可变的行距样式对象
    NSMutableParagraphStyle *paragraphStyley = [[NSMutableParagraphStyle alloc]init];
    
    //文本换行间距
    paragraphStyley.lineSpacing      = 10.f;
    //文本段落的间距
    paragraphStyley.paragraphSpacing = 20.f;
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:@"Hello                                   Learning iOS\n03.NSAttributedString"];
    
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyley range:NSMakeRange(0, attributedString.length)];
    
    self.uiLabel.attributedText = attributedString;
}

#pragma mark --简易的封装NSAttributedString
-(void) myAttributedString{
    self.uiLabel.attributedText = [@"Gool" createAttributedStringWithStyles:\
                                           @[
                                             [FontAttibuted attributed:[UIFont systemFontOfSize:20] rang:NSMakeRange(0, 4)],
                                             [AttributedString attributedStringWithName:NSForegroundColorAttributeName value:[UIColor redColor] rang:NSMakeRange(0, 2)],
                                             [ColorAttibute arributed:[UIColor blueColor] rang:NSMakeRange(2, 2)]
                                           ]];
}

#pragma mark --使用开源的MarkupParser减少操作
-(void) useMarkupParser{
    NSMutableAttributedString *attributedString = [[GONMarkupParser defaultMarkupParser]
                                                   attributedStringFromString:\
                                                   @"<color value=\"blue\">i'm <font size=\"36\">gool<//><br/>just a coder"];
    self.uiLabel.attributedText                 = attributedString;
}
@end
