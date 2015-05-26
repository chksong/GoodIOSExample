//
//  SimpleAnimationViewController.m
//  GoodIOSExample
//
//  Created by chksong on 15/5/26.
//  Copyright (c) 2015年 chksong company. All rights reserved.
//

#import "SimpleAnimationViewController.h"

@interface SimpleAnimationViewController ()

@end

@implementation SimpleAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIView *redView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]] ;
    redView.backgroundColor = [UIColor redColor] ;
    [self.view insertSubview:redView atIndex:0 ];
    
    UIView *yellowView =[[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    yellowView.backgroundColor = [UIColor yellowColor] ;
    [self.view insertSubview:yellowView atIndex:0];
  
    
}
- (IBAction)changUIView:(id)sender {
    
    [UIView beginAnimations:@"animation" context:nil] ;
    [UIView setAnimationDuration:1.0f] ;
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut] ;
    [UIView setAnimationRepeatCount:1] ;
    
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES] ;
    [UIView commitAnimations] ;

}

//  交互子视图的 位置
- (IBAction)changUIVIewPos:(id)sender {
    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:1.0f] ;
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut] ;
    [UIView setAnimationRepeatCount:1] ;
    
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES] ;
    
    [self.view exchangeSubviewAtIndex:1 withSubviewAtIndex:0];
    [UIView commitAnimations];
    
}

- (IBAction)useCATransition:(id)sender {
    
    CATransition *transiton = [CATransition animation] ;
    transiton.duration = 2.0f ;
  // transiton.type = kCATransitionPush ;
 // 私有动画
    transiton.type = @"cube" ;
  //   transiton.type= @"suckEffect";
   // transiton.type.type = @"rippleEffect";
    //transiton.type = @"oglFlip";//不管subType is "fromLeft" or "fromRight",official只有一种效果
  //  transiton.type = @"pageCurl";
  //  transiton.type = @"pageUnCurl" ;
  //  transiton.type = @"cameraIrisHollowOpen ";
  //  transiton.type = @"cameraIrisHollowClose ";
    transiton.subtype = kCATransitionFromRight ;

    
    [self.view exchangeSubviewAtIndex:1 withSubviewAtIndex:0];
    [self.view.layer addAnimation:transiton forKey:@"animation"];
    
    
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
