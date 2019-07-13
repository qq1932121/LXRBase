//
//  UIView+Style.swift
//  NewLianJing
//
//  Created by lianjinglvxing on 2019/2/27.
//  Copyright © 2019 NewLianJing. All rights reserved.
//

//import UIKit

// MARK: - 样式
public extension UIView{
    
    /// 设置边框圆角 (渲染差)
    class func setBoard(view:UIView,cornerRadius:CGFloat) -> UIView {
        view.layer.cornerRadius = cornerRadius
        view.layer.masksToBounds = true
        return view
    }
    
    /// 部分圆角
    /// - Parameters:
    ///   - corners: 需要实现为圆角的角，可传入多个 [.topLeft,.topRight]
    ///   - radii: 圆角半径
    func setCorner(byRoundingCorners corners: UIRectCorner, radii: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radii, height: radii))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
}
