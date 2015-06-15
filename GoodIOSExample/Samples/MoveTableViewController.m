//
//  MoveTableViewController.m
//  GoodIOSExample
//
//  Created by chksong on 15/6/14.
//  Copyright (c) 2015年 chksong company. All rights reserved.
//

#import "MoveTableViewController.h"
#import <SVProgressHUD.h>

@interface MoveTableViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    BOOL isEditing ;
    NSArray *arrayItems ;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

//@property(strong, nonatomic) UITableView *tableView ;
@property(strong, nonatomic) UIBarButtonItem* editItem ;


@end

@implementation MoveTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 1.0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    self.tableView.dataSource =self ;
    self.tableView.delegate =self ;
    
    [self.tableView setTableFooterView:[[UIView alloc] init]];
    [self.tableView setContentInset:UIEdgeInsetsMake(0, 0, 16, 0)];
    

    
  //  [self.view addSubview:self.tableView];
   
    
    arrayItems = @[@"item1" ,@"item2", @"item3"] ;
    
    
    //在导航栏 添加 编辑的右键
    self.editItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editMyTable:)];

    NSMutableArray *arrayItem = [[NSMutableArray alloc]init];
    [arrayItem addObject: self.navigationItem.rightBarButtonItem ];
    [arrayItem addObject:self.editItem ];
    self.navigationItem.rightBarButtonItems = arrayItem ;
    
    
    //添加向右的手势
    UISwipeGestureRecognizer *recongnizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeLeft:)];
    [recongnizer setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.tableView addGestureRecognizer:recongnizer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(BOOL) tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES ;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewRowAction *destructive;
    UITableViewRowAction *normal;
    UITableViewRowAction *customized1;
    UITableViewRowAction *customized2;
    
    
    destructive = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive
                                                     title:@"dest"
                                                   handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
                                                       [SVProgressHUD showSuccessWithStatus:@"Destructive action has been executed!"];
                                                   }];
    
    normal      = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal
                                                     title:@"norm"
                                                   handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
                                                       [SVProgressHUD showSuccessWithStatus:@"Normal action has been executed!"];
                                                   }];
    
    customized1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault
                                                     title:@"cus1"
                                                   handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
                                                       [SVProgressHUD showSuccessWithStatus:@"An action (customized from default) has been executed!"];
                                                   }];
    customized1.backgroundColor = [UIColor greenColor];
    
    customized2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault
                                                     title:@"cus2"
                                                   handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
                                                       [SVProgressHUD showSuccessWithStatus:@"An action (customized from default) has been executed!"];
                                                   }];
    customized2.backgroundEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    
    return @[destructive,
             normal,
             customized1,
             customized2];
}

//



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //add code here for when you hit delete
    }
}


-(UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  UITableViewCellEditingStyleDelete ;
}

-(void) setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated] ;
    [self.tableView setEditing:editing animated:animated];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrayItems count];
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"myMoveCell" ;
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier] ;
    if (cell == nil) {
        cell =  [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = arrayItems[indexPath.row] ;
    
    return cell ;
}
// 自定义 删除按钮的 提示
-(NSString*) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  @"删除" ;
}




-(BOOL) tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  YES ;
}





#pragma mark  -- 自定义操作
-(void)editMyTable:(id)sender {
    
      [self.tableView setEditing:!self.tableView.editing animated:YES];
    if (!self.tableView.editing) {
        self.editItem.title = @"编辑" ;
    }
    else {
        self.editItem.title = @"完成";
    }
    
}

#pragma mark -- 手势的操作

-(void) handleSwipeLeft:(UISwipeGestureRecognizer*) gestureRecongnizer
{
    NSLog(@"%s", __func__) ;
    CGPoint localtion = [gestureRecongnizer locationInView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:localtion];
    if (indexPath) {
        UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
}

@end
