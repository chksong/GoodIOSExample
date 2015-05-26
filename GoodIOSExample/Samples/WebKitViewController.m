//
//  WebKitViewController.m
//  GoodIOSExample
//
//  Created by chksong on 15-5-6.
//  Copyright (c) 2015年 chksong company. All rights reserved.
//

#import "WebKitViewController.h"
#import <SVProgressHUD.h>

@interface WebKitViewController ()<UIWebViewDelegate>

@property(nonatomic , strong) UIWebView *webView ;

@end

@implementation WebKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_webView];
    _webView.delegate = self ;
    
    
    
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"] ;
    NSURLRequest *request = [NSURLRequest requestWithURL:url] ;
    
    [self.webView loadRequest:request];
    
    [SVProgressHUD showWithStatus:@"Loading" maskType:SVProgressHUDMaskTypeGradient] ;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewDidDisappear:(BOOL)animated {
    NSLog(@"viewDidDisappear") ;
    
    [super viewDidDisappear:animated] ;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma maker  - UIWebViewDelegate
-(void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
    NSLog(@"%@" ,error) ;
    
    [SVProgressHUD dismiss] ;
}

-(void) webViewDidFinishLoad:(UIWebView *)webView {

    [SVProgressHUD dismiss] ;
}




@end
