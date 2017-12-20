//
//  Bundle+Extensions.swift
//  WeiBo
//
//  Created by hsx770911@126.com on 2017/12/20.
//  Copyright © 2017年 成良雨. All rights reserved.
//

import Foundation

extension Bundle {
    var nameSpace :String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
