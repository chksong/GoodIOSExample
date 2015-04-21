//
//  DetailViewController.h
//  GoodIOSExample
//
//  Created by chksong on 15-4-21.
//  Copyright (c) 2015年 chksong company. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

