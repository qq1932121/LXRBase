//
//  UIButton+Extension.swift
//  NewLianJing
//
//  Created by 67 on 2019/6/12.
//  Copyright © 2019 NewLianJing. All rights reserved.
//

import UIKit

public extension UIButton{
    
    /// 创建自定义按钮
    /// - Parameters:
    ///   - imageName: normal状态图片
    ///   - highImageName: high状态图片
    ///   - target: target
    ///   - action: 事件
    /// - Returns: 自定义按钮
    class func createCustomButton(imageName:String?,highImageName:String?,backGroundImageName:String?,target : AnyObject, action : Selector)->UIButton{
        let customButton = UIButton(type: .custom)
        if let imageName = imageName {
            customButton.setImage(UIImage(named :imageName), for: .normal)
        }
        if let highImageName = highImageName {
            customButton.setImage(UIImage(named :highImageName), for: .highlighted)
        }
        if let backGroundImageName = backGroundImageName {
            customButton.setBackgroundImage(UIImage(named :backGroundImageName), for: .normal)
        }
        customButton.addTarget(target, action: action, for: .touchUpInside)
        customButton.sizeToFit()
        return customButton
    }
}
