//
//  Color+Extension.swift
//  ObjcTools
//
//  Created by douhuo on 2021/2/4.
//  Copyright © 2021 wangergang. All rights reserved.
//

import Foundation

@objc
extension UIColor {
    
    /// 根据HEX返回UIColor,alpha = 1.0
    
    class  func hexColor(_ hexStr:String) -> UIColor {
        if hexStr.count < 6 {
            return UIColor.hex_FFFFFF
        }
        return self.hexColor(hexStr, withAlpha: CGFloat.init(1.0))
    }
    
    
    /// 根据HEX,alpha 返回UIColor
    class  func hexColor(_ hexStr:String, withAlpha alpha:CGFloat) -> UIColor {
        //trim 空格
        let cStr = hexStr.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        guard cStr.hasPrefix("#") || cStr.count == 7 else{
            
            return UIColor.clear
        }
        
        let rstartIdx = cStr.index(cStr.startIndex, offsetBy: 1)
        let rendIdx = cStr.index(rstartIdx, offsetBy: 2)
        let rr:Range = rstartIdx..<rendIdx
        let rs = String(cStr[rr])
        
//        let gstartIdx = cStr.index(rendIdx, offsetBy: 1)
        let gendIdx = cStr.index(rendIdx, offsetBy: 2)
        let gr:Range = rendIdx..<gendIdx
        let gs = String(cStr[gr])
        
//        let bstartIdx = cStr.index(gendIdx, offsetBy: 1)
        let bendIdx  = cStr.index(gendIdx, offsetBy: 2)
        let br:Range = gendIdx..<bendIdx
        let bs = String(cStr[br])
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rs).scanHexInt32(&r)
        Scanner(string: gs).scanHexInt32(&g)
        Scanner(string: bs).scanHexInt32(&b)
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha )
        
    }
    
    // 生成随机颜色
    class func randomColor() -> UIColor {
        
        let r = CGFloat(arc4random_uniform(256))
        let g = CGFloat(arc4random_uniform(256))
        let b = CGFloat(arc4random_uniform(256))
        return UIColor(red: r/255.0, green: g/255/0, blue: b/255/0, alpha: 1.0)
    }
    
    // 根据 rgb值返回对应的 UIColor
    class func RGBColor(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat,_ a:CGFloat = 1.0) -> UIColor {
        return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    
}
@objc
extension UIColor {
    
    // 0
    open class var hex_000000: UIColor { return UIColor.hexColor("#000000") }
    
    open class var hex_000000_09: UIColor { return UIColor.hexColor("#000000", withAlpha: 0.09) }
    open class var hex_000000_20: UIColor { return UIColor.hexColor("#000000", withAlpha: 0.20) }
    open class var hex_000000_30: UIColor { return UIColor.hexColor("#000000", withAlpha: 0.30) }
    open class var hex_000000_40: UIColor { return UIColor.hexColor("#000000", withAlpha: 0.40) }
    
    open class var hex_00040B_70: UIColor { return UIColor.hexColor("#00040B", withAlpha: 0.70) }
    
    
    open class var hex_001A3D_03: UIColor { return UIColor.hexColor("#001A3D", withAlpha: 0.03) }
    open class var hex_000A1E_08: UIColor { return UIColor.hexColor("#000A1E", withAlpha: 0.08) }
    open class var hex_000A1E_10: UIColor { return UIColor.hexColor("#000A1E", withAlpha: 0.10) }
    open class var hex_000A1E_13: UIColor { return UIColor.hexColor("#000A1E", withAlpha: 0.13) }
    open class var hex_000A1E_16: UIColor { return UIColor.hexColor("#000A1E", withAlpha: 0.16) }
    open class var hex_000A1E_20: UIColor { return UIColor.hexColor("#000A1E", withAlpha: 0.20) }
    /// 直播间聊天消息背景颜色
    open class var hex_000A1E_30: UIColor { return UIColor.hexColor("#000A1E", withAlpha: 0.30) }
    /// 照片选择页面，不可选遮罩颜色
    open class var hex_000A1E_50: UIColor { return UIColor.hexColor("#000A1E", withAlpha: 0.50) }
    
    
    open class var hex_00184C: UIColor { return UIColor.hexColor("#00184C") }
    open class var hex_00184C_04: UIColor { return UIColor.hexColor("#00184C", withAlpha: 0.04) }
    open class var hex_00184C_02: UIColor { return UIColor.hexColor("#00184C", withAlpha: 0.02) }
    /// 蒙层常用的值
    open class var hex_00184C_06: UIColor { return UIColor.hexColor("#00184C", withAlpha: 0.06) }
    open class var hex_00184C_08: UIColor { return UIColor.hexColor("#00184C", withAlpha: 0.08) }
    open class var hex_00184C_10: UIColor { return UIColor.hexColor("#00184C", withAlpha: 0.10) }
    
    /// 弹窗蒙层常用值
    open class var hex_00184C_20: UIColor { return UIColor.hexColor("#00184C", withAlpha: 0.20) }
    open class var hex_00184C_31: UIColor { return UIColor.hexColor("#00184C", withAlpha: 0.31) }
    open class var hex_00184C_40: UIColor { return UIColor.hexColor("#00184C", withAlpha: 0.40) }
    open class var hex_00184C_50: UIColor { return UIColor.hexColor("#00184C", withAlpha: 0.50) }
    open class var hex_00184C_80: UIColor { return UIColor.hexColor("#00184C", withAlpha: 0.80) }
    
    open class var hex_002556_02: UIColor { return UIColor.hexColor("#002556", withAlpha: 0.02) }
    open class var hex_007EFE: UIColor { return UIColor.hexColor("#007EFE") }
    open class var hex_00B3C3: UIColor { return UIColor.hexColor("#00B3C3") }

    
    open class var hex_000D29_04: UIColor { return UIColor.hexColor("#000D29", withAlpha: 0.04) }
    open class var hex_000D29_06: UIColor { return UIColor.hexColor("#000D29", withAlpha: 0.06) }
    open class var hex_000D29_08: UIColor { return UIColor.hexColor("#000D29", withAlpha: 0.08) }

    open class var hex_00D9FF: UIColor { return UIColor.hexColor("#00D9FF") }
    open class var hex_020C21: UIColor { return UIColor.hexColor("#020C21") }
    open class var hex_027AFF: UIColor { return UIColor.hexColor("#027AFF") }
    
    
    open class var hex_0B0B0B: UIColor { return UIColor.hexColor("#0B0B0B") }
    
    // 1
    open class var hex_1A191E: UIColor { return UIColor.hexColor("#1A191E") }
    open class var hex_1F0007: UIColor { return UIColor.hexColor("#1F0007") }
    open class var hex_1F0007_04: UIColor { return UIColor.hexColor("#1F0007", withAlpha: 0.04) }
    open class var hex_1F0007_10: UIColor { return UIColor.hexColor("#1F0007", withAlpha: 0.10) }
    open class var hex_1F0007_30: UIColor { return UIColor.hexColor("#1F0007", withAlpha: 0.30) }
    
    // 2
    open class var hex_212121_97: UIColor { return UIColor.hexColor("#212121", withAlpha: 0.97) };
    open class var hex_222222: UIColor { return UIColor.hexColor("#222222") }
    
    open class var hex_262626: UIColor { return UIColor.hexColor("#262626") }
    
    open class var hex_2B2F3B: UIColor { return UIColor.hexColor("#2B2F3B") }
    
    open class var hex_2D3547: UIColor { return UIColor.hexColor("#2D3547") }
    
    // 3
    open class var hex_313242: UIColor { return UIColor.hexColor("#313242") }
    open class var hex_333333: UIColor { return UIColor.hexColor("#333333") }
    open class var hex_38373D: UIColor { return UIColor.hexColor("#38373D") }
    open class var hex_3DBDEC: UIColor { return UIColor.hexColor("#3DBDEC") }
    
    
    // 4
    open class var hex_444444: UIColor { return UIColor.hexColor("#444444") }
    open class var hex_4770F3: UIColor { return UIColor.hexColor("#4770F3") }
    
    open class var hex_474B5E: UIColor { return UIColor.hexColor("#474B5E") }
    open class var hex_4D4D4D: UIColor { return UIColor.hexColor("#4D4D4D") }
    open class var hex_4F92EB: UIColor { return UIColor.hexColor("#4F92EB") }
    
    // 5
    open class var hex_517CFB : UIColor { return UIColor.hexColor("#517CFB") }
    open class var hex_518EFF : UIColor { return UIColor.hexColor("#518EFF") }
    
    open class var hex_527EFE : UIColor { return UIColor.hexColor("#527EFE") }
    open class var hex_539BFF : UIColor { return UIColor.hexColor("#539BFF") }
    open class var hex_559CFF : UIColor { return UIColor.hexColor("#559CFF") }
    
    open class var hex_57A7FE : UIColor { return UIColor.hexColor("#57A7FE") }
    open class var hex_59CBFF : UIColor { return UIColor.hexColor("#59CBFF") }
    open class var hex_5B82F5 : UIColor { return UIColor.hexColor("#5B82F5") }
    open class var hex_5E90FF : UIColor { return UIColor.hexColor("#5E90FF") }
    open class var hex_5F91FF : UIColor { return UIColor.hexColor("#5F91FF") }
    open class var hex_5F91FF_04 : UIColor { return UIColor.hexColor("#5F91FF", withAlpha : 0.04) }
    open class var hex_5F91FF_70 : UIColor { return UIColor.hexColor("#5F91FF", withAlpha : 0.70) }
    open class var hex_5F91FF_40 : UIColor { return UIColor.hexColor("#5F91FF", withAlpha : 0.40) }
    open class var hex_5F91FF_10 : UIColor { return UIColor.hexColor("#5F91FF", withAlpha : 0.10) }
    
    
    // 6
    open class var hex_6184FF: UIColor { return UIColor.hexColor("#6184FF") }
    open class var hex_62A5FF: UIColor { return UIColor.hexColor("#62A5FF") }
    open class var hex_6297FF: UIColor { return UIColor.hexColor("#6297FF") }
    open class var hex_63CEFF_80: UIColor { return UIColor.hexColor("#63CEFF", withAlpha: 0.80) }
    open class var hex_646B7A_10: UIColor { return UIColor.hexColor("#646B7A", withAlpha: 0.10) }
    
    open class var hex_64A6FF: UIColor { return UIColor.hexColor("#64A6FF") }
    open class var hex_64A8FF: UIColor { return UIColor.hexColor("#64A8FF") }
    open class var hex_65A8FF: UIColor { return UIColor.hexColor("#65A8FF") }
    open class var hex_65B7FC: UIColor { return UIColor.hexColor("#65B7FC") }
    
    open class var hex_65C6E9: UIColor { return UIColor.hexColor("#65C6E9") }
    open class var hex_666666: UIColor { return UIColor.hexColor("#666666") }
    // 以下两个颜色，分割线常用
    open class var hex_666666_10: UIColor { return UIColor.hexColor("#666666", withAlpha: 0.10)}
    open class var hex_666666_24: UIColor { return UIColor.hexColor("#666666", withAlpha: 0.24)}
    open class var hex_66B4FF: UIColor { return UIColor.hexColor("#66B4FF") }
    open class var hex_68BFFF: UIColor { return UIColor.hexColor("#68BFFF") }
    
    open class var hex_6AC1DB: UIColor { return UIColor.hexColor("#6AC1DB") }
    open class var hex_6E77A2: UIColor { return UIColor.hexColor("#6E77A2") }
    
    // 7
    open class var hex_7197FE: UIColor { return UIColor.hexColor("#7197FE") }
    open class var hex_75F6FF: UIColor { return UIColor.hexColor("#75F6FF") }
    // 直播中弹窗，高斯模糊半透明底部背景颜色
    open class var hex_8C97A0_50: UIColor { return UIColor.hexColor("#8C97A0", withAlpha: 0.50) }
    
    open class var hex_777777: UIColor { return UIColor.hexColor("#777777") }
    open class var hex_7BCCE2: UIColor { return UIColor.hexColor("#7BCCE2") }
    open class var hex_7C7AF7: UIColor { return UIColor.hexColor("#7C7AF7") }
    
    open class var hex_7D2A94: UIColor { return UIColor.hexColor("#7D2A94") }
    
    // 8
    open class var hex_888888: UIColor { return UIColor.hexColor("#888888") }
    open class var hex_898DF3: UIColor { return UIColor.hexColor("#898DF3") }
    open class var hex_8A8E97: UIColor { return UIColor.hexColor("#8A8E97") }
    
    // 9
    open class var hex_92969C_40: UIColor { return UIColor.hexColor("#92969C", withAlpha: 0.40) }
    open class var hex_979797: UIColor { return UIColor.hexColor("#979797") }
    open class var hex_981BFF: UIColor { return UIColor.hexColor("#981BFF") }
    open class var hex_9961F8: UIColor { return UIColor.hexColor("#9961F8") }
    open class var hex_998DFF: UIColor { return UIColor.hexColor("#998DFF") }
    
    open class var hex_999990: UIColor { return UIColor.hexColor("#999990") }
    open class var hex_999999: UIColor { return UIColor.hexColor("#999999") }
    open class var hex_999999_50: UIColor { return UIColor.hexColor("#999999", withAlpha: 0.50) }
    open class var hex_999999_80: UIColor { return UIColor.hexColor("#999999", withAlpha: 0.80) }
    
    open class var hex_9AC7FF: UIColor { return UIColor.hexColor("#9AC7FF") }
    open class var hex_9C94FF: UIColor { return UIColor.hexColor("#9C94FF") }
    
    
    // A
    open class var hex_A083F1: UIColor { return UIColor.hexColor("#A083F1") }
    open class var hex_A1C1FB: UIColor { return UIColor.hexColor("#A1C1FB") }
    
    open class var hex_A282F1: UIColor { return UIColor.hexColor("#A282F1") }
    open class var hex_A4A4A4: UIColor { return UIColor.hexColor("#A4A4A4") }
    
    open class var hex_A5A5A5: UIColor { return UIColor.hexColor("#A5A5A5") }
    open class var hex_A6FFDC: UIColor { return UIColor.hexColor("#A6FFDC") }
    
    open class var hex_A823F5: UIColor { return UIColor.hexColor("#A823F5") }
    open class var hex_A8E5FF: UIColor { return UIColor.hexColor("#A8E5FF") }
    
    open class var hex_ACACAC: UIColor { return UIColor.hexColor("#ACACAC") }
    open class var hex_AE66E2: UIColor { return UIColor.hexColor("#AE66E2") }
    open class var hex_AFACAC: UIColor { return UIColor.hexColor("#AFACAC") }
    
    // B
    open class var hex_B28FFC: UIColor { return UIColor.hexColor("#B28FFC") }
    open class var hex_B5B5B5: UIColor { return UIColor.hexColor("#B5B5B5") }
    open class var hex_B7B4B4: UIColor { return UIColor.hexColor("#B7B4B4") }
    
    open class var hex_B8B8B8: UIColor { return UIColor.hexColor("#B8B8B8") }
    open class var hex_BBBBBB: UIColor { return UIColor.hexColor("#BBBBBB") }
    open class var hex_BBBBBB_00: UIColor { return UIColor.hexColor("#BBBBBB", withAlpha: 0.0) }
    open class var hex_BBBBBB_10: UIColor { return UIColor.hexColor("#BBBBBB", withAlpha: 0.10) }
    open class var hex_BBBBBB_12: UIColor { return UIColor.hexColor("#BBBBBB", withAlpha: 0.12) }
    open class var hex_BBBBBB_19: UIColor { return UIColor.hexColor("#BBBBBB", withAlpha: 0.19) }
    
    open class var hex_BCC1CE: UIColor { return UIColor.hexColor("#BCC1CE") }
    open class var hex_BDBDBE: UIColor { return UIColor.hexColor("#BDBDBE") }
    
    // C
    open class var hex_C0BDBD: UIColor { return UIColor.hexColor("#C0BDBD") }
    open class var hex_C1C1C1: UIColor { return UIColor.hexColor("#C1C1C1") }
    open class var hex_C2C0C0: UIColor { return UIColor.hexColor("#C2C0C0") }
    open class var hex_C2C6CF: UIColor { return UIColor.hexColor("#C2C6CF") }
    
    open class var hex_C5C5C5: UIColor { return UIColor.hexColor("#C5C5C5") }
    open class var hex_C6C5C5: UIColor { return UIColor.hexColor("#C6C5C5") }
    open class var hex_C7B3D8: UIColor { return UIColor.hexColor("#C7B3D8") }
    open class var hex_C8C8C8: UIColor { return UIColor.hexColor("#C8C8C8") }
    
    open class var hex_CCCCCC: UIColor { return UIColor.hexColor("#CCCCCC") }
    
    // D
    open class var hex_D1D1D1: UIColor { return UIColor.hexColor("#D1D1D1") }
    open class var hex_D1D5DB: UIColor { return UIColor.hexColor("#D1D5DB") }
    open class var hex_D5D5D5_90: UIColor { return UIColor.hexColor("#D5D5D5", withAlpha: 0.90) }
    open class var hex_D66195: UIColor { return UIColor.hexColor("#D66195") }
    open class var hex_D6D6D6: UIColor { return UIColor.hexColor("#D6D6D6") }
    
    open class var hex_D84040: UIColor { return UIColor.hexColor("#D84040") }
    open class var hex_D8D8D8: UIColor { return UIColor.hexColor("#D8D8D8") }
    
    open class var hex_DBDADA: UIColor { return UIColor.hexColor("#DBDADA") }
    open class var hex_DBEBFF: UIColor { return UIColor.hexColor("#DBEBFF") }
    open class var hex_DC55EF: UIColor { return UIColor.hexColor("#DC55EF") }
    open class var hex_DDDDDD: UIColor { return UIColor.hexColor("#DDDDDD") }
    
    // E
    open class var hex_E00101: UIColor { return UIColor.hexColor("#E00101") }
    open class var hex_E0E0E0: UIColor { return UIColor.hexColor("#E0E0E0") }
    open class var hex_E1AE06: UIColor { return UIColor.hexColor("#E1AE06") }
    open class var hex_E19BF3_80: UIColor { return UIColor.hexColor("#E19BF3", withAlpha: 0.80) }

    open class var hex_E3E3E3: UIColor { return UIColor.hexColor("#E3E3E3") }
    open class var hex_E3E3E3_40: UIColor { return UIColor.hexColor("#E3E3E3", withAlpha: 0.4) }
    open class var hex_E3E3E3_20: UIColor { return UIColor.hexColor("#E3E3E3", withAlpha: 0.20) }
    open class var hex_E2E2E2: UIColor { return UIColor.hexColor("#E2E2E2") }
    open class var hex_E4C46B: UIColor { return UIColor.hexColor("#E4C46B") }
    
    open class var hex_E6E6E6: UIColor { return UIColor.hexColor("#E6E6E6") }
    open class var hex_E72B3B: UIColor { return UIColor.hexColor("#E72B3B") }
    open class var hex_E7E7E7: UIColor { return UIColor.hexColor("#E7E7E7") }
    open class var hex_E9E9E9: UIColor { return UIColor.hexColor("#E9E9E9") }
    open class var hex_E9EBEE: UIColor { return UIColor.hexColor("#E9EBEE") }
    
    open class var hex_EB5219: UIColor { return UIColor.hexColor("#EB5219") }
    open class var hex_EC417E: UIColor { return UIColor.hexColor("#EC417E") }
    open class var hex_EC444D: UIColor { return UIColor.hexColor("#EC444D") }
    open class var hex_ECEEF2: UIColor { return UIColor.hexColor("#ECEEF2") }
    open class var hex_ECF2FF: UIColor { return UIColor.hexColor("#ECF2FF") }
    
    open class var hex_ED8415: UIColor { return UIColor.hexColor("#ED8415") }
    open class var hex_EE6363: UIColor { return UIColor.hexColor("#EE6363") }
    open class var hex_EE7A7A: UIColor { return UIColor.hexColor("#EE7A7A") }
    
    open class var hex_EEEEEE: UIColor { return UIColor.hexColor("#EEEEEE") }
    open class var hex_EF1D4D: UIColor { return UIColor.hexColor("#EF1D4D") }
    
    // F
    open class var hex_F03838: UIColor { return UIColor.hexColor("#F03838") }
    open class var hex_F19D39: UIColor { return UIColor.hexColor("#F19D39") }
    open class var hex_F1F1F1: UIColor { return UIColor.hexColor("#F1F1F1") }
    open class var hex_F2F2F2: UIColor { return UIColor.hexColor("#F2F2F2") }
    
    open class var hex_F2F3FA: UIColor { return UIColor.hexColor("#F2F3FA") }
    open class var hex_F2F8FF: UIColor { return UIColor.hexColor("#F2F8FF") }
    
    open class var hex_F33333: UIColor { return UIColor.hexColor("#F33333") }
    open class var hex_F38465: UIColor { return UIColor.hexColor("#F38465") }
    open class var hex_F3F4F8: UIColor { return UIColor.hexColor("#F3F4F8") }
    
    open class var hex_F4F4F4: UIColor { return UIColor.hexColor("#F4F4F4") }
    open class var hex_F4F4F8: UIColor { return UIColor.hexColor("#F4F4F8") }
    
    
    open class var hex_F5F5F5: UIColor { return UIColor.hexColor("#F5F5F5") }
    open class var hex_F5F5F7: UIColor { return UIColor.hexColor("#F5F5F7") }
    open class var hex_F67D5B: UIColor { return UIColor.hexColor("#F67D5B") }
    open class var hex_F6F6F6: UIColor { return UIColor.hexColor("#F6F6F6") }
    open class var hex_F6F6FF: UIColor { return UIColor.hexColor("#F6F6FF") }
    
    open class var hex_F7F8FA: UIColor { return UIColor.hexColor("#F7F8FA") }
    open class var hex_F8B938: UIColor { return UIColor.hexColor("#F8B938") }
    
    open class var hex_F8F8F8: UIColor { return UIColor.hexColor("#F8F8F8") }
    open class var hex_F8FBFF: UIColor { return UIColor.hexColor("#F8FBFF") }
    open class var hex_F9F9F9: UIColor { return UIColor.hexColor("#F9F9F9") }
    open class var hex_FAB691: UIColor { return UIColor.hexColor("#FAB691") }
    open class var hex_FAD338: UIColor { return UIColor.hexColor("#FAD338") }
        
    open class var hex_FBFDFF: UIColor { return UIColor.hexColor("#FBFDFF") }
    open class var hex_FCB146: UIColor { return UIColor.hexColor("#FCB146") }
    
    open class var hex_FD0000: UIColor { return UIColor.hexColor("#FD0000") }
    open class var hex_FD5D4F: UIColor { return UIColor.hexColor("#FD5D4F") }
    open class var hex_FE2C54: UIColor { return UIColor.hexColor("#FE2C54") }
    open class var hex_FE385E: UIColor { return UIColor.hexColor("#FE385E") }
    
    open class var hex_FEFEFF: UIColor { return UIColor.hexColor("#FEFEFF") }
    open class var hex_FE5D58: UIColor { return UIColor.hexColor("#FE5D58") }
    open class var hex_FF73B0: UIColor { return UIColor.hexColor("#FF73B0") }
    open class var hex_FEBC37: UIColor { return UIColor.hexColor("#FEBC37") }
    open class var hex_FF0000: UIColor { return UIColor.hexColor("#FF0000") }
    open class var hex_FF1C68: UIColor { return UIColor.hexColor("#FF1C68") }
    
    open class var hex_FF4A54: UIColor { return UIColor.hexColor("#FF4A54") }
    
    open class var hex_FF5151: UIColor { return UIColor.hexColor("#FF5151") }
    open class var hex_FF5B82: UIColor { return UIColor.hexColor("#FF5B82") }
    
    open class var hex_FF5F59: UIColor { return UIColor.hexColor("#FF5F59") }
    open class var hex_FF615A: UIColor { return UIColor.hexColor("#FF615A") }
    
    open class var hex_FF6666: UIColor { return UIColor.hexColor("#FF6666") }
    
    open class var hex_FF6963: UIColor { return UIColor.hexColor("#FF6963") }
    open class var hex_FF8F00: UIColor { return UIColor.hexColor("#FF8F00") }
    
    open class var hex_FFB141: UIColor { return UIColor.hexColor("#FFB141") }
    
    open class var hex_FFB600: UIColor { return UIColor.hexColor("#FFB600") }
    open class var hex_FFB689: UIColor { return UIColor.hexColor("#FFB689") }
    open class var hex_FFCF27: UIColor { return UIColor.hexColor("#FFCF27") }
    open class var hex_FFC75B: UIColor { return UIColor.hexColor("#FFC75B") }
    
    open class var hex_FFD27C: UIColor { return UIColor.hexColor("#FFD27C") }
    open class var hex_FFCB2C_80: UIColor { return UIColor.hexColor("#FFCB2C", withAlpha: 0.80) }
    
    open class var hex_FFDE50: UIColor { return UIColor.hexColor("#FFDE50") }
    open class var hex_FFDE50_70: UIColor { return UIColor.hexColor("#FFDE50", withAlpha: 0.7) }
    
    
    open class var hex_FFF7D7: UIColor { return UIColor.hexColor("#FFF7D7") }
    open class var hex_FFF9E3: UIColor { return UIColor.hexColor("#FFF9E3") }
    
    open class var hex_FFFFFF: UIColor { return UIColor.hexColor("#FFFFFF") }
    open class var hex_FFFFFF_02: UIColor { return UIColor.hexColor("#FFFFFF", withAlpha: 0.02) }
    open class var hex_FFFFFF_06: UIColor { return UIColor.hexColor("#FFFFFF", withAlpha: 0.06) }
    open class var hex_FFFFFF_10: UIColor { return UIColor.hexColor("#FFFFFF", withAlpha: 0.10) }
    open class var hex_FFFFFF_20: UIColor { return UIColor.hexColor("#FFFFFF", withAlpha: 0.20) }
    open class var hex_FFFFFF_30: UIColor { return UIColor.hexColor("#FFFFFF", withAlpha: 0.30) }
    open class var hex_FFFFFF_50: UIColor { return UIColor.hexColor("#FFFFFF", withAlpha: 0.50) }
    open class var hex_FFFFFF_80: UIColor { return UIColor.hexColor("#FFFFFF", withAlpha: 0.80) }
    
    // clear Color
    open class var hex_clear: UIColor { return UIColor.clear }
    // 随机颜色
    open class var hex_random: UIColor { return UIColor.randomColor() }
    
    
}
