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
    
    let arrString = [
            ["title":"如何使用swift发布库"]
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
        
        cell.textLabel?.text = arrString[indexPath.row]["title"] ;
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
