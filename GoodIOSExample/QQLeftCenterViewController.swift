//
//  QQLeftCenterViewController.swift
//  GoodIOSExample
//
//  Created by chksong on 15/7/15.
//  Copyright (c) 2015年 chksong company. All rights reserved.
//

import UIKit

class QQLeftCenterViewController: UIViewController {
    
    
    func LeftButtonPressed ( sender : UIBarButtonItem) {
        NSNotificationCenter.defaultCenter().postNotificationName("kSwitchLeftViewNotification", object: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.yellowColor()
        
        let item = UIBarButtonItem(title:"测试", style:.Plain, target:self, action:"LeftButtonPressed:")
        self.navigationItem.leftBarButtonItem = item
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
