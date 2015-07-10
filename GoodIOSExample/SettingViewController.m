//
//  SettingViewController.m
//  GoodIOSExample
//
//  Created by chksong on 15/6/11.
//  Copyright (c) 2015年 chksong company. All rights reserved.
//

#import "SettingViewController.h"

#define  k_title    @"title"
#define  k_switch   @"isWitch"

@interface SettingViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(strong ,nonatomic) NSMutableArray * arrayContext ;
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    self.tableView.dataSource = self ;
    self.tableView.delegate = self  ;
    
    [self.tableView setTableFooterView:[[UIView alloc] init]];
    [self.tableView setContentInset:UIEdgeInsetsMake(0, 0, 16, 0)];
    [self.tableView setAllowsSelectionDuringEditing:YES];
    
    
    self.arrayContext = [[NSMutableArray alloc] init] ;

    NSArray *arrayContext =  @[
                         @{k_title:@"编辑表格" ,k_switch:@YES},
                          @{k_title:@"local notification" ,k_switch:@NO},
                          @{k_title:@"夜间模式", k_switch:@YES},
                          
                          ];
    
    [self.arrayContext  setArray:arrayContext];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

 
-(void) viewDidAppear:(BOOL)animated  {
    NSLog(@"%s", __func__) ;
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

-(void) viewDidDisappear:(BOOL)animated  {
     NSLog(@"%s", __func__) ;
     [self.navigationController setNavigationBarHidden:NO animated:NO];
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
    return [self.arrayContext count];
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"settingcell" ;
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier] ;
    
    NSDictionary *item = self.arrayContext[indexPath.row] ;
    
    cell.textLabel.text = item[k_title];
    id isSwith = item[k_switch] ;
    if ([@YES  isEqual: isSwith]) {
        UISwitch *aswitch = [[UISwitch alloc] init];
        aswitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"CK_B_NGIHT"];
        [aswitch addTarget:self action:@selector(swtihDayOrNight:) forControlEvents:UIControlEventValueChanged];

        cell.accessoryView = aswitch ;
    }
    
//    
//    if ( 0 ==  indexPath.row) {
//        cell.textLabel.text = @"local notification" ;
//    }
//    else if (1 == indexPath.row) {
//        cell.textLabel.text =@"夜间模式" ;
//
//    }
    
    return  cell ;
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *item = self.arrayContext[indexPath.row] ;
    if ([item[k_title] isEqualToString:@"local notification"]) {
        [self doSendNotifaction];
    }
    else if ([item[k_title] isEqualToString:@"编辑表格"]) {
        [self setEditTable] ;
    }
    
    
    

}

//启动测试表格的
-(void) setEditTable {
    
}

-(void) swtihDayOrNight:(id)sender {
    
}

-(void) doSendNotifaction {
    UILocalNotification *notifcation = [[UILocalNotification alloc] init];
    notifcation.fireDate = [NSDate dateWithTimeIntervalSinceNow:10] ;
    notifcation.alertBody = @"测试 local notification" ;

    
//    [[UIApplication sharedApplication] scheduledLocalNotifications:notifcation];
    [[UIApplication sharedApplication] scheduleLocalNotification:notifcation];
}


//add for iOS8
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

-(void)viewDidLayoutSubviews {
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}



@end
