//
//  MasonryViewController.m
//  KZ_Constraints_iOS
//
//  Created by Kieron Zhang on 2018/4/24.
//  Copyright © 2018年 Kieron Zhang. All rights reserved.
//

#import "MasonryViewController.h"
#import "Masonry.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wimplicit-retain-self"

@interface MasonryViewController ()

@end

@implementation MasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Masonry";
    
    backgroundView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.bounds), 100)];
    backgroundView1.backgroundColor = [UIColor greenColor];
    [self.view addSubview:backgroundView1];
    
    leftView = [[UIView alloc] initWithFrame:CGRectMake(20, 0, 100, 100)];
    leftView.backgroundColor = [UIColor yellowColor];
    [backgroundView1 addSubview:leftView];
    
    rightView = [[UIView alloc] initWithFrame:CGRectMake(150, 0, 150, 100)];
    rightView.backgroundColor = [UIColor blueColor];
    [backgroundView1 addSubview:rightView];
    
    [backgroundView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@0);
        make.right.mas_equalTo(@0);
        make.top.mas_equalTo(@100);
        make.height.mas_equalTo(@100);
    }];
    
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@20);
        make.top.mas_equalTo(@0);
        make.width.mas_equalTo(@100);
        make.height.mas_equalTo(backgroundView1.mas_height);
    }];
    
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(leftView.mas_right).mas_offset(@30);
        make.top.mas_equalTo(@0);
        make.right.mas_equalTo(@(-75));
        make.bottom.mas_equalTo(@0);
    }];
    
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
    
    centerView = [[UIView alloc] init];
    centerView.backgroundColor = [UIColor orangeColor];
    [backgroundView2 addSubview:centerView];
    
    [backgroundView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(@0);
        make.top.mas_equalTo(@250);
        make.height.mas_equalTo(@100);
    }];
    
    [leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@30);
        make.top.mas_equalTo(@20);
        make.bottom.mas_equalTo(@(-20));
        make.width.mas_equalTo(@100);
    }];
    
    [rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(@(-30));
        make.top.mas_equalTo(@20);
        make.bottom.mas_equalTo(@(-20));
        make.width.mas_equalTo(@100);
        make.baseline.mas_equalTo(leftLabel.mas_baseline);
    }];
    
    [centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(@50);
        make.center.mas_equalTo(backgroundView2);
    }];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, CGRectGetHeight(self.view.bounds) - 100, CGRectGetWidth(self.view.bounds), 100);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(@0);
        make.height.mas_equalTo(@100);
    }];
}

- (void)buttonTapped {
    [backgroundView1 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@200);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma clang diagnostic pop

@end
