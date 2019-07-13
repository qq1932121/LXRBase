//
//  Bundle+Extension.swift
//  NewLianJing
//
//  Created by lianjinglvxing on 2018/9/27.
//  Copyright © 2018年 NewLianJing. All rights reserved.
//

import Foundation

public extension UIApplication{
    
    /// 打电话
    /// - Parameter phoneNumber: 电话号
    class func callPhone(phoneNumber:String){
        if let callPhoneURL = URL(string: phoneNumber){
            if #available(iOS 10.0, *){
                UIApplication.shared.open(callPhoneURL, options: [:],completionHandler: nil)
            }else{
                UIApplication.shared.openURL(callPhoneURL)
            }
        }
    }
}

public extension Bundle{
    
    /// 项目命名空间 + "."
    var nameSpace : String{
        return (infoDictionary?["CFBundleName"] as? String ?? "") + "."
    }
    
}

public extension NSObject {
    
    /// 获取类名字符串
    class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last! as String
    }
    
    /// 用于获取 cell identifier 字符串
    class var identifier: String {
        return String(format: "%@", self.nameOfClass)
    }
}
