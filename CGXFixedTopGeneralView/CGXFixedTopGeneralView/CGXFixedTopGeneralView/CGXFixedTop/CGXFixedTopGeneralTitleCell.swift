//
//  CGXFixedTopGeneralTitleCell.swift
//  CGXFixedTopGeneralView
//
//  Created by 曹贵鑫 on 2018/8/10.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

import UIKit
//  代理设置
@objc protocol CGXFixedTopGeneralTitleCellDelgate:NSObjectProtocol {
    @objc optional func selectCGXFixedTopGeneralTitleCellBtn(cell:CGXFixedTopGeneralTitleCell) -> Void
    
}
class CGXFixedTopGeneralTitleCell: UICollectionViewCell {
    
    //标签给外部提供的方法
    weak var delegate:CGXFixedTopGeneralTitleCellDelgate?
    lazy var titleBtn: UIButton = {
        let btn = UIButton(type: .custom)
        self.contentView.addSubview(btn)
        btn.titleLabel?.numberOfLines = 0
        btn.titleLabel?.lineBreakMode = NSLineBreakMode(rawValue: 0)!
        btn.titleLabel?.textAlignment = NSTextAlignment.center
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.contentHorizontalAlignment = .center;
        btn.imageView?.contentMode = .center
        btn.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.setTitleColor(UIColor.red, for:.selected)
        btn.setTitleColor(UIColor.red, for: [.highlighted, .selected])
        btn.frame = CGRect(x: 0, y: 0, width: frame.size.width , height: frame.size.height)
        btn.addTarget(self, action:#selector(titleBtnClick(button:)), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
    @objc func titleBtnClick(button:UIButton) -> Void {
        if self.delegate != nil && (self.delegate?.responds(to: #selector(CGXFixedTopGeneralTitleCellDelgate.selectCGXFixedTopGeneralTitleCellBtn(cell:))))!{
            self.delegate?.selectCGXFixedTopGeneralTitleCellBtn!(cell: self)
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    @objc func selectIndex() -> Void {
        if self.delegate != nil && (self.delegate?.responds(to: #selector(CGXFixedTopGeneralTitleCellDelgate.selectCGXFixedTopGeneralTitleCellBtn(cell:))))!{
            self.delegate?.selectCGXFixedTopGeneralTitleCellBtn!(cell: self)
        }
    }
    func updateTitleBtn(item:CGXFixedTopGeneralTitleItem) -> Void {
        
        titleBtn.isUserInteractionEnabled = false
        let title:String = item.title
        titleBtn.setTitle("" , for: .normal)
        titleBtn.setAttributedTitle(NSAttributedString.init(string: ""), for: .normal)
        titleBtn.setTitle("" , for: .selected)
        titleBtn.setAttributedTitle(NSAttributedString.init(string: ""), for: .selected)
        if title.count > 0 {
            titleBtn.setTitle(item.title , for: .normal)
            titleBtn.setTitle(item.title , for: .selected)
            titleBtn.setTitleColor(item.titleNormalColor, for: .normal)
            titleBtn.setTitleColor(item.titleSelectColor, for:.selected)
            titleBtn.setTitleColor(UIColor.orange, for: [.highlighted, .selected])
            titleBtn.adjustsImageWhenDisabled = item.adjustsImageWhenDisabled
            //        btn.isUserInteractionEnabled = false
            if item.buttonMode == .Done {
                
            } else {
                
                let normalImage:String = item.normalImage
                let selectImage:String = item.selectImage
                if normalImage.count > 0{
                    titleBtn.setImage(UIImage.init(named: normalImage), for: .normal)
                    if selectImage.count > 0{
                        titleBtn.setImage(UIImage.init(named: selectImage), for: .selected)
                    } else{
                        titleBtn.setImage(UIImage.init(named: normalImage), for: .selected)
                    }
                    updateInfoButtonModeWith(mode: item.buttonMode, space: item.space)
                }
            }
        } else {
            let titleNormalAttributed:NSAttributedString = item.titleNormalAttributed
            let titleSelectAttributed:NSAttributedString = item.titleSelectAttributed
            if item.buttonMode == .Done {
                titleBtn.setAttributedTitle(titleNormalAttributed, for: .normal)
                if titleSelectAttributed.length > 0 {
                    titleBtn.setAttributedTitle(titleSelectAttributed, for: .selected)
                }else{
                    titleBtn.setAttributedTitle(titleNormalAttributed, for: .selected)
                }
            } else{
                titleBtn.setAttributedTitle(titleNormalAttributed, for: .normal)
                if titleSelectAttributed.length > 0 {
                    titleBtn.setAttributedTitle(titleSelectAttributed, for: .selected)
                }else{
                    titleBtn.setAttributedTitle(titleNormalAttributed, for: .selected)
                }
                
                let normalImage:String = item.normalImage
                let selectImage:String = item.selectImage
                if normalImage.count > 0{
                    titleBtn.setImage(UIImage.init(named: normalImage), for: .normal)
                    if selectImage.count > 0{
                        titleBtn.setImage(UIImage.init(named: selectImage), for: .selected)
                    } else{
                        titleBtn.setImage(UIImage.init(named: normalImage), for: .selected)
                    }
                    updateInfoButtonModeWith(mode: item.buttonMode, space: item.space)
                }
                
            }
        }
        
    
        if  item.badge > 0 {
            titleBtn.addBadge(text: "\(item.badge)")
            let X = item.badgeX
            let Y = item.badgeY
            titleBtn.moveBadge(x: X, y: Y)
            titleBtn.showBadge()
        } else{
            titleBtn.hiddenBadge()
        }
        titleBtn.isSelected = item.isSelect
    }
    
    func updateInfoButtonModeWith(mode:CGXFixedTopGeneralTitleItemButtonMode,space:CGFloat) -> Void {
        
        if mode == .Done {
            
        } else if mode == .Top {
            titleBtn.btn_locationAdjustCGXFixedTopTitleAndImage(buttonMode: .Top, spacing: space)
        } else if mode == .Bottom {
            titleBtn.btn_locationAdjustCGXFixedTopTitleAndImage(buttonMode: .Bottom, spacing: space)
        } else if mode == .Left {
            titleBtn.btn_locationAdjustCGXFixedTopTitleAndImage(buttonMode: .Left, spacing: space)
        } else if mode == .Right {
            titleBtn.btn_locationAdjustCGXFixedTopTitleAndImage(buttonMode: .Right, spacing: space)
        }
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
