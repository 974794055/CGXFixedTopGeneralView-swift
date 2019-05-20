//
//  CGXFixedTopGeneralManager.swift
//  CGXFixedTopGeneralView
//
//  Created by 曹贵鑫 on 2018/8/9.
// git下载链接：https://github.com/974794055/CGXFixedTopGeneralView-swift.git
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

import UIKit
import Foundation
enum CGXFixedTopGeneralTitleManagerMode:Int {
    case fixedText  //文字
    case fixedTextImage //文字图片
}

class CGXFixedTopGeneralTitleManager: NSObject {
    //标签高度。默认60
    var titleHeight: CGFloat = 60
    
    
    //当前点击
    var currentSelected:NSInteger = 0
    //是否防止多次点击 默认为YES
    var isClick:Bool = true
    //第一次点击
    var isFirst:Bool = true
   //是否有按钮点击false、还是cell点击true。触发事件 默认为false
    var isUserBtn:Bool = true
    //是否有下划线
    var isLine: Bool = true
    /// 滑块高度
    var lineHeight: CGFloat = 1.0
    /// 下划线颜色
    var lineColor: UIColor = UIColor.init(white: 0.93, alpha: 1)
    //是否有滑块
    var isSlider: Bool = true
    /// 是否下划线等分  默认和字体宽度相同
    var isSliderEqual: Bool = true
    /// 滑块颜色
    var sliderColor: UIColor = UIColor.red
    /// 滑块高度
    var sliderHeight: CGFloat = 2.0
    /// 滑块宽度的比例。占按钮宽度的比例 0 ～ 1。 默认为0时，宽度为文字的长度
    var sliderWidthScale: CGFloat = 0
    // 头部视图颜色
    var bgColor: UIColor = UIColor.white
    override init() {
        super.init()
    }
}
