//
//  studySwiftViewController.swift
//  GoodIOSExample
//
//  Created by chksong on 15/7/16.
//  Copyright (c) 2015年 chksong company. All rights reserved.
//

import UIKit

class studySwiftViewController: UIViewController {
    
    var viewContainer : UIView!

  
    //测试 模糊效果
    func testBlurEffect() {
        let blurEffect = UIBlurEffect(style: .Light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame.size = CGSize(width: 100, height: 100)
       // blurView.frame.origin = CGPointMake(10, 10)
        blurView.center = view.center
        
        viewContainer.addSubview(blurView)
    }
    
    //显示图像
    func testImage() {
        let image = UIImage(named: "car")
        let imageView = UIImageView(frame: view.bounds)
        
        imageView.contentMode = .ScaleAspectFit
        imageView.image = image
    
        
        imageView.center = view.center ;
        viewContainer.addSubview(imageView)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewContainer = UIView( frame: self.view.bounds)
        view.backgroundColor = UIColor.redColor()
        
        self.view.addSubview(viewContainer)
        
        
        testImage()
        testBlurEffect()
    }
    
    override func viewDidAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false) ;
    }
    
    override func viewDidDisappear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false) ;
    }
    
    
    override func awakeFromNib() {
        
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
