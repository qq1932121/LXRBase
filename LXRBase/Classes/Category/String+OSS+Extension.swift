//
//  String+OSS+Extension.swift
//  NewLianJing
//
//  Created by lianjinglvxing on 2018/11/24.
//  Copyright © 2018年 NewLianJing. All rights reserved.
//

import UIKit

/// OSS图片处理
public extension String{
    /// OSS基础拼接字符串
    var OSS_BaseStr:String{
        return String(format: "%@?x-oss-process=image",self)
    }
    /// 根据?截取图片url
    func imageUrlStringSubToString() -> String {
        let ocStr = self as NSString
        let arrStr = ocStr.components(separatedBy: "?")
        return arrStr[0]
    }

    /// 项目缩略图统一处理方法 (此种方法和+缩略后的图片尺寸大小一样,所有没必要做缩略后再压缩图片质量)
    func OSS_thumbnailImageUrl(imageViewSize:CGSize?)->String{
        guard let imageSize = imageViewSize,imageSize.width != 0,imageSize.height != 0 else {
            return OSS_StringToQualityImageURL(quality: 80)
        }
        let heightAndWidthStr = String(format: "/resize,w_%.0f,h_%.0f,m_fill",imageSize.width*Constants.screenScale,imageSize.height*Constants.screenScale)
        let qualityImageURL = "/quality,q_80" // 质量压缩80
//        LXRLog(message: String(format: "%@%@%@", self,heightAndWidthStr,qualityImageURL))
        return String(format: "%@%@%@", self,heightAndWidthStr,qualityImageURL)
    }
    
    /// 单边缩略 推荐
    func OSS_StringToOnlyWidthImageURL(width:CGFloat) -> String{
        if width == 0{return self}
        let urlOSS = String(format: "/resize,w_%.f",width)
        let str = String(format: "%@%@", self,urlOSS)
        return str
    }
    
    /// 等比缩放, 限定在矩形框内 短边优先
    func OSS_StringWithImageURL(size:CGSize) -> String{
        if size.width == 0 || size.height == 0{return self}
        let urlOSS = String(format: "/resize,w_%.0f,h_%.0f,m_mfit",size.width,size.height)
        let str = String(format: "%@%@", self,urlOSS)
        return str
    }
    
    /// 等比缩放, 限定在矩形框内
    func OSS_StringWithImageURLCircelAcspect(size:CGSize) -> String{
        if size.width == 0 || size.height == 0{return self}
        let urlOSS = String(format: "/resize,w_%.0f,h_%.0f,m_lfit",size.width,size.height)
        let str = String(format: "%@%@", self,urlOSS)
        return str
    }
    /// 固定宽高，自动裁剪
    func OSS_StringWithImageURLHeightAndWidth(size:CGSize) -> String{
        if size.width == 0 || size.height == 0{return self}
        let urlOSS = String(format: "/resize,w_%.0f,h_%.0f,m_fill",size.width,size.height)
        let str = String(format: "%@%@", self,urlOSS)
        return str
    }
    
    /// 将图按比例缩略到原来的quality(0~100)
    func OSS_StringToQualityImageURL(quality:Int) -> String{
        if quality == 0{return self}
        let qualityOSS = String(format: "/quality,q_%zd",quality)
        let str = String(format: "%@%@", self,qualityOSS)
        return str
    }
    /// 裁剪圆角
    func OSS_StringToCircleImageURL(circle:CGFloat) -> String{
        if circle == 0{return self}
        let circleOSS = String(format: "/circle,r_%.0f",circle)
        let str = String(format: "%@%@", self,circleOSS)
        return str
    }
    
    /// 模糊效果
    /// - Parameters:
    ///   - radiu: 模糊半径
    ///   - s: 正态分布的标准差[1-50] 越大图片越模糊。
    func OSS_StringToBlurImageURL(radiu:CGFloat,s:CGFloat) -> String{
        if radiu == 0 && s == 0{return self}
        let radiuOSS = String(format: "/blur,r_%.0f,s_%.0f",radiu,s)
        let str = String(format: "%@%@", self,radiuOSS)
        return str
    }
}
