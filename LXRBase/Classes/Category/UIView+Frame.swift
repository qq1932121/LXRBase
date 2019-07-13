//
//  UIView+Frame.swift
//  NewLianJing
//
//  Created by lianjinglvxing on 2019/2/27.
//  Copyright © 2019 NewLianJing. All rights reserved.
//

import UIKit

// MARK: - 布局
public extension UIView {
    // x
    var x : CGFloat {
        get {return frame.origin.x}
        set(newVal) {frame.origin.x = newVal}
    }
    // y
    var y : CGFloat {
        get {return frame.origin.y}
        set(newVal) {frame.origin.y = newVal}
    }
    // height
    var height : CGFloat {
        get {return frame.size.height}
        set(newVal) {frame.size.height = newVal}
    }
    // width
    var width : CGFloat {
        get {return frame.size.width}
        set(newVal) {frame.size.width = newVal}
    }
    // left
    var left : CGFloat {
        get {return x}
        set(newVal) {x = newVal}
    }
    // right
    var right : CGFloat {
        get {return x + width}
        set(newVal) {x = newVal - width}
    }
    // top
    var top : CGFloat {
        get {return y}
        set(newVal) {y = newVal}
    }
    // bottom
    var bottom : CGFloat {
        get {return y + height}
        set(newVal) {y = newVal - height}
    }
    // size
    var size: CGSize {
        get {return frame.size}
        set(newVal) {frame.size = newVal}
    }
    // centerX
    var centerX : CGFloat {
        get {return center.x}
        set(newVal) {center.x = newVal}
    }
    // centerY
    var centerY : CGFloat {
        get {return center.y}
        set(newVal) {center.y = newVal}
    }
    
    var middleX : CGFloat {
        get {return width * 0.5}
    }
    var middleY : CGFloat {
        get {return height * 0.5}
    }
    var middlePoint : CGPoint {
        get {return CGPoint(x: middleX, y: middleY)}
    }
    
    
}
