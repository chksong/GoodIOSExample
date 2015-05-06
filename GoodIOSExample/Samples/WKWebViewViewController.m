//
//  WKWebViewViewController.m
//  GoodIOSExample
//
//  Created by chksong on 15-5-6.
//  Copyright (c) 2015年 chksong company. All rights reserved.
//

#import "WKWebViewViewController.h"
#import <WebKit/WebKit.h>
#import <SVProgressHUD.h>

@interface WKWebViewViewController ()<WKNavigationDelegate>

@property (nonatomic ,strong)  CADisplayLink *link  ;
@property (nonatomic, strong)  WKWebView *webView;


@end

@implementation WKWebViewViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.webView =  [[WKWebView alloc] initWithFrame:self.view.bounds];
    self.webView.navigationDelegate = self ;
    //   self.webView.UIDelegate = self ;
    
    [self.view addSubview:self.webView];
    
    //    NSURL *url = [NSURL URLWithString:@"http://www.bing.com"];
    //    NSURLRequest *request = [NSURLRequest requestWithURL:url ];
    //    [self.webView loadRequest:request] ;
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
    
    //    _webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    //    _webView.UIDelegate = self;
    //    _webView.navigationDelegate = self;
    //    [self.view addSubview:_webView];
    //
    //    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
    
    
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

-(void) viewDidAppear:(BOOL)animated {
    NSLog(@"viewDidAppear .....") ;
    
    [super viewDidAppear:animated ] ;
    
    //    NSURL *url = [[NSURL alloc] initWithString:@"http://www.bing.com"];
    //    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url ];
    //    [self.webView loadRequest:request];
}

-(void) viewWillAppear:(BOOL)animated {
    NSLog(@"viewWillAppear .....") ;
    
    [super viewWillAppear:animated] ;
    
    self.link = [CADisplayLink displayLinkWithTarget:self selector:(@selector(update:))] ;
    [self.link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes] ;
    
    [self update:nil];
}

-(void) viewWillLayoutSubviews {
    NSLog(@"viewWillLayoutSubviews .....") ;
    self.webView.frame = self.view.bounds ;
}

-(void)update:(CADisplayLink*)alinks {
    if ([self.webView isLoading]) {
        [SVProgressHUD showProgress:self.webView.estimatedProgress status:@"正在加载..."] ;
    }
    
}


-(void) viewWillDisappear:(BOOL)animated {
    NSLog(@"viewWillDisappear .....") ;
    
    [super viewWillDisappear:animated ];
    [self.link invalidate];
    self.link = nil ;
    
    if ( [self.webView isLoading]) {
        [self.webView stopLoading]  ;
    }
    
    [SVProgressHUD dismiss];
}


-(void) viewDidDisappear:(BOOL)animated {
    NSLog(@"viewDidDisappear .....") ;
    
    [super viewDidDisappear:animated] ;
    
    self.webView.navigationDelegate = nil ;
}

// =============================================================================
#pragma mark - WKNavigationDelegate

#pragma mark - WKNavigationDelegate

/**
 *  页面开始加载时调用
 *
 *  @param webView    实现该代理的webview
 *  @param navigation 当前navigation
 */
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    
    NSLog(@"%s", __FUNCTION__);
}

/**
 *  当内容开始返回时调用
 *
 *  @param webView    实现该代理的webview
 *  @param navigation 当前navigation
 */
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    
    NSLog(@"%s", __FUNCTION__);
}

/**
 *  页面加载完成之后调用
 *
 *  @param webView    实现该代理的webview
 *  @param navigation 当前navigation
 */
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
    [SVProgressHUD showSuccessWithStatus:@"DONE!"];
    
    NSLog(@"%s", __FUNCTION__);
}

/**
 *  加载失败时调用
 *
 *  @param webView    实现该代理的webview
 *  @param navigation 当前navigation
 *  @param error      错误
 */
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    
    NSLog(@"%s", __FUNCTION__);
}

/**
 *  接收到服务器跳转请求之后调用
 *
 *  @param webView      实现该代理的webview
 *  @param navigation   当前navigation
 */
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation {
    
    NSLog(@"%s", __FUNCTION__);
}

/**
 *  在收到响应后，决定是否跳转
 *
 *  @param webView            实现该代理的webview
 *  @param navigationResponse 当前navigation
 *  @param decisionHandler    是否跳转block
 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
    
    // 如果响应的地址是百度，则允许跳转
    if ([navigationResponse.response.URL.host.lowercaseString isEqual:@"www.baidu.com"]) {
        
        // 允许跳转
        decisionHandler(WKNavigationResponsePolicyAllow);
        return;
    }
    // 不允许跳转
    decisionHandler(WKNavigationResponsePolicyCancel);
}

/**
 *  在发送请求之前，决定是否跳转
 *
 *  @param webView          实现该代理的webview
 *  @param navigationAction 当前navigation
 *  @param decisionHandler  是否调转block
 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    // 如果请求的是百度地址，则延迟5s以后跳转
    if ([navigationAction.request.URL.host.lowercaseString isEqual:@"www.baidu.com"]) {
        
        //        // 延迟5s之后跳转
        //        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //
        //            // 允许跳转
        //            decisionHandler(WKNavigationActionPolicyAllow);
        //        });
        
        // 允许跳转
        decisionHandler(WKNavigationActionPolicyAllow);
        return;
    }
    // 不允许跳转
    decisionHandler(WKNavigationActionPolicyCancel);
}

@end
