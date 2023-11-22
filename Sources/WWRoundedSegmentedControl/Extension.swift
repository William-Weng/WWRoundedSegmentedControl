//
//  Extension.swift
//  WWRoundedSegmentedControl
//
//  Created by William.Weng on 2023/11/22.
//

import UIKit

// MARK: - UIImage (static function)
extension UIImage {
    
    /// 繪制一張純色的圖片
    /// - Parameters:
    ///   - color: UIColor
    ///   - size: CGSize
    ///   - opaque: Bool
    ///   - scale: CGFloat
    /// - Returns: UIImage?
    static func _colorImage(_ color: UIColor, size: CGSize = CGSize(width: 1, height: 1), opaque: Bool = false, scale: CGFloat = 0.0) -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer { UIGraphicsEndImageContext() }
        
        let rect = CGRect(origin: .zero, size: size)
        color.setFill()
        UIRectFill(rect)
        
        guard let cgImage = UIGraphicsGetImageFromCurrentImageContext()?.cgImage else { return nil }
        return UIImage(cgImage: cgImage)
    }
}

// MARK: - CALayer (function)
extension CALayer {
    
    /// 移除動畫
    /// - Parameter key: Constant.AnimationKeyPath
    func _removeAnimation(forKey key: String) {
        removeAnimation(forKey: key)
    }
}
