//
//  RootViewController.m
//  Chat
//
//  Created by lanou3g on 16/6/12.
//  Copyright © 2016年 Terry. All rights reserved.
//

#import "RootViewController.h"
#import "CXRSplitController.h"

@interface RootViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //新建一个菜单栏放在最底部，设置大小，这样就可以在拖动上层界面的时候，将底下的菜单栏漏出来
    UIView * menuView = [[UIView alloc] init];
    [self.view addSubview:menuView];
    menuView.frame = CGRectMake(0, 0, self.view.frame.size.width * 0.8, self.view.frame.size.height);
    //设置菜单栏的颜色为红色
    menuView.backgroundColor = [UIColor redColor];
    
    UITableView *personal = [[UITableView alloc] initWithFrame:CGRectMake(20, 250, self.view.frame.size.width * 0.8 - 140, self.view.frame.size.height - 340) style:UITableViewStylePlain];
    [menuView addSubview:personal];
    [personal registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
//    personal.scrollEnabled = YES;
    personal.delegate = self;
    personal.dataSource = self;
    
    CXRSplitController * splitViewController = [[CXRSplitController alloc] init];
    //将splitViewController的控制器和根视图都交由跟控制器进行管理
    [self addChildViewController:splitViewController];
    [self.view addSubview:splitViewController.view];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"测试数据";
    
    return cell;
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
