//
//  Common.swift
//  WeiBo
//
//  Created by hsx770911@126.com on 2017/12/20.
//  Copyright © 2017年 成良雨. All rights reserved.
//

import Foundation
import UIKit

func CLYfont(number:CGFloat)->UIFont{
  return UIFont.systemFont(ofSize: number)
}

func CLYBoldfont(number:CGFloat)->UIFont{
    return UIFont.boldSystemFont(ofSize: number)
}

let Screen_W = UIScreen.main.bounds.size.width

let Screen_H = UIScreen.main.bounds.size.height
// 1 的时候出现  0 的时候隐藏
let FPSLabel = 1

func DLog<T>(message : T, file : String = #file, line : Int = #line){
    
    #if DEBUG
        
        let filepath = (file as NSString).lastPathComponent
        
        let fun = #function
        print("\(filepath)-\(fun)-[\(line)]-\(message)")
        
    #endif
}

