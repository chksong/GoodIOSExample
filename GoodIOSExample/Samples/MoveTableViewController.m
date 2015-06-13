//
//  MoveTableViewController.m
//  GoodIOSExample
//
//  Created by chksong on 15/6/14.
//  Copyright (c) 2015年 chksong company. All rights reserved.
//

#import "MoveTableViewController.h"

@interface MoveTableViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *arrayItems ;
}

@property(strong, nonatomic) UITableView *tableView ;


@end

@implementation MoveTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 20, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    self.tableView.dataSource =self ;
    self.tableView.delegate =self ;
    
    [self.view addSubview:self.tableView];
    arrayItems = @[@"item1" ,@"item2", @"item3"] ;
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
    
    cell.textLabel.text = arrayItems[indexPath.row] ;
    
    return cell ;
}

@end
