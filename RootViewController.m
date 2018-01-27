

//
//  RootViewController.m
//  ZIPImageDemo
//
//  Created by liucai on 2018/1/26.
//  Copyright © 2018年 liucai. All rights reserved.
//

#import "RootViewController.h"
#import "Push1ViewController.h"
#import "HomeModel.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [self.navigationController.navigationBar setHidden:YES];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    [self.navigationController.navigationBar setHidden:NO];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.title = @"root";
    
    UIButton *centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    centerBtn.frame = CGRectMake(0, 0, 100, 100);
    centerBtn.center = self.view.center;
    centerBtn.backgroundColor = [UIColor cyanColor];
    [centerBtn addTarget:self action:@selector(centerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:centerBtn];
    
    //创建一系列的Model
    NSMutableArray *oldArr = [NSMutableArray array];
    NSArray *newArr = [NSArray array];
    
    //一个个创建 确保model完全相同
    HomeModel *model1 = [[HomeModel alloc] init];
    model1.ID = @(1);
    model1.name = @"小明";
    
    HomeModel *model2 = [[HomeModel alloc] init];
    model2.ID = @(2);
    model2.name = @"小红";
    
    //新开辟内存地址 存储的数据为model1的数据
    HomeModel *model3 = [[HomeModel alloc] init];
    model3.ID = model1.ID;
    model3.name = model1.name;
    
    [oldArr addObject:model1];
    [oldArr addObject:model2];
    [oldArr addObject:model3];
    
    //添加重复的模型
    [oldArr addObject:model2];
    [oldArr addObject:model2];
    
    //去重操作
    NSSet *tempSet = [NSSet setWithArray:oldArr.copy];
    newArr = [tempSet allObjects];
//    查看去重结果
    for (HomeModel *model in newArr) {
        NSLog(@"%@\n",model.ID);
    }
    
    NSLog(@"-------------------------------------------");
    
    //创建两个数据相同的不同模型
    HomeModel *model4 = [[HomeModel alloc] init];
    model4.ID = @(1);
    model4.name = @"小花";

    HomeModel *model5 = [[HomeModel alloc] init];
    model5.ID = model4.ID;
    model5.name = model4.name;
    
    NSLog(@"[model4 isEqual:model5] == %@",[model4 isEqual:model5] ? @"YES" : @"NO");
    NSMutableSet *set3 = [NSMutableSet set];
    [set3 addObject:model4];
    [set3 addObject:model5];
    NSLog(@"------%li",set3.count);

}

- (void)centerBtnClick:(UIButton *)sender {
    Push1ViewController *push1VC = [[Push1ViewController alloc] init];
    [self.navigationController pushViewController:push1VC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
