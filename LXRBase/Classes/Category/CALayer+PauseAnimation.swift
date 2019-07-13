//
//  CALayer+PauseAnimation.swift
//  NewLianJing
//
//  Created by lianjinglvxing on 2018/11/15.
//  Copyright © 2018年 NewLianJing. All rights reserved.
//

import Foundation

public extension CALayer{
    /// 开始旋转
    func startAnimation(){
        let rotatAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotatAnimation.fromValue = 0
        rotatAnimation.toValue = Double.pi * 2
        rotatAnimation.repeatCount = Float.infinity //Float 最大值
        rotatAnimation.duration = 5
        add(rotatAnimation, forKey: nil)
    }
    
    /// 暂停动画
    func pauseAnimation(){
        let time : CFTimeInterval = convertTime(CACurrentMediaTime(), from: nil)
        speed = 0.0
        timeOffset = time
    }
    
    
    /// 恢复动画
    func resumeAnimation(){
        let pausedTime : CFTimeInterval = timeOffset
        speed = 1.0
        timeOffset = 0.0
        beginTime = 0.0
        let timeSincePause = convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        beginTime = timeSincePause
    }
    
}
