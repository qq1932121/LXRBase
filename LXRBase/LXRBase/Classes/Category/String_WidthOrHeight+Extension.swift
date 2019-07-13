//
//  String_WidthOrHeight+Extension.swift
//  NewLianJing
//
//  Created by 67 on 2019/6/12.
//  Copyright © 2019 NewLianJing. All rights reserved.
//

import Foundation

/// 字体宽高
public extension String{
    
    /// 计算文字宽度
    ///
    /// - Parameters:
    ///   - fontSize:   字体
    ///   - height:     规定高度
    /// - Returns:      文字宽度
    func lxr_widthForComment(font: UIFont = .systemFont(ofSize: 14), height: CGFloat = 15) -> CGFloat {
        let rect = NSString(string: self).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: height),
                                                       options: .usesLineFragmentOrigin,
                                                       attributes: [.font: font],
                                                       context: nil)
        return ceil(rect.width)
    }
    
    /// 根据字体/宽度 计算文字高度
    ///
    /// - Parameter font: 字体
    ///   - width: 文字规定宽度
    /// - Returns: 文字高度
    func lxr_heightForComment(font: UIFont = .systemFont(ofSize: 14), width: CGFloat) -> CGFloat {
        let rect = NSString(string: self).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)),
                                                       options: .usesLineFragmentOrigin,
                                                       attributes: [.font: font],
                                                       context: nil)
        return ceil(rect.height)
    }
    
    /// 根据字体/宽度/最大高度 计算文字高度
    ///
    /// - Parameters:
    ///   - fontSize: 字体
    ///   - width: 文字规定宽度
    ///   - maxHeight: 最大高度
    /// - Returns: 文字高度
    func lxr_heightForComment(font: UIFont = .systemFont(ofSize: 14), width: CGFloat, maxHeight: CGFloat) -> CGFloat {
        let rect = NSString(string: self).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)),
                                                       options: .usesLineFragmentOrigin,
                                                       attributes: [.font: font],
                                                       context: nil)
        return ceil(rect.height)>maxHeight ? maxHeight : ceil(rect.height)
    }
}
