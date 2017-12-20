//
//  ZJTabBar.swift
//  WeiBo
//
//  Created by hsx770911@126.com on 2017/12/20.
//  Copyright © 2017年 成良雨. All rights reserved.
//

import UIKit

typealias tabBarComposeBlock = ()->()

class ZJTabBar: UITabBar {
    
    var callBack : tabBarComposeBlock?
    
    private lazy var composeBtn : UIButton = UIButton.init(imageName: "tabbar_compose_icon_add", bgImageName: "tabbar_compose_button")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(composeBtn)
        composeBtn.addTarget(self, action: #selector(composeStatus), for: .touchUpInside)
        composeBtn.bounds.size = composeBtn.currentBackgroundImage?.size ?? CGSize(width: 0, height: 0)

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let w = Screen_W
        let h = bounds.size.height
        var tabbarButtonIndex = 0
        
        composeBtn.center.x = w / 2.0
        composeBtn.center.y =  h / 2.0
        
        for btn in subviews {
            if btn.isKind(of: NSClassFromString("UITabBarButton")!) {
                guard let itemCount = items?.count else {
                    return
                }
                let btnW = w / CGFloat((itemCount + 1))
                let btnX = CGFloat(tabbarButtonIndex) * btnW
                btn.frame = CGRect(x: btnX, y: 0, width: btnW, height: h)
                tabbarButtonIndex = tabbarButtonIndex + 1
                if(tabbarButtonIndex == 2) {
                    tabbarButtonIndex = tabbarButtonIndex + 1
                }
            }
        }

    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func composeStatus() {
        guard let callBack = callBack else {
            return
        }
        callBack()
    }
    
    
    func callBackBlock(block : @escaping tabBarComposeBlock) {
        callBack = block
    }




}
