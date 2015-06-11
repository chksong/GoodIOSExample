//
//  SettingViewController.m
//  GoodIOSExample
//
//  Created by chksong on 15/6/11.
//  Copyright (c) 2015年 chksong company. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    self.tableView.dataSource = self ;
    self.tableView.delegate = self  ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

 
-(void) viewDidAppear:(BOOL)animated  {
    NSLog(@"%s", __func__) ;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void) viewDidDisappear:(BOOL)animated  {
     NSLog(@"%s", __func__) ;
     [self.navigationController setNavigationBarHidden:NO animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSInteger ) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  2 ;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"settingcell" ;
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier] ;
    if ( 0 ==  indexPath.row) {
        cell.textLabel.text = @"消息通知" ;
    }
    else {
        cell.textLabel.text =@"其他" ;
    }
    
    
    return  cell ;
}







@end
