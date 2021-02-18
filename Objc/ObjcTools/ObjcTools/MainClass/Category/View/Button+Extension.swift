//
//  Button+Extension.swift
//  ObjcTools
//
//  Created by douhuo on 2021/2/18.
//  Copyright © 2021 wangergang. All rights reserved.
//

typealias BtnAction = (UIButton)->()

extension UIButton {
 
    class func createButton(_ title : String = "",
                            titleSize : CGFloat = 32 ,
                            titleColor : UIColor = UIColor.hex_333333,
                            isWeight : Bool = false,
                            bgColor : UIColor = UIColor.clear,
                            corner : CGFloat = 0,
                            borderWidth : CGFloat = 0.0,
                            borderColor : UIColor = .clear,
                            normalImgStr : String = "",
                            selectedImgStr : String = "",
                            bgImgStr : String = ""
                            
        ) -> UIButton
    {
        let btn = UIButton.init(type: .custom)
        btn.setTitle(title, for: .normal)
        btn.backgroundColor = bgColor
        btn.setTitleColor(titleColor, for: .normal)
        btn.titleLabel?.font = isWeight ? UIFont.font_systemBlod(size: titleSize) : UIFont.font_system(size: titleSize)
        
        btn.layer.cornerRadius = corner.WIDTH()
        btn.layer.masksToBounds = true
        btn.layer.borderWidth = borderWidth.WIDTH()
        btn.layer.borderColor = borderColor.cgColor
        if normalImgStr.count > 0 {
            btn.setImage(normalImgStr.toImg(), for: .normal)
        }
        if selectedImgStr.count > 0 {
            btn.setImage(selectedImgStr.toImg(), for: .selected)
        }
        if bgImgStr.count > 0 {
            btn.setBackgroundImage(bgImgStr.toImg(), for: .normal)
            
        }
        
        return btn
    }
    
    class func createButtonWith(normarlImg: String, selectedImg : String = "") -> UIButton {
        let btn = UIButton.init(type: UIButton.ButtonType.custom)
        
        btn.setImage(UIImage.creatNamed(normarlImg), for: UIControl.State.normal)
        if selectedImg != "" {
            btn.setImage(UIImage.creatNamed(selectedImg), for: UIControl.State.selected)
        }
        
        
        return btn
    }
    
}

//MARK: - 单独各个属性的添加 - : ViewChainable 协议下的内容
///单独各个属性的添加 - : ViewChainable 协议下的内容
extension UIButton {
    /// 添加图片, 不同状态下的
    func addImg(_ imgStr : String = "", State: UIControl.State = .normal) -> Self {
        self.setImage(imgStr.toImg(), for: State)
        return self
    }
    /// 添加不同状态下的  title 颜色
    func addTitleColor(_ titleColor : UIColor = .hex_333333, State: UIControl.State = .normal) -> Self {
        self.setTitleColor(titleColor, for: State)
        return self
    }
    ///字体大小
    func fontSize(_ fontSize: CGFloat = 32, IsWeight: Bool = false) -> Self {
        self.titleLabel?.font = IsWeight ? UIFont.font_systemBlod(size: fontSize) : UIFont.font_system(size: fontSize)
        return self
    }
   
    
}





//MARK: - 自定义的
extension UIButton {

///  gei button 添加一个属性 用于记录点击tag
   private struct AssociatedKeys{
      static var actionKey = "actionKey"
   }
    
    @objc dynamic var actionDic: NSMutableDictionary? {
        set{
            objc_setAssociatedObject(self, &AssociatedKeys.actionKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY)
        }
        get{
            if let dic = objc_getAssociatedObject(self, &AssociatedKeys.actionKey) as? NSDictionary{
                return NSMutableDictionary.init(dictionary: dic)
            }
            return nil
        }
    }
     
    @objc dynamic fileprivate
    func WEG_button_add(action:@escaping  BtnAction ,for controlEvents: UIControl.Event) {
        let eventStr = NSString.init(string: String.init(describing: controlEvents.rawValue))
        if let actions = self.actionDic {
            actions.setObject(action, forKey: eventStr)
            self.actionDic = actions
        }else{
            self.actionDic = NSMutableDictionary.init(object: action, forKey: eventStr)
        }
        
        switch controlEvents {
            case .touchUpInside:
                self.addTarget(self, action: #selector(touchUpInSideBtnAction), for: .touchUpInside)
            case .touchUpOutside:
                self.addTarget(self, action: #selector(touchUpOutsideBtnAction), for: .touchUpOutside)
           
        default:
            break
            
        }
      }

      
    @objc fileprivate
    func touchUpInSideBtnAction(btn: UIButton) {
          
        if let actionDic = self.actionDic  {
            
            if let touchUpInSideAction = actionDic.object(forKey: String.init(describing: UIControl.Event.touchUpInside.rawValue)) as? BtnAction {
                touchUpInSideAction(self)
            }
        }
    }

      
    @objc fileprivate
    func touchUpOutsideBtnAction(btn: UIButton) {
        if let actionDic = self.actionDic  {
            if let touchUpOutsideBtnAction = actionDic.object(forKey:   String.init(describing: UIControl.Event.touchUpOutside.rawValue)) as? BtnAction {
                touchUpOutsideBtnAction(self)
            }
         }
      }
    
    
    @discardableResult
    func addTouchUpInSideBtnAction(_ action:@escaping BtnAction) -> UIButton {
        self.WEG_button_add(action: action, for: .touchUpInside)
          
        return self
    }
      
    @discardableResult
    func addTouchUpOutSideBtnAction(_ action:@escaping BtnAction) -> UIButton {
        self.WEG_button_add(action: action, for: .touchUpOutside)
        return self
     
    }
   
}


