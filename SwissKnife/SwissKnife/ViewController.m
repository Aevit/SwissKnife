//
//  ViewController.m
//  SwissKnife
//
//  Created by Aevit on 16/9/4.
//  Copyright © 2016年 Aevit. All rights reserved.
//

#import "ViewController.h"
#import "SwissKnifeView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = rgba(37, 50, 56, 1);
    
    SwissKnifeView *aView = [[SwissKnifeView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 500)];
    aView.center = self.view.center;
    [self.view addSubview:aView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
