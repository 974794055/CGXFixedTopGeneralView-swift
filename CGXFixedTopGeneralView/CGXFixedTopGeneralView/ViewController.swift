//
//  ViewController.swift
//  CGXFixedTopGeneralView
//
//  Created by 曹贵鑫 on 2018/8/9.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

import UIKit

class ViewController: UIViewController,CGXFixedTopGeneralTitleViewDelgate,CGXFixedTopGeneralMainViewDelgate,CGXFixedTopGeneralMenuViewDelgate {
    
    var titleView = CGXFixedTopGeneralTitleView()
    
    lazy var vcArray:NSMutableArray = {
        var vcArray = NSMutableArray()
        let vc1 = UIViewController()
        self.addChildViewController(vc1)
        vc1.view.backgroundColor = UIColor.orange
        let vc2 = UIViewController()
        self.addChildViewController(vc2)
        vc2.view.backgroundColor = UIColor.red
        let vc3 = UIViewController()
        self.addChildViewController(vc3)
        vc3.view.backgroundColor = UIColor.orange
        
        let vc4 = UIViewController()
        self.addChildViewController(vc4)
        vc4.view.backgroundColor = UIColor.red
        let vc5 = UIViewController()
        self.addChildViewController(vc5)
        vc5.view.backgroundColor = UIColor.orange
        
        vcArray = [vc1,vc2,vc3,vc4,vc5]
        return vcArray
    }()
    
    lazy var titleArray:NSMutableArray = {
        let titleArr = ["全部","代支付","已发货","已取消","已完成"]
        let nomArr = ["me_setting_store","me_setting_store","me_setting_store","me_setting_store","me_setting_store"]
        let selectArr = ["me_setting_union","me_setting_union","me_setting_union","me_setting_union","me_setting_union"]
        
        let array = NSMutableArray.init()
        
        for index in 0..<titleArr.count {
            let item = CGXFixedTopGeneralTitleItem.init()
            if index == 0 {
                item.titleNormalAttributed = self.string(Str: titleArr[index], lineSpeace: 3, textColor: UIColor.red, textFont: UIFont.systemFont(ofSize: 14))!
            }else{
                item.title = titleArr[index]
            }
            item.normalImage = nomArr[index]
            item.selectImage = selectArr[index]
            item.buttonMode = .Top
            if index == 0 {
                item.isSelect = true
            }
            if index == 1 {
                item.buttonMode = .Right
            }
            if index == 2 {
                item.buttonMode = .Left
            }
            if index == 3 {
                item.buttonMode = .Bottom
            }
            array.add(item)
        }
        return array
    }()
    
    lazy var narTitleArray:NSMutableArray = {
        let titleArr = ["全部","代支付","已发货","已取消","已完成"]
        let array = NSMutableArray.init()
        
        for index in 0..<titleArr.count {
            let item = CGXFixedTopGeneralTitleItem.init()
            item.title = titleArr[index]
            array.add(item)
        }
        return array
    }()
    var menuVC = CGXFixedTopGeneralMenuView()
    
    var indddd:NSInteger = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        //。标题按钮
        titleView = CGXFixedTopGeneralTitleView.init(frame: CGRect.init(x: 40, y: 0, width: self.view.frame.size.width-80, height: 44))
        titleView.backgroundColor = UIColor.white
        titleView.delegate = self
        self.navigationItem.titleView = titleView
        let manager = CGXFixedTopGeneralTitleManager()
        manager.currentSelected = 1
        titleView.updateWithManager(DataArray: narTitleArray, Manager: manager)
        
        
        // 菜单左右滑动
        menuVC = CGXFixedTopGeneralMenuView.init(frame: CGRect.init(x: 0, y: 88, width: self.view.frame.size.width, height: self.view.frame.size.height-88-83))
        self.view.addSubview(menuVC)
        menuVC.delegate = self
        menuVC.updateMenuWith(titleAry: titleArray, vcAry: vcArray)
        
    }
    func collectionViewCGXFixedTopGeneralTitleView(baseView: UIView, _ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("点击",indexPath)
        
    }
    
    func selectInderCGXFixedTopGeneralMenuView(baseView: UIView, index: NSInteger) {
        print("点击的",index)
        
        //        menuVC.updateMenuIndexWithTitle(string: "aaa", index: 0)
                menuVC.updateWithBtnWithBadge(index: 3, badge: 2)
        
        //        menuVC.updateWithBtnWithAttributedString(normalAttributedString: self.string(Str: "bbbaa", lineSpeace: 3, textColor: UIColor.black, textFont: UIFont.systemFont(ofSize: 14))!, selectAttributedString: self.string(Str: "bbbaa", lineSpeace: 3, textColor: UIColor.red, textFont: UIFont.systemFont(ofSize: 14))!, index: 1)
        
    }
    
    
    /** *
     设置段落样式
     * * @param lineSpacing 行高
     * @param textcolor 字体颜色
     * @param font 字体 *
     * @return 富文本
     */
    
    func string(Str str:String, lineSpeace lineSpacing: CGFloat, textColor textcolor: UIColor, textFont font: UIFont) -> NSAttributedString? {
        // 设置段落
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        // NSKernAttributeName字体间距
        let attributes = [NSAttributedStringKey.paragraphStyle: paragraphStyle, NSAttributedStringKey.kern: 1.0] as [NSAttributedStringKey : Any] as [NSAttributedStringKey : Any]
        let attriStr = NSMutableAttributedString(string: str, attributes: attributes)
        //设置字体
        attriStr.addAttribute(NSAttributedStringKey.font, value: font, range: NSMakeRange(0,str.count))
        //设置字体
        attriStr.addAttribute(NSAttributedStringKey.font, value: UIFont.systemFont(ofSize: 12), range: NSMakeRange(0,1))
        //设置字体颜色
        attriStr.addAttribute(NSAttributedStringKey.foregroundColor, value: textcolor, range: NSMakeRange(0, str.count))
        //设置文本背景颜色
        attriStr.addAttribute(NSAttributedStringKey.backgroundColor, value: UIColor.orange, range: NSMakeRange(0, 1))
        //设置背景颜色
        if #available(iOS 10.0, *) {
            attriStr.addAttribute(kCTBackgroundColorAttributeName as NSAttributedStringKey, value: UIColor.yellow, range: NSMakeRange(0, str.count))
        } else {
            // Fallback on earlier versions
        }
        return attriStr
    }
    
    
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

