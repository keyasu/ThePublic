//
//  ImageView+Extension.swift
//  ObjcTools
//
//  Created by douhuo on 2021/2/18.
//  Copyright © 2021 wangergang. All rights reserved.
//

//MARK: - 创建 imgView
extension UIImageView {
    
    class func creatWithImgStr(_ str: String = holderImgStr,
                               cornerRadius:CGFloat = 0.0,
                               contentMode: UIView.ContentMode = .scaleAspectFit) -> UIImageView
    {
        let imgView = UIImageView.init(image: str.toImg())
        
        imgView.contentMode = contentMode
        if cornerRadius == 0.0 {
            return imgView
        }
        imgView.layer.cornerRadius = cornerRadius.WIDTH()
        imgView.layer.masksToBounds = true
        return imgView
    }
    class func creatWithImg(_ img: UIImage = holderImgStr.toImg()) -> UIImageView {
        return UIImageView.init(image: img)
    }
    

}
//MARK: - 赋值给imgView
extension UIImageView {
    ///给imgview设置图片
    func setImg(_ imgStr: String) -> Void {
        if (imgStr.isUrl()) {
            self.kf.setImage(with: URL(string: imgStr), placeholder: holderImgStr.toImg())
        }else {
            self.image = imgStr.toImg()
        }
    }
    
}

extension UIImageView {
    
    fileprivate func saveImg(_ img: UIImage, forKey imgUrl: String) {
        
        let cache = ImageCache.default
        // 设置内存缓存的大小，默认是0
        cache.memoryStorage.config.totalCostLimit = 10 * 1024 * 1024
        // 磁盘缓存大小，默认0
        cache.diskStorage.config.sizeLimit = 50 * 1024 * 1024
        // 设置缓存周期 (默认1 week）
        //cache.diskStorage.config.expiration = .days(7)
        
        // 存储一张图片, Key 可用于后期检索资源、删除以及在删除时的一个通知参数
        cache.backgroundCleanExpiredDiskCache()// 后台清理，但不需要回调
        cache.store(img, forKey: imgUrl)
        
    }
        
    fileprivate func getImageWithUrl(_ url: String) {
        let cache = ImageCache.default
        // 判定图片是否存在
        let cached = cache.imageCachedType(forKey: url)


        
    }
}
