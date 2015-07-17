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
    
    //测试ULable 
    func testUILabel() {
        let label1 = UILabel(frame: CGRect(x: 20, y: 60, width: 100, height: 23))
        label1.text = "IOS Programming Cookbook"
        label1.font = UIFont.boldSystemFontOfSize(14) ;
//        label1.numberOfLines = 5
//        label1.lineBreakMode = .ByWordWrapping   //空格自动换行
        
        label1.sizeToFit() //自动拉伸区域
        label1.adjustsFontSizeToFitWidth = true   //自动调整字体。适应到区域
        
        let label2 = UILabel(frame: CGRect(x: 20, y: 100, width: 100, height: 23))
        label2.backgroundColor = UIColor.clearColor()
        label2.attributedText = attributedText()
        label2.sizeToFit()
        
     
        viewContainer.addSubview(label1)
        viewContainer.addSubview(label2)
    }
    
    
    //属性 字符串。      
    func attributedText() -> NSAttributedString {
        let string = "iOS SDK" as NSString
        let result = NSMutableAttributedString(string: string as String)
        
        
        let attributesForFirstWord = [
            NSFontAttributeName:UIFont.boldSystemFontOfSize(60),
            NSForegroundColorAttributeName :UIColor.redColor(),
            NSBackgroundColorAttributeName : UIColor.blackColor(),
        ]
        
        let shaddow = NSShadow()
        shaddow.shadowColor = UIColor.darkGrayColor()
        shaddow.shadowOffset = CGSize(width: 3, height: 3)
        
        let attributeForSencond = [
            NSFontAttributeName :UIFont.boldSystemFontOfSize(60),
            NSForegroundColorAttributeName :UIColor.whiteColor(),
            NSBackgroundColorAttributeName :UIColor.redColor(),
            NSShadowAttributeName : shaddow,
        ]
        
        result.setAttributes(attributesForFirstWord, range: string.rangeOfString("iOS"))
        result.setAttributes(attributeForSencond, range: string.rangeOfString("SDK"))
        
        return NSAttributedString(attributedString: result)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewContainer = UIView( frame: self.view.bounds)
        view.backgroundColor = UIColor.greenColor()
        self.view.addSubview(viewContainer)
        
        testImage()
        testBlurEffect()
        testUILabel()
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
