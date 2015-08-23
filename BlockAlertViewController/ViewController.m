//
//  ViewController.m
//  BlockAlertViewController
//
//  Created by apple on 8/23/15.
//  Copyright (c) 2015 jackyshan. All rights reserved.
//

#import "ViewController.h"
#import "BlockAlertView.h"

@interface ViewController () {
    BlockAlertView *_blockView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"BlockAlertView";
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(200, 200, 50, 30)];
    [btn setTitle:@"action" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(_showAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)_showAction {
    BlockAlertView *alertView = [[BlockAlertView alloc] initWithTitle:@"test"];
    [alertView addTitle:@"share" block:^(id result) {
        NSLog(@"share");
    }];
    [alertView addTitle:@"zan" block:^(id result) {
        NSLog(@"zan");
    }];
    [alertView addTitle:@"fun" block:^(id result) {
        NSLog(@"fun");
    }];
    
    [alertView showInView:self.view];
    _blockView = alertView;
}

@end
