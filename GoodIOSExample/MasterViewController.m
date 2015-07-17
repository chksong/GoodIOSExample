//
//  MasterViewController.m
//  GoodIOSExample
//
//  Created by chksong on 15-4-21.
//  Copyright (c) 2015年 chksong company. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "BrowseCodeViewController.h"

#define kItemKeyTitle           @"title"
#define kItemKeyDescription     @"description"
#define kItemKeyClassPrefix     @"prefix"


@interface MasterViewController ()

@property(nonatomic , strong) NSArray   *items ;
@property(nonatomic , strong) NSString *currentClass ;

//@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
// 去掉 barButton
    
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;
//
//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
    
    self.items = @[
                   // WebKit
                   @{kItemKeyTitle: @"WKWebView",
                     kItemKeyDescription: @"一个使用WKWebView的demo",
                     kItemKeyClassPrefix: @"WKWebView",
                     },
                   @{kItemKeyTitle: @"WebKit",
                     kItemKeyDescription: @"一个使用WKWebView的demo",
                     kItemKeyClassPrefix: @"WebKit",
                     },
                   
                   @{kItemKeyTitle: @"简单动画",
                     kItemKeyDescription: @"一个简单动画",
                     kItemKeyClassPrefix: @"SimpleAnimation",
                     },
                   @{
                     kItemKeyTitle: @"测试TableView",
                     kItemKeyDescription: @"自己手工代码测试TabelView各种操作",
                     kItemKeyClassPrefix: @"MoveTable",
                     },
                   @{
                       kItemKeyTitle: @"学习swift笔记",
                       kItemKeyDescription: @"swift中常用控件练习",
                       kItemKeyClassPrefix: @"studySwift",

                    },


                   ] ;
    
    self.title = @"IOS 学习笔记" ;
    //去掉 多余的割线
    [self.tableView setTableFooterView:[[UIView alloc] init]];
    
    self.tabBarItem.title = @"例子";
    
    
}

-(void) viewDidDisappear:(BOOL)animated {
    self.navigationController.navigationBarHidden =NO ;
}

-(void) viewDidAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)insertNewObject:(id)sender {
//    if (!self.objects) {
//        self.objects = [[NSMutableArray alloc] init];
//    }
//    
//    [self.objects insertObject:[NSDate date] atIndex:0];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([[segue identifier] isEqualToString:@"showDetail"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSDate *object = self.objects[indexPath.row];
//        [[segue destinationViewController] setDetailItem:object];
//    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.items   count ] ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDictionary *info = self.items[indexPath.row] ;
    cell.textLabel.text = info[kItemKeyTitle];
    cell.detailTextLabel.text = info[kItemKeyDescription] ;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
     //   [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

- (Class)swiftClassFromString:(NSString *)className {
    NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
    NSString *classStringName = [NSString stringWithFormat:@"_TtC%lu%@%lu%@",
                                 (unsigned long)appName.length, appName, (unsigned long)className.length, className];
    return NSClassFromString(classStringName);
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *item = self.items[indexPath.row]  ;
    NSString* className = [item[kItemKeyClassPrefix] stringByAppendingString:@"ViewController"];
    
    Class aClass =  NSClassFromString(className) ;
    if ( ! aClass) {
        aClass = [ self swiftClassFromString:className] ;
    }
    
    if (aClass) {
        id instance = [[ aClass alloc] init ] ;
        if ( [instance isKindOfClass:[UIViewController class]]) {
            self.currentClass = className  ;
            // CODE button
            UIBarButtonItem *barBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"代码"
                                                                           style:UIBarButtonItemStylePlain
                                                                          target:self
                                                                          action:@selector(codeButtonTapped:)] ;
            
            [(UIViewController*)instance navigationItem].rightBarButtonItem = barBtnItem ;
            [(UIViewController*) instance setTitle:item[kItemKeyTitle]];
            
            [self.navigationController pushViewController:(UIViewController*) instance animated:YES];
            
        }
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES] ;
}



-(void) codeButtonTapped:(id) sender {
    
    NSString *urlStr =[NSString stringWithFormat:@"https://github.com/chksong/GoodIOSExample/tree/master/GoodIOSExample/Samples/%@.m" ,self.currentClass] ;
    NSLog(@"%s  urlStr=%@", __FUNCTION__, urlStr);
    
    BrowseCodeViewController *codeCtr = [[BrowseCodeViewController alloc] init];
    [codeCtr setTitle:self.currentClass];
    [codeCtr setUrlString:urlStr];
    
    
    [self.navigationController pushViewController:codeCtr animated:YES];
}


//add for iOS8
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsMake(0,-1000,0,0)];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsMake(0,-1000,0,0)];
    }
}

-(void)viewDidLayoutSubviews {
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,-1000,0,0)];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,-1000,0,0)];
    }
}



@end
