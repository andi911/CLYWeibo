//
//  MainTabBarController.swift
//  WeiBo
//
//  Created by hsx770911@126.com on 2017/12/20.
//  Copyright © 2017年 成良雨. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildController()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .portrait
    }
    

}

extension MainTabBarController {
    fileprivate func setupChildController(){
        guard let filePath = Bundle.main.path(forResource: "tabbar", ofType: "plist"),
              let plistDict = NSDictionary.init(contentsOfFile: filePath),
              let dictArray = plistDict["TarbarItems"] as? [[String:String]]
        else{
            return
        }
        
        var arrayM = [UIViewController]()
        for dict in dictArray{
            arrayM.append(controller(dict: dict))
        }
        viewControllers = arrayM
        
    }
    
    /// 使用字典创建一个子控制器
    ///
    /// - parameter dict: 信息字典
    ///
    /// - returns: 子控制器
    private func controller(dict: [String : String]) -> UIViewController {
        
        // 1.取得字典内容
        guard let clsName = dict["clsName"],
            let title = dict["title"],
            let imageName = dict["image"],
            let selectedImageName = dict["selectImage"],
            let cls = NSClassFromString(Bundle.main.nameSpace + "." + clsName) as? UIViewController.Type else {
                return UIViewController()
        }
        
        // 2. 创建视图控制器
        let vc = cls.init()
        vc.title = title
        vc.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: selectedImageName)?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.orange], for: .selected)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.font : CLYfont(number: 9)], for: .normal
        )
        let nav = ZJNavigationController.init(rootViewController: vc)
        return nav
    }

}
