//
//  TableView+Extension.swift
//  ObjcTools
//
//  Created by douhuo on 2021/2/18.
//  Copyright © 2021 wangergang. All rights reserved.
//

extension UITableView {
        
    /// 注册cell
    /// - Parameter cellClass: <#cellClass description#>
    func registerFromClass(cellClass: AnyClass) {
        self.register(cellClass, forCellReuseIdentifier: NSStringFromClass(cellClass))
    }
    
    /// 注册section
    /// - Parameter cellClass: <#cellClass description#>
    func registerHeaderFooterFromClass(cellClass: AnyClass) {
        self.register(cellClass, forHeaderFooterViewReuseIdentifier: NSStringFromClass(cellClass))
    }
    
    
    
}
