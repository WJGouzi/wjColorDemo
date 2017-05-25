//
//  wjColorView.m
//  wjColorDemo
//
//  Created by gouzi on 2017/5/25.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjColorView.h"

@interface wjColorView ()

@property (nonatomic, strong) UIImageView *imageView;

@end


@implementation wjColorView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 2.0f;
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.bounds.size.width * 0.5;
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self addGestureRecognizer:tap];
}

- (UIColor *)tapAction:(UITapGestureRecognizer *)tap {
    if (tap.state == UIGestureRecognizerStateEnded) {
        
        UIColor *color = [UIColor colorWithRed:self.wjRedTag green:self.wjGreenTag blue:self.wjBlueTag alpha:1.0f];
        NSLog(@"color is : %@", color);
        return color;
    }
    return nil;
}


- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.frame = self.bounds;
        [self addSubview:_imageView];
    }
    return _imageView;
}

- (void)setWjRedTag:(CGFloat)wjRedTag {
    _wjRedTag = wjRedTag;
    [self setNeedsDisplay];
}

- (void)setWjGreenTag:(CGFloat)wjGreenTag {
    _wjGreenTag = wjGreenTag;
    [self setNeedsDisplay];
}

- (void)setWjBlueTag:(CGFloat)wjBlueTag {
    _wjBlueTag = wjBlueTag;
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect {
    
    // 开启位图上下文
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
    // 开启上下文
    CGContextRef ref = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    UIColor *color = [UIColor colorWithRed:self.wjRedTag green:self.wjGreenTag blue:self.wjBlueTag alpha:1.0f];
    CGContextSetFillColorWithColor(ref, color.CGColor);
    // 渲染上下文
    CGContextFillRect(ref, rect);
    // 从上下文中获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    self.imageView.image = image;

}


@end
