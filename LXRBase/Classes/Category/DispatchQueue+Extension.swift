//
//  DispatchQueue+Extension.swift
//  NewLianJing
//
//  Created by lianjinglvxing on 2019/4/11.
//  Copyright © 2019 NewLianJing. All rights reserved.
//

import UIKit

public extension DispatchQueue {
    
    private static var _onceTracker = [String]()
    
    /// 只执行一次
    class func onceTime(token: String, block: () -> ()) {
        objc_sync_enter(self)
        defer {
            objc_sync_exit(self)
        }
        if _onceTracker.contains(token) {return}
        _onceTracker.append(token)
        block()
    }
    /// 异步
    func async(block: @escaping ()->()) {
        self.async(execute: block)
    }
    /// 延迟执行
    func after(time: DispatchTime, block: @escaping ()->()) {
        self.asyncAfter(deadline: time, execute: block)
    }
    /// 延迟执行
    func after(_ delay: TimeInterval, execute: @escaping () -> Void) {
        asyncAfter(deadline: .now() + delay, execute: execute)
    }
}
