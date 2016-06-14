//
//  RootViewController.m
//  Chat2
//
//  Created by lanou3g on 16/6/13.
//  Copyright © 2016年 Terry. All rights reserved.
//

#import "RootViewController.h"
#import "ChatTableViewController.h"
#import "ContactTableViewController.h"
#import "DynamicTableViewController.h"
#import "CustomTabBar.h"
#import "UIImage+ImageContentViewColor.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //主题颜色
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageWithColor:[UIColor cyanColor]] forBarMetrics:UIBarMetricsDefault];
    [[UITabBar appearance] setBackgroundImage:[UIImage imageWithColor:[UIColor cyanColor]]];
    
    
    
    [self setTabBarItemTextAttribute];
    [self createChildViewControllers];
    [self setCustomTabBar];
    
    
    
}






#pragma 设置tabBar文本的标题颜色
- (void)setTabBarItemTextAttribute {
    //普通状态下的文本颜色
    NSMutableDictionary *normalDic = [NSMutableDictionary dictionary];
    normalDic[NSForegroundColorAttributeName] = [UIColor whiteColor];
    
    //选中状态下
    NSMutableDictionary *selectedDic = [NSMutableDictionary dictionary];
    selectedDic[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    //配置文本属性
    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    [tabBarItem setTitleTextAttributes:normalDic forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:selectedDic forState:UIControlStateSelected];
    
}

#pragma 给UITabBarController添加子视图控制器
- (void)addOneChildViewController:(UIViewController *)viewController Title:(NSString *)title NormalImage:(NSString *)normalImage SelectImage:(NSString *)selectImage {
    //给子视图控制器的tabBarItem赋值
    viewController.tabBarItem.title = title;
    viewController.tabBarItem.image = [UIImage imageNamed:normalImage];
    UIImage *image = [UIImage imageNamed:selectImage];
    
    //设置渲染模式
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = image;
    
    [self addChildViewController:viewController];
}

#pragma 添加子视图控制器
- (void)createChildViewControllers {
    //消息页面
    ChatTableViewController *chatVC = [[ChatTableViewController alloc] initWithStyle:UITableViewStylePlain];
    [self addOneChildViewController:chatVC Title:@"消息" NormalImage:@"" SelectImage:@""];
    
    //联系人页面
    ContactTableViewController *contactVC = [[ContactTableViewController alloc] initWithStyle:UITableViewStylePlain];
    [self addOneChildViewController:contactVC Title:@"联系人" NormalImage:@"" SelectImage:@""];
    
    //动态页面
    DynamicTableViewController *dynamicVC = [[DynamicTableViewController alloc] initWithStyle:UITableViewStylePlain];
    [self addOneChildViewController:dynamicVC Title:@"动态" NormalImage:@"" SelectImage:@""];
}

#pragma 获取自定义tabBar
- (void)setCustomTabBar {
    [self setValue:[[CustomTabBar alloc] init] forKey:@"tabBar"];
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
