//
//  UIView+Action.swift
//  NewLianJing
//
//  Created by lianjinglvxing on 2019/2/27.
//  Copyright © 2019 NewLianJing. All rights reserved.
//

//import UIKit

// MARK: - 事件
public extension UIView{
    /// 添加点击事件
    func addTapGestureRecognizer(target: Any, action: Selector){
        isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: target, action: action)
        addGestureRecognizer(tap)
    }
}
