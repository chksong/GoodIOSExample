//
//  QQLeftLeftViewController.swift
//  GoodIOSExample
//
//  Created by chksong on 15/7/15.
//  Copyright (c) 2015年 chksong company. All rights reserved.
//

import UIKit

class QQLeftLeftViewController: UIViewController {

    var button :UIButton!
    
    func buttonIsPressed(sender :UIButton) {
        NSLog("%@", __FUNCTION__)
    }
    
    func buttonIsTapped(sender :UIButton) {
        NSLog("%@ ", __FUNCTION__)
        
        NSNotificationCenter.defaultCenter().postNotificationName(MSG_ChangRootViewCtrl, object: nil, userInfo: ["key":Para_ChangRootViewCtrl_main])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.redColor()

        button = UIButton.buttonWithType(.System) as? UIButton
        button.frame = CGRect(x:110,y:70,width :100 ,height:44)
        button.center =  self.view.center ;
    
        button.setTitle("Press me ", forState: .Normal)
        button.setTitle("I m Pressed", forState: .Highlighted)
        
        button.addTarget(self, action: "buttonIsPressed:", forControlEvents: .TouchDown)
        button.addTarget(self, action: "buttonIsTapped:",  forControlEvents: .TouchUpInside)
        
        view.addSubview(button)
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
