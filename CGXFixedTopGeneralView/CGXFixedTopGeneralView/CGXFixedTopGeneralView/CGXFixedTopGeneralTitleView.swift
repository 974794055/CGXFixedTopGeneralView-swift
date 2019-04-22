//
//  CGXFixedTopGeneralTitleView.swift
//  CGXFixedTopGeneralView
//
//  Created by 曹贵鑫 on 2018/8/9.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

import UIKit

//enum CGXFixedTopGeneralTitleViewMode:Int {
//    case titleViewTitle  //文字
//    case titleViewAttributedString //文字图片
//     case titleViewBadge //角标
//}


class CGXFixedTopGeneralTitleView: UIView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,CGXFixedTopGeneralTitleCellDelgate {
    
    //数据源。格式 @[xx,xx,xx,xx]
    fileprivate lazy var dataArray: NSMutableArray = {
        let  array = NSMutableArray()
        return array
    }()
    //代理
    weak var delegate:CGXFixedTopGeneralTitleViewDelgate?
    
    fileprivate lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout();
        flowLayout.scrollDirection = .horizontal;
        let  MycollectionView = UICollectionView(frame: CGRect.init(x: 0, y: 0, width: frame.size.width, height: frame.size.height-manager.sliderHeight), collectionViewLayout: flowLayout)
        MycollectionView.backgroundColor = self.backgroundColor;
        MycollectionView.delegate = self;
        MycollectionView.dataSource = self;
        MycollectionView.showsVerticalScrollIndicator = false
        MycollectionView.showsHorizontalScrollIndicator = false
        MycollectionView.register(CGXFixedTopGeneralTitleCell.classForCoder(), forCellWithReuseIdentifier: "CGXFixedTopGeneralTitleCell")
        self.addSubview(MycollectionView);
        return MycollectionView
    }()
    
    fileprivate lazy var bottonView: UIView = {
        let view = UIView.init(frame: CGRect.init(x: 0, y: frame.size.height-manager.lineHeight, width: frame.size.width, height: manager.lineHeight))
        view.backgroundColor =  manager.lineColor
        self.addSubview(view)
        return view
    }()
    
    fileprivate lazy var sliderView: UIView = {
        let view = UIView.init(frame: CGRect.init(x: 0, y: frame.size.height-manager.sliderHeight, width: frame.size.width, height: manager.sliderHeight))
        view.backgroundColor =  manager.sliderColor
        self.addSubview(view)
        return view
    }()
    
    fileprivate lazy var manager:CGXFixedTopGeneralTitleManager = {
        let man = CGXFixedTopGeneralTitleManager()
        return man
    }()
    //初始化视图
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    fileprivate func updateTitleViewWithManager(WithManager:CGXFixedTopGeneralTitleManager) -> Void {
        manager = WithManager
        updateM()
    }
    fileprivate  func updateM() -> Void {
        collectionView.backgroundColor = manager.bgColor
        if manager.isLine {
            bottonView.backgroundColor = manager.lineColor
        }
        collectionView.selectItem(at: NSIndexPath.init(row: manager.currentSelected, section: 0) as IndexPath, animated: true, scrollPosition: ([]))
        collectionView.scrollToItem(at: IndexPath(row: manager.currentSelected, section: 0), at: .centeredHorizontally, animated: true)
        updatesliderView()
        selectCurrentInterCGXFixedTopGeneralTitleView(inter: manager.currentSelected)
    }
    
    fileprivate func updatesliderView() -> Void {
        if manager.isSlider {
            let btnWidth:CGFloat = frame.size.width / CGFloat(self.dataArray.count)
            var sliderW: CGFloat = btnWidth
            let sliderH: CGFloat = manager.sliderHeight
            var sliderX: CGFloat = btnWidth * CGFloat(manager.currentSelected)
            let sliderY: CGFloat = self.bounds.height - manager.sliderHeight
            
            if manager.isSliderEqual {
                if !manager.isFirst {
                    UIView.animate(withDuration: 0.25, animations: { [unowned self] in
                        self.sliderView.frame = CGRect.init(x:sliderX, y: sliderY, width: sliderW, height: sliderH)
                    })
                } else{
                    sliderView.frame = CGRect.init(x:sliderX, y: sliderY, width: sliderW, height: sliderH)
                }
            } else{
                if manager.sliderWidthScale == 0 {
                    let model:CGXFixedTopGeneralTitleItem = self.dataArray[manager.currentSelected] as! CGXFixedTopGeneralTitleItem
                    sliderW = self.getSliderWidth(model: model)
                    sliderX = sliderX + (btnWidth-sliderW)/2
                } else{
                    sliderW = btnWidth * manager.sliderWidthScale
                    sliderX = sliderX + (btnWidth * (1-manager.sliderWidthScale))/2
                }
                if !manager.isFirst {
                    UIView.animate(withDuration: 0.25, animations: { [unowned self] in
                        self.sliderView.frame = CGRect.init(x:sliderX, y: sliderY, width: sliderW, height: sliderH)
                    })
                } else{
                    sliderView.frame = CGRect.init(x:sliderX, y: sliderY, width: sliderW, height: sliderH)
                }
            }
        }
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
//MARK: - UICollectionView 代理
extension CGXFixedTopGeneralTitleView {
    
    //分区数
    internal func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    //每个分区含有的 item 个数
    
    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    //每个分区的内边距
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
    
    //最小 item 间距
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0;
    }
    
    //最小行间距
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0;
    }
    
    //item 的尺寸
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: frame.size.width / CGFloat(self.dataArray.count), height: frame.size.height-10)
    }
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if self.delegate != nil && (self.delegate?.responds(to: #selector(CGXFixedTopGeneralTitleViewDelgate.collectionViewCGXFixedTopGeneralTitleView(baseView:_:cellForItemAt:))))!{
            return (self.delegate?.collectionViewCGXFixedTopGeneralTitleView!(baseView: self, collectionView, cellForItemAt: indexPath))!
        }
        
        let cell:CGXFixedTopGeneralTitleCell!=collectionView.dequeueReusableCell(withReuseIdentifier: "CGXFixedTopGeneralTitleCell", for: indexPath) as! CGXFixedTopGeneralTitleCell
        let model:CGXFixedTopGeneralTitleItem = self.dataArray[indexPath.row] as! CGXFixedTopGeneralTitleItem
        cell.delegate = self
        cell.titleBtn.isUserInteractionEnabled = manager.isUserBtn
        cell.updateTitleBtn(item: model)
        return cell;
    }
    internal func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectCurrentInterCGXFixedTopGeneralTitleView(inter: indexPath.row)
    }
    internal func selectCGXFixedTopGeneralTitleCellBtn(cell: CGXFixedTopGeneralTitleCell) {
        let indexPath:NSIndexPath = self.collectionView.indexPath(for: cell)! as NSIndexPath
        selectCurrentInterCGXFixedTopGeneralTitleView(inter: indexPath.row)
        
    }
    /// 获取滑块的长度
    fileprivate func getSliderWidth(model: CGXFixedTopGeneralTitleItem) -> CGFloat {
        
        if model.title.count > 0 {
            guard let str = model.title as NSString? else {
                return 0
            }
            let strSize = str.boundingRect(with: CGSize.init(width: CGFloat(MAXFLOAT), height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [kCTFontAttributeName as NSAttributedStringKey : model.titleNormalFont], context: nil)
            return strSize.width
            
        }else{
            guard let str = model.titleNormalAttributed as NSAttributedString? else {
                return 0
            }
            let  strSize = str.boundingRect(with: CGSize.init(width: CGFloat(MAXFLOAT), height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, context: nil)
            return strSize.width
        }
    }
    
    fileprivate func getTextHeigh(textStr:String,font:UIFont,width:CGFloat) -> CGFloat {
        let normalText: NSString = textStr as NSString
        let size = CGSize.init(width: 300, height: bounds.height)
        let dic = NSDictionary(object: font, forKey: kCTFontAttributeName as! NSCopying)
        let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedStringKey : Any], context:nil).size
        return stringSize.height
    }
    
    fileprivate func getTexWidth(textStr:String,font:UIFont,height:CGFloat) -> CGFloat {
        let normalText: NSString = textStr as NSString
        let size = CGSize.init(width: 300, height: bounds.height)
        let dic = NSDictionary(object: font, forKey: kCTFontAttributeName as! NSCopying)
        let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedStringKey : Any], context:nil).size
        return stringSize.width
    }
}

@objc protocol CGXFixedTopGeneralTitleViewDelgate:NSObjectProtocol {
    /**代理函数*/
    @objc optional func collectionViewCGXFixedTopGeneralTitleView(baseView:UIView, _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    /*点击事件*/
    @objc optional func collectionViewCGXFixedTopGeneralTitleView(baseView:UIView, _ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) -> Void
    
}
//MARK: - 外界调用
extension CGXFixedTopGeneralTitleView {
    //更新字符串
    public func updateWithBtnWithTitle(title:String,index:NSInteger) -> Void {
        let inderPath: IndexPath = IndexPath.init(row: index, section: 0)
        let indexPathArray = [inderPath]
        let model:CGXFixedTopGeneralTitleItem = self.dataArray[index] as! CGXFixedTopGeneralTitleItem
        
        model.title = title
        model.titleNormalAttributed = NSAttributedString.init(string: "")
        model.titleSelectAttributed = NSAttributedString.init(string: "")
        
        self.collectionView.reloadItems(at: indexPathArray)
        
    }
     //更新富文本字符串
    public func updateWithBtnWithAttributedString(normalAttributedString:NSAttributedString,selectAttributedString:NSAttributedString,index:NSInteger) -> Void {
        let inderPath: IndexPath = IndexPath.init(row: index, section: 0)
        let indexPathArray = [inderPath]
        let model:CGXFixedTopGeneralTitleItem = self.dataArray[index] as! CGXFixedTopGeneralTitleItem
        model.title = ""
        model.titleNormalAttributed = normalAttributedString
        model.titleSelectAttributed = selectAttributedString
        self.collectionView.reloadItems(at: indexPathArray)
    }
    //更新角标
    public func updateBadge(index:NSInteger,badge:NSInteger) -> Void {
        let inderPath: IndexPath = IndexPath.init(row: index, section: 0)
        let indexPathArray = [inderPath]
        let model:CGXFixedTopGeneralTitleItem = self.dataArray[index] as! CGXFixedTopGeneralTitleItem
        model.badge = badge
        self.collectionView.reloadItems(at: indexPathArray)
    }
    //更新数据源
    public func updateWithManager(DataArray:NSMutableArray) -> Void {
        self.dataArray = DataArray
        collectionView.reloadData()
        updateM()
    }
    public func updateWithManager(DataArray:NSMutableArray,Manager:CGXFixedTopGeneralTitleManager) -> Void {
        self.dataArray = DataArray
        collectionView.reloadData()
        updateTitleViewWithManager(WithManager: Manager)
    }
    
    
    //选中下标
    public func selectCurrentInterCGXFixedTopGeneralTitleView(inter: NSInteger) {
        let indexPath = NSIndexPath.init(row: inter, section: 0)
        if manager.isClick {
            if !manager.isFirst {
                if manager.currentSelected == indexPath.row {
                    return
                }
            }
        }
        manager.isFirst = false
        manager.currentSelected = indexPath.row
        for index in 0..<self.dataArray.count {
            let model:CGXFixedTopGeneralTitleItem = self.dataArray[index] as! CGXFixedTopGeneralTitleItem
            if index == indexPath.row{
                model.isSelect = true
            } else{
                model.isSelect = false
            }
        }
        updatesliderView()
        collectionView.reloadData()
        if self.delegate != nil && (self.delegate?.responds(to: #selector(CGXFixedTopGeneralTitleViewDelgate.collectionViewCGXFixedTopGeneralTitleView(baseView:_:didSelectItemAt:))))!{
            self.delegate?.collectionViewCGXFixedTopGeneralTitleView!(baseView: self, collectionView, didSelectItemAt: indexPath as IndexPath)
        }
    }
}
