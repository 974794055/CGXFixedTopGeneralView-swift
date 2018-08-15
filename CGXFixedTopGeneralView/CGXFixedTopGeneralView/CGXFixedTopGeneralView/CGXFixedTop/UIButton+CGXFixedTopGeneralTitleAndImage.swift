//
//  UIButton+CGXFixedTopTitleAndImage.swift
//  LXFMenuPageControllerDemo
//
//  Created by 曹贵鑫 on 2018/7/21.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

import Foundation

enum CGXFixedTopGeneralTitleAndImageMode {
    case Top
    case Bottom
    case Left
    case Right
}
import UIKit

extension UIButton {
    
    /// 快速调整图片与文字位置
    ///
    /// - Parameters:
    ///   - buttonMode: 图片所在位置
    ///   - spacing: 文字和图片之间的间距
    func btn_locationAdjustCGXFixedTopTitleAndImage(buttonMode: CGXFixedTopGeneralTitleAndImageMode,
                                                    spacing: CGFloat) {
        let imageWidth = self.imageView?.frame.size.width
        let imageHeight = self.imageView?.frame.size.height
        let labelWidth: CGFloat! = self.titleLabel?.intrinsicContentSize.width
        let labelHeight: CGFloat! = self.titleLabel?.intrinsicContentSize.height
        var titleInsets: UIEdgeInsets
        var imageInsets: UIEdgeInsets
        switch (buttonMode){
        case .Top:
            titleInsets = UIEdgeInsets(top: 0,left:-imageWidth!, bottom: -imageHeight!-spacing/2, right: 0)
            imageInsets = UIEdgeInsets(top: -labelHeight-spacing/2, left: 0, bottom: 0, right: -labelWidth)
        case .Bottom:
            titleInsets = UIEdgeInsets(top: 0,left:-imageWidth!+spacing/2, bottom: imageHeight!+spacing/2, right: 0)
            imageInsets = UIEdgeInsets(top: labelHeight+spacing/2, left: 0, bottom: 0, right: -labelWidth-spacing/2)
        case .Left:
            titleInsets = UIEdgeInsets(top: 0, left: spacing/2, bottom: 0, right: -spacing/2)
            imageInsets = UIEdgeInsets(top: 0, left: spacing/2, bottom: 0, right: spacing/2)
        case .Right:
            titleInsets = UIEdgeInsets(top: 0, left: -imageWidth!-spacing/2, bottom: 0, right: imageWidth!+spacing/2)
            imageInsets = UIEdgeInsets(top: 0, left: labelWidth+spacing/2, bottom: 0,
                                       right: -labelWidth-spacing/2)
        }
        self.titleEdgeInsets = titleInsets
        self.imageEdgeInsets = imageInsets
    }
}
