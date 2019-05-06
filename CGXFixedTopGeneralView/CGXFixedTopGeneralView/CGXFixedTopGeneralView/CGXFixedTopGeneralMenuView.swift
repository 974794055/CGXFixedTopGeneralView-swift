//
//  CGXFixedTopGeneralMenuView.swift
//  CGXFixedTopGeneralView
//
//  Created by 曹贵鑫 on 2018/8/12.
// git下载链接：https://github.com/974794055/CGXFixedTopGeneralView-swift.git
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

import UIKit

class CGXFixedTopGeneralMenuView: UIView,CGXFixedTopGeneralTitleViewDelgate,CGXFixedTopGeneralMainViewDelgate {
    //代理
    weak var delegate:CGXFixedTopGeneralMenuViewDelgate?
    fileprivate var titleView = CGXFixedTopGeneralTitleView()
    fileprivate var mainView = CGXFixedTopGeneralMainView()
    fileprivate lazy var manager:CGXFixedTopGeneralTitleManager = {
        let mm = CGXFixedTopGeneralTitleManager()
        return mm
    }()
    fileprivate lazy var titleArray:NSMutableArray = {
        let arr = NSMutableArray.init()
        return arr
    }()
    fileprivate lazy var vcArray:NSMutableArray = {
        let arr = NSMutableArray.init()
        return arr
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
    }
    
    public func updateMenuWith(titleAry:NSMutableArray,vcAry:NSMutableArray) -> Void {
        self.backgroundColor = manager.bgColor
        titleArray = titleAry
        vcArray = vcAry
        let height:CGFloat = manager.titleHeight

        titleView = CGXFixedTopGeneralTitleView.init(frame: CGRect.init(x: 0, y: 0, width: frame.size.width, height: height))
        titleView.backgroundColor = UIColor.white
        titleView.delegate = self
        self.addSubview(titleView)
        
        mainView = CGXFixedTopGeneralMainView.init(frame: CGRect.init(x: 0, y: 60, width: frame.size.width, height: frame.size.height-height))
        mainView.delegate = self
        mainView.loadMainVC(vcAry: vcAry as! [UIViewController])
        self.addSubview(mainView)
        titleView.updateWithManager(DataArray: titleAry, Manager: manager)
    }
    
    public func updateMenuWith(titleAry:NSMutableArray,vcAry:NSMutableArray,Manager:CGXFixedTopGeneralTitleManager) -> Void {
        manager = Manager
        updateMenuWith(titleAry: titleAry, vcAry: vcAry)
        
    }
    //更新字符串
    public func updateMenuIndexWithTitle(string:String,index:NSInteger) -> Void {
        titleView.updateWithBtnWithTitle(title: string, index: index)
    }
    //更新富文本字符串
    public func updateWithBtnWithAttributedString(normalAttributedString:NSAttributedString,selectAttributedString:NSAttributedString,index:NSInteger) -> Void {
        titleView.updateWithBtnWithAttributedString(normalAttributedString: normalAttributedString, selectAttributedString: selectAttributedString, index: index)
    }
    
    //更新角标
    public func updateWithBtnWithBadge(index:NSInteger,badge:NSInteger) -> Void {
        titleView.updateBadge(index: index, badge: badge)
    }
    //默认选中下标
    public  func selectIndexWithCGXFixedTopGeneralMenuView(index:NSInteger) -> Void {
        titleView.selectCurrentInterCGXFixedTopGeneralTitleView(inter: index)
    }
    
    
    //点击按钮
    internal func collectionViewCGXFixedTopGeneralTitleView(baseView: UIView, _ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        mainView.selectIndexWithCGXFixedTopGeneralMainView(index: indexPath.row)
        
        if self.delegate != nil && (self.delegate?.responds(to: #selector(CGXFixedTopGeneralMenuViewDelgate.selectInderCGXFixedTopGeneralMenuView(baseView:index:))))!{
            self.delegate?.selectInderCGXFixedTopGeneralMenuView!(baseView: self, index: indexPath.row)
        }
    }
    //滑动控制器
    internal  func selectIndexCGXFixedTopGeneralMainView(baseView: UIView, index: NSInteger) {
        titleView.selectCurrentInterCGXFixedTopGeneralTitleView(inter: index)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}

@objc protocol CGXFixedTopGeneralMenuViewDelgate:NSObjectProtocol {
    /*点击事件*/
    @objc optional func selectInderCGXFixedTopGeneralMenuView(baseView:UIView, index: NSInteger) -> Void
    
}
