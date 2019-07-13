//
//  UIBarButtonItem+Extension.swift
//  NewLianJing
//
//  Created by lianjinglvxing on 2018/9/26.
//  Copyright © 2018年 NewLianJing. All rights reserved.
//

import UIKit

/**
 * UIImageRenderingModeAutomatic        // 根据图片的使用环境和所处的绘图上下文自动调整渲染模式。
 * UIImageRenderingModeAlwaysOriginal   // 始终绘制图片原始状态，不使用Tint Color。
 * UIImageRenderingModeAlwaysTemplate   // 始终根据Tint Color绘制图片，忽略图片的颜色信息。
 */
 
public extension UIBarButtonItem{
    /// 自定义TabBarItem
    ///
    /// - Parameters:
    ///   - imageName: 普通
    ///   - highImageName: 高亮
    convenience init(imageName : String , highImageName: String) {
        self.init()
        let btn = UIButton()
        btn.setImage(UIImage(named:imageName), for: .normal)
        btn.setImage(UIImage(named:highImageName), for: .highlighted)
        btn.sizeToFit()
        self.customView = btn
    }
    
    /// 自定义TabBarItem
    ///
    /// - Parameters:
    ///   - imageName: 普通
    ///   - action: 事件
    convenience init(imageName : String, highImageName:String,target : AnyObject, action : Selector) {
        self.init()
        self.customView = UIButton.createCustomButton(imageName: imageName,
                                                      highImageName: highImageName,
                                                      backGroundImageName: nil,
                                                      target: target,
                                                      action: action)
    }
}
