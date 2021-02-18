//
//  Font+Extension.swift
//  ObjcTools
//
//  Created by douhuo on 2021/2/18.
//  Copyright © 2021 wangergang. All rights reserved.
//

@objc
extension UIFont {
    ///    根据size比例计算新的UIFont
    class func font_system(size :CGFloat) -> UIFont {
        
        let nsize = size.WIDTH()
        return UIFont.systemFont(ofSize:nsize)
    }
    
    ///   根据size比例计算新的粗体UIFont
    class func font_systemBlod(size :CGFloat) -> UIFont {
        let nsize = size.WIDTH()
        return UIFont.boldSystemFont(ofSize:nsize)
    }
    class func font_systemMedium(size :CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size.WIDTH(), weight: .medium);
    }
    class func NLFontSize(size: CGFloat) -> UIFont {
        return  UIFont.systemFont(ofSize: size.WIDTH(), weight: UIFont.Weight.light)
    }
    class func NSBFontSize(size: CGFloat) -> UIFont {
        return  UIFont.systemFont(ofSize: size.WIDTH(), weight: UIFont.Weight.semibold)
    }
    
    //MARK: 需要的数据的字体
    class func fontWith_DINAlternateFont_fontSize(_ size: CGFloat) -> UIFont {
        return UIFont(name: "DIN Alternate", size: size.WIDTH()) ?? UIFont.systemFont(ofSize:size.WIDTH())
    }
    class func fontWith_DINAlternateFont_Bold_fontSize(_ size: CGFloat) -> UIFont {
        return UIFont(name: "DINAlternate-Bold", size: size.WIDTH()) ?? UIFont.systemFont(ofSize:size.WIDTH())
    }
    
    
}

