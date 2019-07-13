//
//  LXRCommon.swift
//  LXRBaseDemo
//
//  Created by 67 on 2019/7/12.
//

import Foundation


/// DEBUG 打印
///
/// - Parameters:
///   - message: 描述
public func LXRLog<T>(message: T,file: String = #file,method: String = #function,line: Int = #line)
{
    #if DEBUG
    print("\((file as NSString).lastPathComponent) 第\(line)行\n方法:\(method)\n\(message)")
    #endif
}
