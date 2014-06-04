//
//  ViewController.m
//  Blur
//
//  Created by Ben Dodson on 04/06/2014.
//  Copyright (c) 2014 Ben Dodson Apps. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
            

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(200, 200, 150, 150)];
    image.image = [UIImage imageNamed:@"Ben"];
    [self.view addSubview:image];
    
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:effect];
    blurView.frame = CGRectMake(0, 0, 300, 300);
    [self.view addSubview:blurView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
