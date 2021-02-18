//
//  Label+Extension.swift
//  ObjcTools
//
//  Created by douhuo on 2021/2/18.
//  Copyright © 2021 wangergang. All rights reserved.
//

import UIKit

extension UILabel {
    
    ///初始化  label
    class func creatLabel(_ text: String,
                          FontSize: CGFloat = 32,
                          IsWeight: Bool = false,
                          Color: UIColor = UIColor.hex_333333,
                          BgColor: UIColor = UIColor.clear,
                     
                          Alignment: NSTextAlignment = NSTextAlignment.left,
                          NumberOfLines: Int = 1,
                         
                          CornerRadius: CGFloat = 0.0,
                          BorderColor: UIColor = UIColor.clear,
                          BorderWidth: CGFloat = 0) -> UILabel
    {
        
        let label = UILabel()
        label.text = text
        label.font = IsWeight ? UIFont.font_systemBlod(size: FontSize) : UIFont.font_system(size: FontSize)
        label.textColor = Color
        label.backgroundColor = BgColor
        
        label.textAlignment = Alignment
        label.numberOfLines = NumberOfLines
        
        label.layer.cornerRadius = CornerRadius.HEIGHT()
        label.layer.masksToBounds = true
        label.layer.borderColor = BorderColor.cgColor
        label.layer.borderWidth = BorderWidth.WIDTH()
        
        
        return label
    }
    
    
    
}

extension UILabel {
    
    //MARK: 设置某个圆角
    func configSideRadius(rectCorners : UIRectCorner, size: CGSize, rect: CGRect) {
        
        let maskPath = UIBezierPath.init(roundedRect: rect, byRoundingCorners: rectCorners, cornerRadii: size)
        let maskLayer = CAShapeLayer.init()
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
    
}

///单独各个属性的添加 - : ViewChainable 协议下的内容
extension UILabel {
    
    ///字体大小
    func fontSize(_ fontSize: CGFloat = 32, IsWeight: Bool = false) -> Self {
        self.font = IsWeight ? UIFont.font_systemBlod(size: fontSize) : UIFont.font_system(size: fontSize)
        return self
    }
    ///字体大小
    func font(_ font: UIFont = UIFont.font_system(size: 28)) -> Self {
        self.font = font
        return self
    }
    
    /// 字体颜色
    func textColor(_ textcolor: UIColor = UIColor.hex_333333) -> Self {
        self.textColor = textcolor
        return self
    }
    
    /// 字体居中
    func textAlignment(_ textAlignment: NSTextAlignment = NSTextAlignment.left) -> Self {
        self.textAlignment = textAlignment
        return self
    }
    /// 文本的行数
    func numberOfLines(_ numberOfLines: Int = 0) -> Self {
        self.numberOfLines = numberOfLines
        return self
    }


}
