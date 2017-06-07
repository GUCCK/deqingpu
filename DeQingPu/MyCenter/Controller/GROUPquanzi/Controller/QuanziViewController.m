//
//  QuanziViewController.m
//  DeQingPu
//
//  Created by apple on 17/6/6.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "QuanziViewController.h"
#import "DayLogViewController.h"
#import "GoodFriendViewController.h"
#import "AttentionViewController.h"
#import "UIBarButtonItem+Item.h"

@interface QuanziViewController () <UIScrollViewDelegate>
/**
 *  存放标题按钮的view
 */
@property (nonatomic, weak) UIView *titlesView;
/**
 *  上一次点击的按钮
 */
@property (nonatomic, weak) UIButton *previousClickedTitleButton;
/**
 *  标题下划线
 */
@property (nonatomic, weak) UIView *titlesUnderline;
/**
 *  用来存放所有子控制器view的ScrollView
 */
@property (nonatomic, weak) UIScrollView *scrollView;
@end

@implementation QuanziViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setCustomerTitle:@"圈子"];
    // 初始化所有的子控制器
    [self setupAllChildVcs];
    
    // 设置导航条
    [self setupNavBar];
    
    // 设置scrollView
    [self setupScrollView];
    
    // 设置标题栏
    [self setupTitlesView];
    
    // 默认添加第0个子控制器的view
    [self addChildVcViewIntoScroll:0];
    
}
/**
 *  初始化所有的子控制器
 */
- (void)setupAllChildVcs
{
    [self addChildViewController:[[DayLogViewController alloc] init]];
    [self addChildViewController:[[GoodFriendViewController alloc] init]];
    [self addChildViewController:[[AttentionViewController alloc] init]];

}

/**
 *  设置scrollView
 */
- (void)setupScrollView
{
    // 不允许自动调整UIScrollView的内边距
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    scrollView.scrollsToTop = NO;
    self.scrollView = scrollView;
    [self.view addSubview:scrollView];
    
    // 重要:设置scrollView的内容大小
    scrollView.contentSize = CGSizeMake(5 * scrollView.width, 0);
    
}
/**
 *  设置标题栏
 */
- (void)setupTitlesView
{
    UIView *titlesView = [[UIView alloc] init];
    titlesView.frame = CGRectMake(0, 64, self.view.width, 50);
    // 设置透明度
    titlesView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    _titlesView = titlesView;
    // 设置标题按钮
    [self setupTitleButton];
    
    // 设置标题下划线
    [self setupUnderline];
    
    
    [self.view addSubview:titlesView];
}
/**
 *  设置标题按钮
 */
- (void)setupTitleButton
{
    NSArray *titles = @[@"日志", @"好友", @"关注"];
    // frame
    CGFloat titleButtonW = self.titlesView.width / 3;
    CGFloat titleButtonH = self.titlesView.height;
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"usertoken"];
    NSLog(@"token%@", token);
    
    for (int i = 0; i < titles.count; i++) {
        UIButton *titleButton = [[UIButton alloc] init];
        [self.titlesView addSubview:titleButton];
        titleButton.frame = CGRectMake(i * titleButtonW, 0, titleButtonW, titleButtonH);
        titleButton.tag = i;
        titleButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [titleButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [titleButton setTitle:titles[i] forState:UIControlStateNormal];
        [titleButton addTarget:self action:@selector(dealTitleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

/**
 *  处理标题按钮的点击
 */
- (void)dealTitleButtonClick:(UIButton *)titleButton
{
    
    // 按钮状态的改变
    _previousClickedTitleButton.selected = NO;
    titleButton.selected = YES;
    _previousClickedTitleButton = titleButton;
    
    // 索引
    NSUInteger index = titleButton.tag;
    
    // 标题下划线的移动
    [UIView animateWithDuration:0.3 animations:^{
        // 此方法已过期
        //        _titlesUnderline.jr_width = [titleButton.currentTitle sizeWithFont:titleButton.titleLabel.font].width;
        
        // 方法1
        //        _titlesUnderline.jr_width = [titleButton.currentTitle sizeWithAttributes:@{NSFontAttributeName : titleButton.titleLabel.font}].width;
        
        // 方法2
        _titlesUnderline.width = titleButton.width ;
        _titlesUnderline.centerX = titleButton.centerX;

        //        // 获取索引
        //        NSUInteger index = [self.titlesView.subviews indexOfObject:titleButton];
        //        // x偏移
        //        CGFloat offsetX = index * self.scrollView.jr_width;
        
        CGFloat offsetX = index * self.scrollView.width;
        
        // 点击标题按钮联动
        self.scrollView.contentOffset = CGPointMake(offsetX, self.scrollView.contentOffset.y);
    } completion:^(BOOL finished) {
        // 动画完成时调用(相对于懒加载)
        // 添加子控制器
        [self addChildVcViewIntoScroll:index];
    }];
    
    // 默认情况下几个scrollView只有一个scrollsToTop = YES,其他都scrollsToTop = NO的情况下才能点击状态栏回到最顶部.
    // 设置index位置对应的tableView.scrollsToTop = YES, 其他都设置为0
    for (NSUInteger i = 0; i < self.childViewControllers.count; i++) {
        UIViewController *childVc = self.childViewControllers[i];
        // 如果view还没有创建,就不用去处理
        if (!childVc.isViewLoaded) continue;
        
        UIScrollView *scrollView = (UIScrollView *)childVc.view;
        if (![scrollView isKindOfClass:[UIScrollView class]]) continue;
        scrollView.scrollsToTop = (i == index);
    }
}

/**
 *   设置标题下划线
 */
- (void)setupUnderline
{
    // 标题按钮
    UIButton *firstButton = self.titlesView.subviews.firstObject;
    // 下划线
    UIView *titleUndleline = [[UIView alloc] init];
    _titlesUnderline = titleUndleline;
    titleUndleline.height = 1;
    titleUndleline.y = _titlesView.height - titleUndleline.height;
    titleUndleline.backgroundColor = [firstButton titleColorForState:UIControlStateSelected];
    [self.titlesView addSubview:titleUndleline];
    
    
    // 一进入程序第一个按钮设置为选中状态
    // 按钮状态的改变
    firstButton.selected = YES;
    _previousClickedTitleButton = firstButton;
    // 默认点击最前面的按钮(自适应)
    [firstButton.titleLabel sizeToFit];
    _titlesUnderline.width = firstButton.width;
    _titlesUnderline.centerX = firstButton.centerX;
    
}
/**
 *  设置导航条
 */
- (void)setupNavBar
{
    
    // 把UIButton包装成UIBarButtonItem,就会导致按钮点击区域扩大
    // leftBarButtonItem
  //  self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"nav_item_game_icon"] highImage:[UIImage imageNamed:@"nav_item_game_click_icon"] target:self action:@selector(game)];
    
    // rightBarButtonItem
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"icon_125"] highImage:nil target:self action:@selector(Random)];
    
    // titleView
   // self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
}

- (void)Random
{

}

#pragma mark - UIScrollViewDelegate
/**
 *  当用户松开scrollView并且滑动结束时调用这个代理方法(scrollView停止滑动的时候)
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSUInteger index = scrollView.contentOffset.x / scrollView.width;
    // 点击对应的按钮
    UIButton *titleButton = self.titlesView.subviews[index];
    
    // 注意:这个方法只要tag为0就会返回它自己,会造成程序崩溃(一般不使用)
    // 会报reason: '-[UIView setSelected:]: unrecognized selector sent to instance 0x7fb39e076680'这个错,就是错误的将UIView当作按钮来使用
    //    JRTitleButton *titleButton = [self.titlesView viewWithTag:index];
    
    //    [self titlesButtonClick:titleButton];
    [self dealTitleButtonClick:titleButton];
    
    
}


#pragma mark - Other
/**
 *  增加子控制器的view到scrollView上
 */
- (void)addChildVcViewIntoScroll:(NSUInteger)index
{
    // 取出index位置的子控制器
    UIView *childVcView = self.childViewControllers[index].view;
    
    // 如果有值直接返回,不需要再添加view
    if (childVcView.superview) return;
    
    // 设置子控制器的frame
    CGFloat scrollViewW = self.scrollView.width;
    childVcView.frame = CGRectMake(index *  scrollViewW, 0, self.scrollView.width, self.scrollView.height);
    
    // 将子控制器的view添加到scrollView中
    [self.scrollView addSubview:childVcView];
    
}



@end
