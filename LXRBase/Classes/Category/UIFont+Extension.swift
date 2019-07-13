//
//  UIFont+Extension.swift
//  NewLianJing
//
//  Created by lianjinglvxing on 2018/10/9.
//  Copyright © 2018年 NewLianJing. All rights reserved.
//

import UIKit

public extension UIFont{
    /// 全局字体(自适应)
    ///
    /// - Parameters:
    ///   - fontType: 字体类型 默认Regular
    ///   - fontSize: 字体大小
    /// - Returns: 字体
    class func NLJFont(fontType:FontType = FontType.Regular, fontSize:CGFloat) -> UIFont{
        var fontName = "PingFangTC-"
        switch fontType {
        case .Regular:
            fontName = fontName + "Regular"
        case .Medium:
            fontName = fontName + "Medium"
        case .Semibold:
            fontName = fontName + "Semibold"
        }
        guard let font = UIFont(name: fontName, size: fontSize) else{
            LXRLog(message: "字体返回错误")
            return UIFont.systemFont(ofSize: fontSize * Constants.ScreenWidth / 375.0)
        }
        return font
    }
}
