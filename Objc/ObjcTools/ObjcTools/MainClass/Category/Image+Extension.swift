//
//  Image+Extension.swift
//  ObjcTools
//
//  Created by douhuo on 2021/2/18.
//  Copyright © 2021 wangergang. All rights reserved.
//

extension UIImage {
    
    class func creatNamed(_ imgStr: String = "") -> UIImage {
        return UIImage.init(named: imgStr) ?? UIImage()
    }
    
    class func imageFromColor(color: UIColor, viewSize: CGSize) -> UIImage {

           let rect: CGRect = CGRect(x: 0, y: 0, width: viewSize.width, height: viewSize.height)

           UIGraphicsBeginImageContext(rect.size)
           let context: CGContext = UIGraphicsGetCurrentContext()!
           context.setFillColor(color.cgColor)
           context.fill(rect)

           let image = UIGraphicsGetImageFromCurrentImageContext()

           UIGraphicsGetCurrentContext()

           return image!

       }

}


