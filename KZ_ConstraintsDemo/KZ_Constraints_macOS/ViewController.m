//
//  ViewController.m
//  KZ_Constraints_macOS
//
//  Created by Kieron Zhang on 2018/4/24.
//  Copyright © 2018年 Kieron Zhang. All rights reserved.
//

#import "ViewController.h"
#import <KZ_Constraints_macOS/KZ_Constraints.h>

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    backgroundView1 = [[NSView alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.bounds), 100)];
    backgroundView1.wantsLayer = YES;
    backgroundView1.layer.backgroundColor = [NSColor greenColor].CGColor;
    [self.view addSubview:backgroundView1];
    
    leftView = [[NSView alloc] initWithFrame:CGRectMake(20, 0, 100, 100)];
    leftView.wantsLayer = YES;
    leftView.layer.backgroundColor = [NSColor yellowColor].CGColor;
    [backgroundView1 addSubview:leftView];
    
    rightView = [[NSView alloc] initWithFrame:CGRectMake(150, 0, 150, 100)];
    rightView.wantsLayer = YES;
    rightView.layer.backgroundColor = [NSColor blueColor].CGColor;
    [backgroundView1 addSubview:rightView];
    
    [backgroundView1 addConstraintsWithAttribute:KZ_LayoutAttribute_Left | KZ_LayoutAttribute_Right equalValue:@0];
    [backgroundView1 addConstraintsWithAttribute:KZ_LayoutAttribute_Top equalValue:@100];
    [backgroundView1 addConstraintsWithAttribute:KZ_LayoutAttribute_Height equalValue:@100];
    
    [leftView.kz_left addConstraintEqualTo:@20];
    [leftView.kz_width addConstraintEqualTo:@100];
    [@[leftView, rightView].kz_top.kz_bottom addConstraintEqualTo:backgroundView1];
    [rightView.kz_left addConstraintEqualTo:leftView.kz_right offset:@30];
    [rightView.kz_right addConstraintEqualTo:@(-75)];
    
    backgroundView2 = [[NSView alloc] initWithFrame:CGRectMake(0, 250, CGRectGetWidth(self.view.bounds), 100)];
    backgroundView2.wantsLayer = YES;
    backgroundView2.layer.backgroundColor = [NSColor greenColor].CGColor;
    [self.view addSubview:backgroundView2];
    
    leftTextField = [[NSTextField alloc] initWithFrame:CGRectMake(30, 20, 100, 60)];
    leftTextField.wantsLayer = YES;
    leftTextField.layer.backgroundColor = [NSColor yellowColor].CGColor;
    leftTextField.enabled = NO;
    [backgroundView2 addSubview:leftTextField];
    
    rightTextField = [[NSTextField alloc] initWithFrame:CGRectMake(245, 20, 100, 60)];
    rightTextField.wantsLayer = YES;
    rightTextField.layer.backgroundColor = [NSColor blueColor].CGColor;
    [backgroundView2 addSubview:rightTextField];
    
    [backgroundView2 addConstraintsUseFrameWithAttribute:KZ_LayoutAttribute_Left | KZ_LayoutAttribute_Right | KZ_LayoutAttribute_Top | KZ_LayoutAttribute_Height];
    
    [leftTextField.kz_left.kz_equalTo(30) binding];
    [leftTextField.kz_height.kz_equalTo(60) binding];
    [leftTextField.kz_centery.kz_equalTo(backgroundView2) binding];
    
    [rightTextField.kz_right.kz_equalTo(-30) binding];
    [rightTextField.kz_top.kz_bottom.kz_equalTo(leftTextField) binding];
    [@[leftTextField, rightTextField].kz_width.kz_equalTo(100) binding];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}

@end
