//
//  View+Addition.swift
//  ObjcTools
//
//  Created by douhuo on 2021/2/18.
//  Copyright © 2021 wangergang. All rights reserved.
//


extension UIView {
    
    // MARK: - 常用位置属性
    public var left:CGFloat {
        get {
            return self.frame.origin.x
        }
        set(newLeft) {
            var frame = self.frame
            frame.origin.x = newLeft
            self.frame = frame
        }
    }
    
    public var top:CGFloat {
        get {
            return self.frame.origin.y
        }
        
        set(newTop) {
            var frame = self.frame
            frame.origin.y = newTop
            self.frame = frame
        }
    }
    
    public var width:CGFloat {
        get {
            return self.frame.size.width
        }
        
        set(newWidth) {
            var frame = self.frame
            frame.size.width = newWidth
            self.frame = frame
        }
    }
    
    public var height:CGFloat {
        get {
            return self.frame.size.height
        }
        
        set(newHeight) {
            var frame = self.frame
            frame.size.height = newHeight
            self.frame = frame
        }
    }
    
    public var right:CGFloat {
        get {
            return self.left + self.width
        }
    }
    
    public var bottom:CGFloat {
        get {
            return self.top + self.height
        }
    }
    
    public var centerX:CGFloat {
        get {
            return self.center.x
        }
        
        set(newCenterX) {
            var center = self.center
            center.x = newCenterX
            self.center = center
        }
    }
    
    public var centerY:CGFloat {
        get {
            return self.center.y
        }
        
        set(newCenterY) {
            var center = self.center
            center.y = newCenterY
            self.center = center
        }
    }
    
}

extension UIView: UIGestureRecognizerDelegate {
    private struct ViewAssociatedKeys{
       static var actionKey = "ViewAssociatedKeys"
    }
    
    private var clickedAction: ((Any?) -> Void)? {
        get {
            return objc_getAssociatedObject(self, &ViewAssociatedKeys.actionKey) as? (Any?) -> Void ?? { _ in }
        }
        set(clickedAction) {
            objc_setAssociatedObject(self, &ViewAssociatedKeys.actionKey, clickedAction, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    func addClickedClosure(_ clickedAction: @escaping (_ obj: Any?) -> Void) {
        self.clickedAction = clickedAction
        // hy:先判断当前是否有交互事件，如果没有的话。。。所有gesture的交互事件都会被添加进gestureRecognizers中
        if gestureRecognizers == nil {
            isUserInteractionEnabled = true
            // hy:添加单击事件
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.ViewAssociatedTap))
            tap.delegate = self
            addGestureRecognizer(tap)
        }
    }

    @objc func ViewAssociatedTap() {
        if let clickedAction = clickedAction {
            clickedAction(self)
        }
    }
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {

        if (touch.view?.superview ?? UIView()).isKind(of: UITableView.self) ||
            (touch.view?.superview ?? UIView()).isKind(of: UITableViewCell.self) ||
            (touch.view?.superview ?? UIView()).isKind(of: UICollectionView.self) ||
            (touch.view?.superview ?? UIView()).isKind(of: UICollectionViewCell.self)
        {
            return false
        }
        return true
    }
    
}




