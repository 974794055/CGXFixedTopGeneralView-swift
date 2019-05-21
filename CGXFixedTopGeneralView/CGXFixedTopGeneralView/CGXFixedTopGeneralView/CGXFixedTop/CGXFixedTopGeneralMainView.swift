//
//  CGXFixedTopGeneralTitleView.swift
//  LXFMenuPageControllerDemo
//
//  Created by 曹贵鑫 on 2018/7/21.
//  Copyright © 2018年 LXF. All rights reserved.
//

import UIKit

@objc protocol CGXFixedTopGeneralMainViewDelgate:NSObjectProtocol {
    @objc optional func selectIndexCGXFixedTopGeneralMainView(baseView:UIView,index:NSInteger) -> Void
}

class CGXFixedTopGeneralMainView: UIView,UIScrollViewDelegate {

    fileprivate var mainScrollView = UIScrollView()
    
    fileprivate var vcArray: [UIViewController] = [UIViewController]()
    
    fileprivate var currentSelected:NSInteger = 0
    //标签给外部提供的方法
    weak var delegate:CGXFixedTopGeneralMainViewDelgate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.vcArray = NSMutableArray.init() as! [UIViewController]
        
    }
    
    //加载数据
    func loadMainVC(vcAry:[UIViewController],currentSelected:Int,isScroller:Bool) {
        self.mainScrollView.isScrollEnabled = isScroller
       configMenuMainView()
        self.currentSelected = currentSelected;
        vcArray = vcAry;
        configSubview()
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

// MARK:- 配置子标题
extension CGXFixedTopGeneralMainView {
    fileprivate func configMenuMainView() {
        mainScrollView = UIScrollView()
        mainScrollView.frame = CGRect.init(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height)
        self.addSubview(mainScrollView)
        mainScrollView.showsVerticalScrollIndicator = false
        mainScrollView.showsHorizontalScrollIndicator = false
        mainScrollView.bounces  = false
        mainScrollView.isPagingEnabled = true
        //设置内容区域
        
        mainScrollView.contentSize = CGSize.init(width: self.frame.size.width, height:self.frame.size.height)
        //设置代理
        mainScrollView.delegate = self
        //滚动矩形区域到可见的区域，如果完全可见就不做任何操作
        mainScrollView.scrollRectToVisible(CGRect.init(x: 0, y: 0, width: mainScrollView.frame.size.width, height: mainScrollView.frame.size.height), animated: true)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == mainScrollView{
            let inter = NSInteger(scrollView.contentOffset.x / self.bounds.width)
            if self.currentSelected != inter{
                self.currentSelected = inter
                if self.delegate != nil && (self.delegate?.responds(to: #selector(CGXFixedTopGeneralMainViewDelgate.selectIndexCGXFixedTopGeneralMainView(baseView:index:))))!{
                    self.delegate?.selectIndexCGXFixedTopGeneralMainView!(baseView: self, index: inter)
                }
            }
        }
    }
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        if scrollView == mainScrollView{
            let inter = NSInteger(scrollView.contentOffset.x / self.bounds.width)
            if self.currentSelected != inter{
                self.currentSelected = inter
                if self.delegate != nil && (self.delegate?.responds(to: #selector(CGXFixedTopGeneralMainViewDelgate.selectIndexCGXFixedTopGeneralMainView(baseView:index:))))!{
                    self.delegate?.selectIndexCGXFixedTopGeneralMainView!(baseView: self, index: inter)
                }
            }
        }
    }
}

// MARK:- 配置子标题
extension CGXFixedTopGeneralMainView {
    fileprivate func configSubview() {
        for index in 0..<vcArray.count {
            var vc = UIViewController.init()
            vc = vcArray[index]
             vc.view.frame = CGRect.init(x: CGFloat(index) * self.bounds.width, y: 0, width: mainScrollView.frame.size.width, height: mainScrollView.frame.size.height)
            self.viewController(self)?.addChild(vc)
            mainScrollView.addSubview(vc.view)
        }
        //设置内容区域
        mainScrollView.contentSize = CGSize.init(width: self.bounds.width*CGFloat(vcArray.count), height:mainScrollView.frame.size.height)
    }
    func viewController(_ view: UIView?) -> UIViewController? {
        var next = view?.superview
        while (next != nil) {
            let nextResponder: UIResponder? = next?.next
            if (nextResponder is UINavigationController) || (nextResponder is UIViewController) {
                return nextResponder as? UIViewController
            }
            next = next?.superview
        }
        return nil
    }
}



// MARK:- 配置子标题
extension CGXFixedTopGeneralMainView {
    func selectIndexWithCGXFixedTopGeneralMainView(index:NSInteger) {
        //就变到倒数第二张的位置上
        mainScrollView.scrollRectToVisible(CGRect.init(x: self.bounds.width*CGFloat(index), y: 0, width: mainScrollView.frame.size.width, height: mainScrollView.frame.size.height), animated: false)
     }

}

