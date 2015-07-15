//
//  NiuViewController.swift
//  GoodIOSExample
//
//  Created by chksong on 15/7/9.
//  Copyright (c) 2015年 chksong company. All rights reserved.
//

import UIKit

class NiuViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    

    @IBOutlet weak var tableview: UITableView!
    
    var arrString = [
        ["title":"JASidePanel","key":1],
        ["title":"单方向侧滑","key":2],
    ];
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.dataSource = self ;
        tableview.delegate = self
        tableview.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: self.view.bounds.width, right: self.view.bounds.height);
        
        tableview.tableFooterView = UIView() ;
        // Do any additional setup after loading the view.
    }
 
   
    override func viewDidAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false) ;
    }
    
    override func viewDidDisappear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false) ;
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrString.count ;
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("niuTableViewCell", forIndexPath:indexPath) as! UITableViewCell ;
        
        if let item = arrString[indexPath.row] as? Dictionary {
            cell.textLabel?.text =  item["title"] as? String
        }
        return cell
    }
    
    
    override func viewDidLayoutSubviews() {
        if (tableview.respondsToSelector("setSeparatorInset:")) {
            tableview.separatorInset = UIEdgeInsetsZero
            NSLog("%@  --- setSeparatorInset", __FUNCTION__) ;
        }
        
        
        if(tableview.respondsToSelector("setLayoutMargins:")) {
            tableview.layoutMargins = UIEdgeInsetsZero
            NSLog("%@ ---- setLayoutMargins",__FUNCTION__) ;

        }
    }
    
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if(cell.respondsToSelector("setSeparatorInset:")) {
            cell.separatorInset = UIEdgeInsetsZero
            NSLog("%@ ---- setLayoutMargins",__FUNCTION__) ;
        }
        
        if(cell.respondsToSelector("setLayoutMargins:")) {
            cell.layoutMargins = UIEdgeInsetsZero
            NSLog("%@ ---- setLayoutMargins",__FUNCTION__) ;
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let item = arrString[indexPath.row] as? Dictionary {
            if let key = item["key"] as? Int    {
                if (1  == key ) {
                    let notfication = NSNotification(name: MSG_ChangRootViewCtrl , object: self, userInfo:["key": Para_ChangRootViewCtrl_sider])
                    NSNotificationCenter.defaultCenter().postNotification(notfication)
                }
                else if (2 == key )  {
                    let notfication = NSNotification(name: MSG_ChangRootViewCtrl , object: self, userInfo:["key": Para_ChangRootViewCtrl_qqLeft])
                    NSNotificationCenter.defaultCenter().postNotification(notfication)
                }
            }
        }
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
