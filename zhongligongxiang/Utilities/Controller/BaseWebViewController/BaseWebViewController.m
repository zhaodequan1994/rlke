//
//  BaseWebViewController.m
//  zhongligongxiang
//
//  Created by zhaodq on 2018/12/4.
//  Copyright © 2018 zhaodq. All rights reserved.
//

#import "BaseWebViewController.h"


@interface BaseWebViewController ()<UIWebViewDelegate>

@property (nonatomic,strong) UIWebView * webView;

@end

@implementation BaseWebViewController

-(UIWebView *)webView{
    
    if(!_webView){
        
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _webView.delegate = self;
        _webView.scrollView.scrollEnabled = YES;
        _webView.scrollView.bounces = NO;
        _webView.opaque = NO;
        _webView.backgroundColor = [UIColor whiteColor];
    }
    
    return _webView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeAppearance];
    [self initializeDataSource];
    
}

-(void)initializeAppearance{
    
    [self.view addSubview:self.webView];
    
    
}
-(void)initializeDataSource{
    
    self.title = self.titleStr;
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.UrlStr]]];
    
}


#pragma mark  *********** webView delegate  ************

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    [self startActivityView];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [self stopActivityView];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
    [self stopActivityView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
