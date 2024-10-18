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
    
    @IBInspectable var innerCornerRadius: CGFloat = 8
    @IBInspectable var outerCornerRadius: CGFloat = 8
    @IBInspectable var segmentInset: CGFloat = 5
    
    private var cornerRadiusPercent: CGFloat?
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        initSetting()
    }
    
    /// [Is there a way for Interface Builder to render IBDesignable views which don't override drawRect](https://stackoverflow.com/questions/26197582/is-there-a-way-for-interface-builder-to-render-ibdesignable-views-which-dont-ov)
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        initSetting()
    }
}

// MARK: - 公開工具
public extension WWRoundedSegmentedControl {
    
    /// 改變圓角比例跟選項間隔
    /// - Parameters:
    ///   - cornerRadiusPercent: 圓角比例
    ///   - segmentInset: 選項間隔
    func change(cornerRadiusPercent: CGFloat, segmentInset: CGFloat) {
        
        self.cornerRadiusPercent = cornerRadiusPercent
        self.segmentInset = segmentInset
        
        updateSetting()
    }
    
    /// 改變圓角大小跟選項間隔
    /// - Parameters:
    ///   - cornerRadiusPercent: 圓角比例
    ///   - segmentInset: 選項間隔
    ///   - innerCornerRadius: 內部選項圓角
    ///   - outerCornerRadius: 外部外框圓角
    func change(innerCornerRadius: CGFloat, outerCornerRadius: CGFloat, segmentInset: CGFloat) {
        
        self.cornerRadiusPercent = nil
        self.innerCornerRadius = innerCornerRadius
        self.outerCornerRadius = outerCornerRadius
        self.segmentInset = segmentInset
        
        updateSetting()
    }
}

// MARK: - 小工具
private extension WWRoundedSegmentedControl {
    
    /// 初始化設定
    func initSetting() {
        cornerRadiusSetting()
        roundedCornersSetting()
    }
    
    func updateSetting() {
        
        initSetting()
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    /// 圓角設定
    func cornerRadiusSetting() {
        
        var cornerRadius = outerCornerRadius
        
        if let cornerRadiusPercent = cornerRadiusPercent {
            cornerRadius = bounds.height * cornerRadiusPercent
        }
        
        layer.masksToBounds = true
        layer.cornerRadius = cornerRadius
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
        foregroundImageView.layer.cornerRadius = innerCornerRadius
        
        if let cornerRadiusPercent = cornerRadiusPercent {
            foregroundImageView.layer.cornerRadius = foregroundImageView.bounds.height * cornerRadiusPercent
        }
    }
}
