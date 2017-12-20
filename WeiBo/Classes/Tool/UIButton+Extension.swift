//
//  UIButton+Extension.swift
//  WeiBo
//
//  Created by hsx770911@126.com on 2017/12/20.
//  Copyright © 2017年 成良雨. All rights reserved.
//

import UIKit

extension UIButton {
    class func createButton(imageName:String,bgImageName:String)->UIButton{
        let btn = UIButton()
        btn.setBackgroundImage(UIImage.init(named: bgImageName), for: .normal)
        btn.setBackgroundImage(UIImage.init(named: bgImageName + "_highlighted"), for: .highlighted)
        btn.sizeToFit()
        return btn
    }
    
    convenience init(imageName : String , bgImageName : String){
        self.init()
        setBackgroundImage(UIImage.init(named: bgImageName), for: .normal)
        setBackgroundImage(UIImage.init(named: bgImageName + "_highlighted"), for: .highlighted)
        setImage(UIImage(named: imageName), for: .normal)
        setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        sizeToFit()
    }
    
    convenience init(bgColor: UIColor, fontSize: CGFloat, title: String){
        self.init()
        setTitle(title, for: .normal)
        backgroundColor = bgColor
        titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
    }
}
