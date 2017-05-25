//
//  ViewController.m
//  wjColorDemo
//
//  Created by gouzi on 2017/5/25.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"
#import "wjColorView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet wjColorView *wjColorView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)wjRedAction:(UISlider *)sender {
    self.wjColorView.wjRedTag = sender.value;
}


- (IBAction)wjGreenAction:(UISlider *)sender {
    self.wjColorView.wjGreenTag = sender.value;
}

- (IBAction)wjBlueAction:(UISlider *)sender {
    self.wjColorView.wjBlueTag = sender.value;
}



@end
