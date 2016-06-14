//
//  CXRSplitController.m
//  Chat
//
//  Created by lanou3g on 16/6/12.
//  Copyright © 2016年 Terry. All rights reserved.
//

#import "CXRSplitController.h"
#import "RootViewController.h"
#import "ChatViewController.h"
#import "ContactViewController.h"
#import "DynamicViewController.h"

@interface CXRSplitController ()

@property(strong, nonatomic)UITabBarController *tabBarController;

@end

@implementation CXRSplitController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //新建一个tabBarController
    UITabBarController * tabBarController = [[UITabBarController alloc] init];
    //将tabBarController交给 CXRSplitController 进行管理
    [self addChildViewController:tabBarController];
    [self.view addSubview:tabBarController.view];
    
    self.tabBarController = tabBarController;
    
//    [tabBarController.tabBar setBackgroundImage:[UIImage imageNamed:@""]];
    //给tabBarController 添加三个viewController
    ChatViewController * chatController = [[ChatViewController alloc] init];
    [self setItemImageWithController:chatController image:@"" selectImage:@"" title:@"消息"];
    
    ContactViewController * messageController = [[ContactViewController alloc] init];
    [self setItemImageWithController:messageController image:@"" selectImage:@"" title:@"好友"];
    
    DynamicViewController *dynamicController = [[DynamicViewController alloc] init];
    [self setItemImageWithController:dynamicController image:@"" selectImage:@"" title:@"动态"];
    
    /**
     *  在这里，我们给tabBarController 添加拖动手势
     *
     *  @return
     */
    
    UIPanGestureRecognizer * panRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
    //添加手势到 tabBarController.view
    [tabBarController.view addGestureRecognizer:panRecognizer];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 *  手势回调方法
 *
 *  @return
 */

- (void)handlePan:(UIPanGestureRecognizer *)recognizer {
    
    CGPoint point = [recognizer translationInView:self.tabBarController.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + point.x, recognizer.view.center.y);
    CGFloat viewX = recognizer.view.frame.origin.x;
    CGFloat viewY = recognizer.view.frame.origin.y;
    
    
    if (viewX <= 0) {
        
        recognizer.view.frame = CGRectMake(0, viewY, recognizer.view.frame.size.width, recognizer.view.frame.size.height);
    }else if (viewX >= self.view.frame.size.width * 0.8) {
        
        recognizer.view.frame = CGRectMake(self.view.frame.size.width * 0.8, viewY, recognizer.view.frame.size.width, recognizer.view.frame.size.height);
    }else {
        recognizer.view.frame = CGRectMake(viewX + point.x, viewY, recognizer.view.frame.size.width, recognizer.view.frame.size.height);
        
    }
    
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        
        
        if (viewX < 120) {
            [UIView animateWithDuration:0.5 animations:^{
                recognizer.view.frame = CGRectMake(0, viewY, recognizer.view.frame.size.width, recognizer.view.frame.size.height);
            }];
            
        }
        if (viewX > 120) {
            [UIView animateWithDuration:0.5 animations:^{
                recognizer.view.frame = CGRectMake(self.view.frame.size.width * 0.8, viewY, recognizer.view.frame.size.width, recognizer.view.frame.size.height);
            }];
        }
    }
    
    
    [recognizer setTranslation:CGPointZero inView:self.tabBarController.view];
}


/**
 *  设置tabBar的样式
 *
 *  @param viewCotroller 添加模块的ViewController
 *  @param image         设置平常样式图片
 *  @param selectImage   设置显示样式图片
 *  @param title         设置标题名称
 */
- (void)setItemImageWithController:(UIViewController *)viewCotroller image:(NSString *)image selectImage:(NSString *)selectImage title:(NSString *)title {
    
    viewCotroller.title = title;
    

    viewCotroller.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    viewCotroller.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
#pragma mark - 把 UINavigationController 添加到TabBarController 进行管理
    
    UINavigationController * navController = [[UINavigationController alloc]initWithRootViewController:viewCotroller];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"ceshi" style:UIBarButtonItemStylePlain target:self action:@selector( clickHeadImage:)];
    viewCotroller.navigationItem.leftBarButtonItem = leftButton;
    navController.navigationBar.translucent = NO;
    navController.title = title;
    
    [self.tabBarController addChildViewController:navController];
}


- (void)clickHeadImage:(UIBarButtonItem *)sender {
    NSLog(@"左滑个人中心");
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
