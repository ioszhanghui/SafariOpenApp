//
//  TestViewController.m
//  SafariOpenApp
//
//  Created by 小飞鸟 on 2019/05/10.
//  Copyright © 2019 小飞鸟. All rights reserved.
//

#import "TestViewController.h"
#import "UIViewController+GMURLRouter.h"
@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    NSLog(@"页面传递的参数%@",self.params);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
