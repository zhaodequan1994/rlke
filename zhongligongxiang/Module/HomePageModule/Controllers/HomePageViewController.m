//
//  HomePageViewController.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/10.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "HomePageViewController.h"

//Views
#import "CursorView.h"

//Controllers
#import "ShareInfoViewController.h"
#import "SharePeopleViewController.h"
#import "ShareAvtivityViewController.h"

//Controllers
#import "LoginViewController.h"

@interface HomePageViewController ()

@property (nonatomic, strong) MenuPageScrollView *navSliderBar;
@property (nonatomic, strong) NSArray *pagesArray;
@property (nonatomic, strong) NSMutableArray *controllersArray;

@end

@implementation HomePageViewController

- (MenuPageScrollView *)navSliderBar {
    if (!_navSliderBar) {
        _navSliderBar = [[MenuPageScrollView alloc]initWithParentController:self MenusPages:self.controllersArray];
        _navSliderBar.menuPageControllers = self.controllersArray;
        [self.view addSubview:_navSliderBar];
        [_navSliderBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.view);
            make.width.equalTo(self.view);
            make.height.mas_equalTo(40);
            make.top.equalTo(self.view).offset(20);
        }];
        MASAttachKeys(_navSliderBar);
    }
    return _navSliderBar;
}

- (NSArray *)pagesArray {
    if (!_pagesArray) {
        _pagesArray = [NSArray arrayWithObjects:@"主页",@"推荐",@"资讯", nil];
    }
    return _pagesArray;
}

- (NSMutableArray *)controllersArray{
    
    if (!_controllersArray) {
        
        SharePeopleViewController * sharePeopleViewController = [[SharePeopleViewController alloc] init];
        ShareAvtivityViewController * sharesAvtivityViewController = [[ShareAvtivityViewController alloc] init];
        ShareInfoViewController * shareInfoViewController = [[ShareInfoViewController alloc] init];
        
        _controllersArray = [[NSMutableArray alloc] init];
        [_controllersArray addObject:sharePeopleViewController];
        [_controllersArray addObject:sharesAvtivityViewController];
        [_controllersArray addObject:shareInfoViewController];
        
    }
    return _controllersArray;
}


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    if (self.tabBarController.tabBar.hidden) {
        self.tabBarController.tabBar.hidden = NO;
    }
    
    self.navigationController.navigationBar.hidden = YES;
    
}
-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNavSliderBar];
    [self initializeBaseNavigationAppearance];
    [self initializeAppearance];
    [self initializeDataSource];
    
}

-(void)setUpNavSliderBar {
    
    self.navSliderBar.pageMenus = self.pagesArray;
    
    [self.navSliderBar updateSelectedPage];
    
    
}
-(void)initializeBaseNavigationAppearance{
    
    
}

-(void)initializeAppearance{
    
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)initializeDataSource{
    
}

-(void)btnClick{
    
    self.hidesBottomBarWhenPushed = YES;
    
    LoginViewController * lvc = [[LoginViewController alloc] init];
    
    [self.navigationController pushViewController:lvc animated:YES];
    
    self.hidesBottomBarWhenPushed = NO;

}
@end
