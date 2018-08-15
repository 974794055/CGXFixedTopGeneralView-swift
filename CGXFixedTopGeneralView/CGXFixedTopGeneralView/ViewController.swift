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
//    var manager = CGXFixedTopGeneralManager()
    
    
    lazy var vcArray:NSMutableArray = {
        var vcArray = NSMutableArray()
        let vc1 = UIViewController()
        vc1.view.backgroundColor = UIColor.orange
        let vc2 = UIViewController()
        vc2.view.backgroundColor = UIColor.red
        let vc3 = UIViewController()
        vc3.view.backgroundColor = UIColor.orange
        
        let vc4 = UIViewController()
        vc4.view.backgroundColor = UIColor.red
        let vc5 = UIViewController()
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
            //            if index == 0 {
            //                item.titleNormalAttributed = self.string(Str: titleArr[index], lineSpeace: 3, textColor: UIColor.orange, textFont: UIFont.systemFont(ofSize: 14))!
            //            }else{
            item.title = titleArr[index]
            //            }
            item.normalImage = nomArr[index]
            item.selectImage = selectArr[index]
            item.buttonMode = .Top
            //            if index == 0 {
            //
            //                item.isSelect = true
            //            }
            //            if index == 1 {
            //                item.buttonMode = .Right
            //            }
            //                if index == 2 {
            //                    item.buttonMode = .Left
            //            }
            //            if index == 3 {
            //                item.buttonMode = .Bottom
            //            }
            array.add(item)
        }
        return array
    }()
    
    lazy var narTitleArray:NSMutableArray = {
        let titleArr = ["全部","代支付","已发货","已取消","已完成"]
        let array = NSMutableArray.init()
        
        for index in 0..<titleArr.count {
            let item = CGXFixedTopGeneralTitleItem.init()
            //            if index == 0 {
            //                item.titleNormalAttributed = self.string(Str: titleArr[index], lineSpeace: 3, textColor: UIColor.orange, textFont: UIFont.systemFont(ofSize: 14))!
            //            }else{
            item.title = titleArr[index]
            //            }
            array.add(item)
        }
        return array
    }()
    var menuVC = CGXFixedTopGeneralMenuView()
    
    var indddd:NSInteger = 0
    override func viewDidLoad() {
        super.viewDidLoad()
         self.view.backgroundColor = UIColor.white

      
        titleView = CGXFixedTopGeneralTitleView.init(frame: CGRect.init(x: 40, y: 64, width: self.view.frame.size.width-80, height: 44))
        titleView.backgroundColor = UIColor.white
        titleView.delegate = self
        self.navigationItem.titleView = titleView
        let manager = CGXFixedTopGeneralTitleManager()
        manager.currentSelected = 1
        titleView.updateWithManager(DataArray: narTitleArray, Manager: manager)




         menuVC = CGXFixedTopGeneralMenuView.init(frame: CGRect.init(x: 0, y: 64, width: self.view.frame.size.width, height: self.view.frame.size.height-64-49))
        self.view.addSubview(menuVC)
        menuVC.delegate = self
        menuVC.updateMenuWith(titleAry: titleArray, vcAry: vcArray)
        
  
        
//titleView.selectCurrentInterCGXFixedTopGeneralTitleView(inter: 3)
        
//        let text = "我是测试文本，不信你看我的显示效果是不是跟你设置的一样呢，如果不是的话你来追我啊，如果追到我我就给你，哈哈哈😄！"
//        let attributeText = NSMutableAttributedString.init(string: text)
//        let count = text.count
//        //设置段落属性
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.lineSpacing = 5
//        //设置行间距 //
//        paragraphStyle.firstLineHeadIndent = 5
//        //首行缩进距离 //
//        paragraphStyle.headIndent = 10
//        //文本每一行的缩进距离 //
//        paragraphStyle.tailIndent = 20
//        //文本行末缩进距离
//        paragraphStyle.alignment = .justified
//        //文本对齐方向
//        paragraphStyle.baseWritingDirection = .leftToRight
////        //文本排序方向 //关于设置段落的更多属性可以查看官方文档： https://developer.apple.com/reference/uikit/nsmutableparagraphstyle
//        attributeText.addAttributes([kCTParagraphStyleAttributeName as NSAttributedStringKey: paragraphStyle], range: NSMakeRange(0, count))
//        //设置部分粗体
//        attributeText.addAttributes([kCTFontAttributeName as NSAttributedStringKey: UIFont.boldSystemFont(ofSize: 16)], range: NSMakeRange(7, 18))
//        //设置文本背景颜色
//        attributeText.addAttributes([kCTBackgroundColorAttributeName as NSAttributedStringKey: UIColor.yellow], range: NSMakeRange(0, count))
//        //设置前景颜色
//        attributeText.addAttributes([kCTForegroundColorAttributeName as NSAttributedStringKey: UIColor.green], range: NSMakeRange(7, 18))
//        //设置字距
//        attributeText.addAttributes([kCTKernAttributeName as NSAttributedStringKey: 5], range: NSMakeRange(0, count))
//        //设置下划线样式
//        attributeText.addAttributes([kCTUnderlineStyleAttributeName as NSAttributedStringKey: 1], range: NSMakeRange(0, count))
//        //设置下划线颜色
//        attributeText.addAttributes([kCTUnderlineColorAttributeName as NSAttributedStringKey: UIColor.red], range: NSMakeRange(0, count))
        //设置阴影
//        let shadow = NSShadow()
//        shadow.shadowOffset = CGSize(width: 2, height: 2)
//        //阴影偏移量
//        shadow.shadowColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 0.3)
//        //阴影颜色
//        attributeText.addAttributes([NSShadowAttributeName: shadow], range: NSMakeRange(0, count))
//        //设置文字特殊效果
//         attributeText.addAttributes([NSTextEffectAttributeName: NSTextEffectLetterpressStyle], range: NSMakeRange(0, count))
//        //设置字体倾斜
//        attributeText.addAttributes([NSObliquenessAttributeName: 0.7], range: NSMakeRange(0, count))
//        //设置字体扁平化
//         attributeText.addAttributes([NSExpansionAttributeName: 0.5], range: NSMakeRange(0, count))
//        //设置方向: 这里不清楚属性值要传什么,所以设置之后没有效果，有知道的朋友希望能过留言告知一下
//         attributeText.addAttributes([NSWritingDirectionAttributeName: NSWritingDirection.rightToLeft], range: NSMakeRange(0, 10))
//        //设置删除线
//        attributeText.addAttributes([NSStrikethroughStyleAttributeName: 1], range: NSMakeRange(0, count))
//       // 设置删除线颜色
//        attributeText.addAttributes([NSStrikethroughColorAttributeName: UIColor.yellow], range: NSMakeRange(0, count))
//        let label = UILabel()
//        label.backgroundColor = UIColor.lightGray
//        label.frame = CGRect(x: 40, y: 200, width: UIScreen.main.bounds.width - 80, height: 200)
//        label.numberOfLines = 0
//        label.attributedText = attributeText
//        label.sizeToFit()
//        self.view.addSubview(label)
        
    }

    //这里由于不知道在swift3.0之后如何把string.index转位Int，所以只好用比较死板的方法来进行设置 ///设置文本部分粗体显示
//    private func set(string str: String, start str1: String, end str2: String, boldSize size: CGFloat) -> (NSMutableAttributedString) {
//        let nStr = NSMutableAttributedString.init(string: str)
//        //计算range
//        let array = str.characters
//        var i = 0
//        for a in array {
//            if String(a) == str1 {
//                print(i)
//                break
//
//            }
//            i += 1
//
//        }
//        var k = 0
//        for b in array {
//            if String(b) == str2 {
//                print(k)
//                break
//
//            }
//            k += 1
//
//        }
//        nStr.addAttributes([kCTFontAttributeName as NSAttributedStringKey: UIFont.boldSystemFont(ofSize: 18)], range: NSMakeRange(i, k));
//        return nStr
//
//    }
    
    
   
    
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
    
    
 
    func collectionViewCGXFixedTopGeneralTitleView(baseView: UIView, _ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("点击",indexPath)

    }

    func selectInderCGXFixedTopGeneralMenuView(baseView: UIView, index: NSInteger) {
        print("点击的",index)

//        menuVC.updateMenuIndexWithTitle(string: "aaa", index: 0)
        
//        menuVC.updateWithBtnWithBadge(inter: 3, badge: 2)

//        menuVC.updateWithBtnWithAttributedString(normalAttributedString: self.string(Str: "bbbaa", lineSpeace: 3, textColor: UIColor.black, textFont: UIFont.systemFont(ofSize: 14))!, selectAttributedString: self.string(Str: "bbbaa", lineSpeace: 3, textColor: UIColor.red, textFont: UIFont.systemFont(ofSize: 14))!, index: 1)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

