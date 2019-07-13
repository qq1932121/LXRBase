//
//  String+Extension.swift
//  NewLianJing
//
//  Created by lianjinglvxing on 2018/10/20.
//  Copyright © 2018年 NewLianJing. All rights reserved.
//

import UIKit


public extension Float{
    func getmoneyStr()->String{
        return String(format: "%.2f", self)
    }
}

public extension CGFloat{
    func getmoneyStr()->String{
        return String(format: "%.2f", self)
    }
}

public extension String{
    /// 版本比较
    func isOlderVersionThan(_ otherVersion: String) -> Bool {
        return self.compare(otherVersion, options: NSString.CompareOptions.numeric) == ComparisonResult.orderedAscending
    }
}


/// 距离/时间
public extension String{
    
    /// 获取处理过的距离
    static func getDistanceString(distanceNumber:Int?) -> String {
        guard let distance = distanceNumber else {return "0m"}
        let actionDistance = Float(distance)
        if actionDistance > 1000 {
            return String(format: "%.2fkm", actionDistance/1000)
        }else{
            return String(format: "%.fm", actionDistance)
        }
    }
    /// 获取收听人数
    static func getListenCountString(playCountStr:Int?) -> String {
        guard let playCount = playCountStr else {return "0人听过"}
        let count = Float(playCount)
        if count > 10000 {
            return String(format: "%.2f万人听过", count/10000)
        }else{
            return String(format: "%.f人听过", count)
        }
    }
    /// 秒转换成00:00格式
    /// - Parameter secounds: 秒
    /// - Returns: 格式化
    static func getFormatPlayTime(secounds:TimeInterval)->String{
        if secounds.isNaN{return "00:00"}
        
        var Min = Int(secounds / 60)
        let Sec = Int(secounds.truncatingRemainder(dividingBy: 60))
        var Hour = 0
        if Min>=60 {
            Hour = Int(Min / 60)
            Min = Min - Hour*60
            return String(format: "%02d:%02d:%02d", Hour, Min, Sec)
        }
        return String(format: "%02d:%02d", Min, Sec)
    }
}



