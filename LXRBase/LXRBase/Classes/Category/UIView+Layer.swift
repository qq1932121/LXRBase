//
//  UIView+Layer.swift
//  NewLianJing
//
//  Created by lianjinglvxing on 2018/12/15.
//  Copyright © 2018年 NewLianJing. All rights reserved.

//  XIB文件添加属性

import UIKit

extension UIView {
    
    @IBInspectable public var cornerRaduis: CGFloat {
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat {
        set {
            if newValue >= 0 {
                layer.borderWidth = newValue
            } else {
                layer.borderWidth = 0
            }
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable public var borderColor: UIColor {
        set {
            layer.borderColor = newValue.cgColor
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return UIColor.clear
        }
    }
    
    @IBInspectable public var shadowColor: UIColor {
        set {
            layer.shadowColor = newValue.cgColor
        }
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return UIColor.clear
        }
    }
    
    @IBInspectable public var shadowOffset: CGSize {
        set {
            layer.shadowOffset = newValue
        }
        get {
            return layer.shadowOffset
        }
    }
}
