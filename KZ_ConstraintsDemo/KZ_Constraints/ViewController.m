//
//  ViewController.m
//  KZ_Constraints
//
//  Created by Kieron Zhang on 2017/5/8.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import "ViewController.h"
#import "ConstraintViewController.h"
#import "MasonryViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"XIB";
    
    UIBarButtonItem *constraintButton = [[UIBarButtonItem alloc] initWithTitle:@"Constraint" style:UIBarButtonItemStylePlain target:self action:@selector(constraintTapped)];
    UIBarButtonItem *masonryButton = [[UIBarButtonItem alloc] initWithTitle:@"Masonry" style:UIBarButtonItemStylePlain target:self action:@selector(masonryTapped)];
    self.navigationItem.leftBarButtonItem = constraintButton;
    self.navigationItem.rightBarButtonItem = masonryButton;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, CGRectGetHeight(self.view.bounds) - 100, CGRectGetWidth(self.view.bounds), 100);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)constraintTapped {
    ConstraintViewController *constraintViewController = [[ConstraintViewController alloc] init];
    [self.navigationController pushViewController:constraintViewController animated:YES];
}

- (void)buttonTapped {
    backgroundView1.frame = CGRectMake(0, 100, CGRectGetWidth(self.view.bounds), 200);
}

- (void)masonryTapped {
    MasonryViewController *masonryViewController = [[MasonryViewController alloc] init];
    [self.navigationController pushViewController:masonryViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
