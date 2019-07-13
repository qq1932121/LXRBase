//
//  UIImageView+Extension.swift
//  NewLianJing
//
//  Created by lianjinglvxing on 2018/9/28.
//  Copyright © 2018年 NewLianJing. All rights reserved.
//

import UIKit

public extension UIImage{
    /// 颜色创建图片
    ///
    /// - Parameters:
    ///   - color: 颜色
    ///   - size: 大小
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1.0, height: 1.0)) {
        UIGraphicsBeginImageContextWithOptions(size, true, UIScreen.main.scale)
        defer {UIGraphicsEndImageContext()}
        guard let context = UIGraphicsGetCurrentContext() else {return nil}
        context.setFillColor(color.cgColor)
        context.fill(CGRect(origin: CGPoint.zero, size: size))
        context.setShouldAntialias(true)
        guard let image = UIGraphicsGetImageFromCurrentImageContext(),
            let cgImage = image.cgImage else {
            self.init()
            return nil
        }
        self.init(cgImage: cgImage)
    }
    /// 图片切圆角
    /// - Parameters:
    ///   - sourceImage:    图片对象
    ///   - cornerRadius:   半径
    ///   - size:           大小
    ///   - corners:        四个角 (默认:全切)
    ///   - backColor:      背景颜色
    /// - Returns:          切圆角后的图片
    func lxr_imageWithRoundCorner(cornerRadius:CGFloat ,size:CGSize,corners: UIRectCorner = [.allCorners],backColor:UIColor = UIColor.white,isMaskToBounds : Bool = true) -> UIImage {
        let scale = UIScreen.main.scale
        let rect = CGRect(origin: CGPoint(), size: size)
        UIGraphicsBeginImageContextWithOptions(size,isMaskToBounds,scale)
        backColor.setFill()
        UIRectFill(rect)
        let bounds = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        path.addClip()

        draw(in: bounds)
        guard let image = UIGraphicsGetImageFromCurrentImageContext()else {
            UIGraphicsEndImageContext()
            return UIImage()
        }
        // 关闭上下文
        UIGraphicsEndImageContext()
        return image
        
    }
    /// 生成指定大小的不透明图象
    ///
    /// - parameter size:      尺寸
    /// - parameter backColor: 背景颜色 (默认白色)
    /// - returns: 图像
    func lxr_image(size: CGSize? = nil, backColor: UIColor = .white) -> UIImage? {
        var size = size
        if size == nil {
            size = self.size
        }
        let rect = CGRect(origin: CGPoint(), size: size!)
        UIGraphicsBeginImageContextWithOptions(rect.size, true, 0)
        backColor.setFill()
        UIRectFill(rect)
        draw(in: rect)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
}
