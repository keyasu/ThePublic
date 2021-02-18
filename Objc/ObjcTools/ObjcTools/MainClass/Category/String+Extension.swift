//
//  String+Extension.swift
//  ObjcTools
//
//  Created by douhuo on 2021/2/18.
//  Copyright © 2021 wangergang. All rights reserved.
//


extension String {
    
    func toImg() -> UIImage {
        return UIImage.creatNamed(self)
    }
    
    
}
// MARK: - 打开 和 网络相关的
extension String {
    func openWithHiddenUIWebView() {
        let wv = UIWebView.init()
        if self.isUrl() {
            let req = URLRequest.init(url: self.transToUrl())
            wv.loadRequest(req)
        }else {
            PrintLog("不是链接")
        }
        
    }
    
    //将原始的url编码为合法的url
    func urlEncoded() -> String {
        let encodeUrlString = self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        return encodeUrlString ?? ""
    }
    //将编码后的url转换回原始的url
    func urlDecoded() -> String {
        return self.removingPercentEncoding ?? ""
    }
    func toMinutesString() -> String {
        var str = self
        if str.toInt() > 60 {
            let m = str.toInt() / 60
            let s = str.toInt() % 60
            str = "\(m):\(s)"
        }
        return str
    }
    /** 转换为 URL  */
    func transToUrl() -> URL {
        var url = URL.init(string: "https://img.mriduo.com/logo/144.png")
//        if self.isUrl() {
            if (self != "" && self.count > 0 ) {
                if self.isIncludeChineseIn() {
                    url = URL.init(string: self.urlEncoded())!
                }else {
                    url = URL.init(string: self)!
                }
                
            }
//        }
        return url!
    }
    /** 是不是 Url */
    func isUrl() -> Bool {
        if (self.hasPrefix("http://")) || (self.hasPrefix("https://"))  {
            return true
        }
        return false
    }
    
    func isIncludeChineseIn() -> Bool {
        
        for (_, value) in self.enumerated() {
            if ("\u{4E00}" <= value  && value <= "\u{9FA5}") {
                return true
            }
        }
        return false
    }
    func add(_ str: Any) -> String {
        return self+"\(str)"
    }
    
     
}
// MARK: - 时间相关的
extension String {
    /**
     *  将某个时间戳 转化成 时间
     */
    func transformTimestamptoDate(_ format: String = "YYYY-MM-dd HH:mm:ss") -> String {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        formatter.dateFormat = format
        
        let timeZone = NSTimeZone(name: "Asia/Beijing")
        if let aZone = timeZone {
            formatter.timeZone = aZone as TimeZone
        }
        let confromTimesp = Date(timeIntervalSince1970: TimeInterval(self.toDoule()))
        
        let confromTimespStr = formatter.string(from: confromTimesp)
        
        return confromTimespStr
        
    }
    
    // MARK: 时间转换为 时间戳
    /**
     *  时间转换为 时间戳
     */
    func transStringToTimeStamp(_ datefmatter: String = "YYYY-MM-dd HH:mm:ss")->String {
        
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = datefmatter
        let date = dfmatter.date(from: self)
        guard let _ = date else {
            return Date().currentTimeStamp.toString()
        }
        
        let dateStamp:TimeInterval = date!.timeIntervalSince1970
        
        let dateSt:Int = Int(dateStamp)
        print(dateSt)
        return String(dateSt)
        
    }
}
//MARK: - 属性文本专用
extension String {
    
    // FIXME: -   构建属性字体
    func attributeStrWith(sub strArr: [String], color cArr: [UIColor], fonts:[CGFloat], lineSpc: CGFloat = 0.0, lineSpecRange: NSRange = NSRange.init()) -> NSAttributedString {
        
        let result = NSMutableAttributedString.init(string: self)
        
        for index in 0..<strArr.count {
            let range: NSRange = (self as NSString).range(of: strArr[index])
            result.addAttribute(.foregroundColor, value: cArr[index], range: range)
            result.addAttribute(.font, value: UIFont.font_system(size: fonts[index]), range: range)
        }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpc.HEIGHT()
        if lineSpc != 0 {
            let lineRange: NSRange = (lineSpecRange.length == 0) ? NSRange.init(location: 0, length: self.count-1) : lineSpecRange
            
            result.addAttribute(.paragraphStyle, value: paragraphStyle, range: lineRange)
        }
        
        return result as NSAttributedString
        
    }
}

//MARK: - 设置项目中需要字符串转换的地方
extension String {
    ///粉丝团中将等级装换为需要的内容
    func toFansLevelFullImgStr() -> String {
        return "http://static.doulanlive.com/public/static_data/fans/fans_medal_\(self).png"
    }
//    - (NSString *) {
//        NSString * fansLevelImgStr =
//        [NSString stringWithFormat:@"http://static.doulanlive.com/public/static_data/fans/fans_medal_%@.png", self];
//        return fansLevelImgStr;
//    }

}
