//
//  QQLeftViewController.m
//  GoodIOSExample
//
//  Created by chksong on 15/7/12.
//  Copyright (c) 2015年 chksong company. All rights reserved.
//

#import "GoodIOSExample-Swift.h"
#import "QQLeftViewController.h"
#import "CKKit.h"

@interface QQLeftViewController ()

@property (nonatomic ,strong ,readonly)  UIView *leftViewContainer;
@property (nonatomic ,strong ,readonly)  UIView *centerViewContainer ;
@property (nonatomic , assign)  BOOL isLeftViewShow  ;



@end



#define LEFT_VIEW_WIDTH 240 * TProportion()

@implementation QQLeftViewController

-(CGFloat) leftViewWidth {
    return 240 *  TProportion() ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifySwitchLeftView:) name:kSwitchLeftViewNotification object:nil];
    [self initializerUserInterface];
}

-(void) initializerUserInterface {
    
    
    
    _leftViewContainer =[[UIView alloc] initWithFrame:CGRectMake(-LEFT_VIEW_WIDTH ,0, LEFT_VIEW_WIDTH, T_SCREEN_HEIGHT)];
    _leftViewContainer.backgroundColor = [UIColor clearColor] ;
    _leftViewContainer.clipsToBounds = YES ;
    [self.view addSubview:_leftViewContainer] ;
    
    
    _centerViewContainer = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_centerViewContainer];
    
    
    // 添加2个 controller
    QQLeftCenterViewController *centerVC = [[QQLeftCenterViewController alloc] init];
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:centerVC];
    
    [_centerViewContainer addSubview:navVC.view];
    [self addChildViewController:navVC];
    
    
    UIViewController *leftvc = [[QQLeftLeftViewController alloc] init ];
    [_leftViewContainer addSubview:leftvc.view];
    [self addChildViewController:leftvc] ;
    
    
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]
//                                   initWithTarget:self action:@selector(processGestureReconizer:)];
//    
//    [self.view  addGestureRecognizer:pan];
}


-(void) processGestureReconizer:(UIGestureRecognizer *) gesture  {
    
//    // ru 
//    if ([gesture isKindOfClass:[UIPanGestureRecognizer class]]) {
//        UIPanGestureRecognizer *pan = (UIPanGestureRecognizer*) gesture ;
//        
//        CGPoint translation = [pan translationInView:self.view] ;
//        
//        
//        
//        
//    }
    
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

-(void) notifySwitchLeftView:(NSNotification*) notifification {
    if ( _isLeftViewShow == YES) {
        [self leftViewHide];
    }
    else {
        [self leftViewShow] ;
    }
}

-(void) leftViewShow {
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0.9 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        _leftViewContainer.frame = CGRectMake(0, 0, LEFT_VIEW_WIDTH, T_SCREEN_HEIGHT) ;
        _centerViewContainer.frame = CGRectMake(LEFT_VIEW_WIDTH, T_SCREEN_HEIGHT * 0.1/2 , T_SCREEN_WIDTH * 0.9, T_SCREEN_HEIGHT * 0.9);
    } completion:^(BOOL finished) {
        _isLeftViewShow = YES ;
    }];
}

-(void) leftViewHide {
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0.9
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                        _leftViewContainer.frame = CGRectMake(-LEFT_VIEW_WIDTH,0, LEFT_VIEW_WIDTH , T_SCREEN_HEIGHT) ;
                        _centerViewContainer.frame = CGRectMake(0, 0,T_SCREEN_WIDTH, T_SCREEN_HEIGHT) ;
                         
    } completion:^(BOOL finished) {
        _isLeftViewShow = NO ;
    }] ;
}

@end
