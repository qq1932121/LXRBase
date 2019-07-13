//
//  UIImage+Clip+Extension.swift
//  NewLianJing
//
//  Created by 67 on 2019/5/24.
//  Copyright © 2019 NewLianJing. All rights reserved.

///  图片处理

import UIKit

public extension UIImage{
    //CoreGraphics
    func resizeCG(size:CGSize) -> UIImage? {
        guard  let cgImage = self.cgImage else { return nil }
        let bitsPerComponent = cgImage.bitsPerComponent
        let bytesPerRow = cgImage.bytesPerRow
        let colorSpace = cgImage.colorSpace
        let bitmapInfo = cgImage.bitmapInfo
        guard let context = CGContext(data: nil,
                                      width: Int(size.width),
                                      height: Int(size.height),
                                      bitsPerComponent: bitsPerComponent,
                                      bytesPerRow: bytesPerRow,
                                      space: colorSpace!,
                                      bitmapInfo: bitmapInfo.rawValue) else {
                                        return nil
        }
        context.interpolationQuality = .high
        context.draw(cgImage, in: CGRect(origin: .zero, size: size))
        
        let resizedImage = context.makeImage().flatMap {
            UIImage(cgImage: $0)
        }
        return resizedImage
    }
    
    //ImageIO
    func resizeIO(size:CGSize) -> UIImage? {
        //guard let data = UIImagePNGRepresentation(self) else { return nil }
        guard let data = self.pngData() else { return nil }
        let maxPixelSize = max(size.width, size.height)
        //let imageSource = CGImageSourceCreateWithURL(url, nil)
        guard let imageSource = CGImageSourceCreateWithData(data as CFData, nil) else { return nil }
        //kCGImageSourceThumbnailMaxPixelSize为生成缩略图的大小。
        //当设置为800，如果图片本身大于800*600，则生成后图片大小为800*600
        //如果源图片为700*500，则生成图片为800*500
        let options: [NSString: Any] = [
            kCGImageSourceThumbnailMaxPixelSize: maxPixelSize,
            kCGImageSourceCreateThumbnailFromImageAlways: true
        ]
        let resizedImage = CGImageSourceCreateImageAtIndex(imageSource, 0, options as CFDictionary).flatMap{
            UIImage(cgImage: $0)
        }
        return resizedImage
    }
}
