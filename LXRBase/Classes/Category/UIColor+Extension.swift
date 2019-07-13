
//
//  UIColor+Extension.swift
//  NewLianJing
//
//  Created by lianjinglvxing on 2018/9/26.
//  Copyright © 2018年 NewLianJing. All rights reserved.
//

import UIKit


public extension UIColor{
    /// HEX颜色
    /// - Parameters:
    ///   - hex: 0xffffff
    ///   - alpha: 透明度
    /// - Returns: UIColor
    class func HEXCOLOR(hex: Int, alpha : CGFloat = 1.0) -> UIColor {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        return UIColor(red: components.R, green: components.G, blue: components.B, alpha: alpha)
    }
    
    /// 随机颜色
    ///
    /// - Returns: 随机颜色
    class func randomColor() -> UIColor {
        return UIColor(red: CGFloat(arc4random_uniform(256)),
                       green: CGFloat(arc4random_uniform(256)),
                       blue: CGFloat(arc4random_uniform(256)),
                       alpha: 1.0)
    }
}


