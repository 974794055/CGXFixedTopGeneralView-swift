//
//  CGXFixedTopGeneralMenuView.swift
//  CGXFixedTopGeneralView
//
//  Created by 曹贵鑫 on 2018/8/12.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

import UIKit

private var kBadgeLabel = "kBadgeLabel"

extension UIView {
    /// 添加带文本内容的Badge, 默认右上角, 红色, 18pts
    /// - Parameter text: 文本字符串
    public func addBadge(text: String) {
        showBadge()
        self.badgeLabel.text = text
    }
    /// 添加带数字的Badge, 默认右上角,红色,18pts
    /// - Parameter number: 整形数字
    public func addBadge(number: Int) {
        if number <= 0 {
            addBadge(text: "0")
            hiddenBadge()
            return
        }
        addBadge(text: "\(number)")
    }
    
    /// 添加带颜色的小圆点, 默认右上角, 红色, 8pts
    /// - Parameter color: 颜色
    public func addDot(color: UIColor?) {
        addBadge(text: "")
        setBadge(height: 8.0)
        if let color = color  {
            self.badgeLabel.backgroundColor = color
        }
    }
    /// 设置Badge的偏移量, Badge中心点默认为其父视图的右上角
    /// - Parameters:
    ///   - x: X轴偏移量 (x<0: 左移, x>0: 右移) axis offset (x <0: left, x> 0: right)
    ///   - y: Y轴偏移量 (y<0: 上移, y>0: 下移) axis offset (Y <0: up,   y> 0: down)
    public func moveBadge(x: CGFloat, y: CGFloat) {
        
        self.badgeLabel.offset = CGPoint(x: x, y: y)
        self.badgeLabel.p_y = -self.badgeLabel.p_height*0.5/*badge的y坐标*/ + y
            self.badgeLabel.p_right = self.badgeLabel.superview!.p_width + self.badgeLabel.p_height*0.5 + x
    }
    

    /// 设置Badge的高度,因为Badge宽度是动态可变的,通过改变Badge高度,其宽度也按比例变化,方便布局
    /// - Parameter height: 高度大小
    public func setBadge(height: CGFloat) {
        let scale = height / self.badgeLabel.p_height
        self.badgeLabel.transform = self.badgeLabel.transform.scaledBy(x: scale, y: scale)
    }
    
    /// 设置Bage的属性
    /// - Parameter attributes: 将badgeLabel对象回调出来的闭包
    public func setBadgeLabel(attributes: (CGXFixedTopBadgeLabel)->()) {
        attributes(self.badgeLabel)
    }
    
    /// 显示Badge
    public func showBadge() {
        self.badgeLabel.isHidden = false
    }
    
    /// 隐藏Badge
    public func hiddenBadge() {
        self.badgeLabel.isHidden = true
    }
}

// MARK: - getter/setter
extension UIView {

    var badgeLabel: CGXFixedTopBadgeLabel {
        get {
            if let aValue = objc_getAssociatedObject(self, &kBadgeLabel) as? CGXFixedTopBadgeLabel {
                return aValue
            } else {
                let badgeLabel = CGXFixedTopBadgeLabel.init(frame: CGRect.init(x: 0, y: 0, width: 18, height: 18))
                badgeLabel.center = CGPoint(x: self.p_width, y: 0)
                self.addSubview(badgeLabel)
                self.bringSubview(toFront: badgeLabel)
                self.badgeLabel = badgeLabel
                return badgeLabel
            }
        }
        set {
            objc_setAssociatedObject(self, &kBadgeLabel, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var p_x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame.origin.x = newValue
        }
    }
    
    var p_y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame.origin.y = newValue
        }
    }
    
    var p_right: CGFloat {
        get {
            return frame.origin.x + frame.size.width
        }
        set {
            frame.origin.x = newValue - frame.size.width
        }
    }
    
    var p_bottom: CGFloat {
        get {
            return frame.origin.y + frame.size.height
        }
        set {
            frame.origin.y = newValue - frame.size.height
        }
    }
    
    var p_width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            frame.size.width = newValue
        }
    }
    
    var p_height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            frame.size.height = newValue
        }
    }
    
    var p_centerX: CGFloat {
        get {
            return center.x
        }
        set {
            center.x = newValue
        }
    }
    
    var p_centerY: CGFloat {
        get {
            return center.y
        }
        set {
            center.y = newValue
        }
    }
}
