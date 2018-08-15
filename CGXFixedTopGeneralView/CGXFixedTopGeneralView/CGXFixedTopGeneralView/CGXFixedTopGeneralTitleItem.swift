//
//  CGXFixedTopGeneralTitleItem.swift
//  CGXFixedTopGeneralView
//
//  Created by 曹贵鑫 on 2018/8/9.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

import UIKit
import Foundation
enum CGXFixedTopGeneralTitleItemButtonMode:Int {
    case Done
    case Top
    case Bottom
    case Left
    case Right
}

class CGXFixedTopGeneralTitleItem: NSObject {

    //标题文字 富文本 默认
    var titleNormalAttributed = NSAttributedString()
     //标题文字 富文本 选中
    var titleSelectAttributed = NSAttributedString()
    
    
    //标题文字
    var title = String()
    //标题文字默认大小
    var titleNormalFont:UIFont = UIFont.systemFont(ofSize: 14)
    //标题文字默认大小
    var titleNormalColor:UIColor = UIColor.black
    //标题文字选中大小
    var titleSelectColor:UIColor = UIColor.red
    //标题文字 默认图片
    var normalImage:String = String()
    //标题文字 选中图片   可不传
    var selectImage:String = String()
    
    var isSelect:Bool = false
    //默认为0 不显示
    var badge:NSInteger = 0
    var badgeX:CGFloat = -20
    var badgeY:CGFloat = 10
    
    //图文间距
    var space:CGFloat = 5
    //按钮默认点击动画效果
    var adjustsImageWhenDisabled:Bool = false
    
    
    
    var buttonMode:CGXFixedTopGeneralTitleItemButtonMode = .Done
    
    override init() {
        super.init()
        
    }
}
