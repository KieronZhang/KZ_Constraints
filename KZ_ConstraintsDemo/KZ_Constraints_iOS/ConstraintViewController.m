//
//  ConstraintViewController.m
//  KZ_Constraints_iOS
//
//  Created by Kieron Zhang on 2018/4/24.
//  Copyright © 2018年 Kieron Zhang. All rights reserved.
//

#import "ConstraintViewController.h"
#import <KZ_Constraints_iOS/KZ_Constraints.h>

@interface ConstraintViewController ()

@end

@implementation ConstraintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Constraint";
    
    backgroundView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.bounds), 100)];
    backgroundView1.backgroundColor = [UIColor greenColor];
    [self.view addSubview:backgroundView1];
    
    leftView = [[UIView alloc] initWithFrame:CGRectMake(20, 0, 100, 100)];
    leftView.backgroundColor = [UIColor yellowColor];
    [backgroundView1 addSubview:leftView];
    
    rightView = [[UIView alloc] initWithFrame:CGRectMake(150, 0, 150, 100)];
    rightView.backgroundColor = [UIColor blueColor];
    [backgroundView1 addSubview:rightView];
    
    [backgroundView1 kz_addConstraintsWithAttribute:KZ_LayoutAttribute_Left | KZ_LayoutAttribute_Right equalValue:@0];
    [backgroundView1 kz_addConstraintsWithAttribute:KZ_LayoutAttribute_Top equalValue:@100];
    [backgroundView1 kz_addConstraintsWithAttribute:KZ_LayoutAttribute_Height equalValue:@100];
    
    [leftView.kz_left addConstraintEqualTo:@20];
    [leftView.kz_width addConstraintEqualTo:@100];
    [@[leftView, rightView].kz_top.kz_bottom addConstraintEqualTo:backgroundView1];
    [rightView.kz_left addConstraintEqualTo:leftView.kz_right offset:@30];
    [rightView.kz_right addConstraintEqualTo:@(-75)];
    
    backgroundView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 250, CGRectGetWidth(self.view.bounds), 100)];
    backgroundView2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:backgroundView2];
    
    leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 20, 100, 60)];
    leftLabel.backgroundColor = [UIColor yellowColor];
    leftLabel.text = @"Label1";
    leftLabel.textAlignment = NSTextAlignmentCenter;
    [backgroundView2 addSubview:leftLabel];
    
    rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(245, 20, 100, 60)];
    rightLabel.backgroundColor = [UIColor blueColor];
    rightLabel.text = @"Label2";
    rightLabel.textAlignment = NSTextAlignmentCenter;
    [backgroundView2 addSubview:rightLabel];
    
    [backgroundView2 kz_addConstraintsUseFrameWithAttribute:KZ_LayoutAttribute_Left | KZ_LayoutAttribute_Right | KZ_LayoutAttribute_Top | KZ_LayoutAttribute_Height];
    
    [leftLabel.kz_left.kz_equalTo(30) binding];
    [leftLabel.kz_height.kz_equalTo(60) binding];
    [leftLabel.kz_centery.kz_equalTo(backgroundView2) binding];
    
    [rightLabel.kz_right.kz_equalTo(-30) binding];
    [rightLabel.kz_top.kz_bottom.kz_equalTo(leftLabel) binding];
    [@[leftLabel, rightLabel].kz_width.kz_equalTo(100) binding];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, CGRectGetHeight(self.view.bounds) - 100, CGRectGetWidth(self.view.bounds), 100);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [button.kz_left.kz_right.kz_bottom.kz_equalTo(0) binding];
    [button.kz_height.kz_equalTo(100) binding];
}

- (void)buttonTapped {
    [backgroundView1.kz_height.kz_equalTo(@200) binding];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
