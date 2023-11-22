//
//  RoundedSegmentedControl.swift
//  WWRoundedSegmentedControl
//
//  Created by William.Weng on 2023/11/22.
//

import UIKit

// MARK: - 有圓角的UISegmentedControl
@IBDesignable
open class WWRoundedSegmentedControl: UISegmentedControl {
    
    @IBInspectable var cornerRadiusPercent: CGFloat = 0.5
    @IBInspectable var segmentInset: CGFloat = 5
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        cornerRadiusSetting()
        roundedCornersSetting()
    }
    
    /// [Is there a way for Interface Builder to render IBDesignable views which don't override drawRect](https://stackoverflow.com/questions/26197582/is-there-a-way-for-interface-builder-to-render-ibdesignable-views-which-dont-ov)
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        cornerRadiusSetting()
        roundedCornersSetting()
    }
}

// MARK: - 小工具
private extension WWRoundedSegmentedControl {
    
    /// 圓角設定
    func cornerRadiusSetting() {
        layer.masksToBounds = true
        layer.cornerRadius = bounds.height * cornerRadiusPercent
    }
    
    /// [設定圓角](https://stackoverflow.com/questions/23317645/how-to-change-the-corner-radius-of-uisegmentedcontrol)
    func roundedCornersSetting() {
        
        guard let foregroundIndex = Optional.some(numberOfSegments),
              selectedSegmentIndex > -1,
              subviews.indices.contains(foregroundIndex),
              let foregroundImageView = subviews[foregroundIndex] as? UIImageView
        else {
            return
        }
        
        foregroundImageView.bounds = foregroundImageView.bounds.insetBy(dx: segmentInset, dy: segmentInset)
        foregroundImageView.image = UIImage._colorImage(selectedSegmentTintColor ?? .gray)
        foregroundImageView.layer._removeAnimation(forKey: "SelectionBounds")
        foregroundImageView.layer.masksToBounds = true
        foregroundImageView.layer.cornerRadius = foregroundImageView.bounds.height * cornerRadiusPercent
    }
}
