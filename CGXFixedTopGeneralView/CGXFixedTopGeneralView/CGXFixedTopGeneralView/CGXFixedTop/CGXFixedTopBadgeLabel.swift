//
//  CGXFixedTopGeneralMenuView.swift
//  CGXFixedTopGeneralView
//
//  Created by 曹贵鑫 on 2018/8/12.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

import UIKit

open class CGXFixedTopBadgeLabel: UILabel {
    
//    public class func `default`() -> Self {
//        return self.init(frame: CGRect(x: 0, y: 0, width: 18, height: 18))
//    }
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    /// 记录Badge的偏移量 Record the offset of Badge
    public var offset: CGPoint = CGPoint(x: 0, y: 0)
    
    /// 重写UILabel的text属性方法
    override open var text: String? {
        didSet {
            // 根据内容长度调整Label宽
            let stringWidth = width(string: self.text, font: self.font, height: self.p_height)
            if self.p_height > stringWidth + self.p_height*10/18 {
                self.p_width = self.p_height
                return
            }
            self.p_width = self.p_height*5/18/*left*/ + stringWidth + self.p_height*5/18/*right*/
        }
    }
    
    private func setupUI() {
        self.textColor = UIColor.white
        self.font = UIFont.systemFont(ofSize: 13)
        self.textAlignment = NSTextAlignment.center
        self.layer.cornerRadius = self.p_height * 0.5
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor.init(red: 1.00, green: 0.17, blue: 0.15, alpha: 1.0)
    }
    
    private func width(string: String?, font: UIFont, height: CGFloat) -> CGFloat {
        if string?.isEmpty == true { return 0.0 }
        var attributes : [NSAttributedStringKey: AnyObject] = [.font : font]
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byWordWrapping
        attributes.updateValue(paragraphStyle, forKey: .paragraphStyle)
        let size = CGSize(width: CGFloat(Double.greatestFiniteMagnitude), height: height)
        return ceil((string! as NSString).boundingRect(with: size, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes:attributes, context: nil).width)
    }
}
