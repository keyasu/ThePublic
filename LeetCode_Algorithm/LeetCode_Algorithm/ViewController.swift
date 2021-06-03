//
//  ViewController.swift
//  LeetCode_Algorithm
//
//  Created by douhuo on 2021/4/27.
//

import UIKit

fileprivate struct Metric {
    static let cellid = "UITableViewCell"
}

class ViewController: UIViewController {
    lazy var tablev: UITableView = {
        let tv = UITableView.init(frame: .zero, style: .plain)
        
        
        tv.tableHeaderView = UIView()
        tv.tableFooterView = UIView()
        return tv
    }()
    
    let array = [
        ["title":"array", "toVC":"ArrayViewController"],
        ["title":"string", "toVC":"StringViewController"],
        ["title":"string1", "toVC":"StringViewController"],
        ["title":"string2", "toVC":"StringViewController"],
        ["title":"string3", "toVC":"StringViewController"],
        ["title":"string4", "toVC":"StringViewController"],
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    func setupUI() {
        tablev.delegate = self
        tablev.dataSource = self
        self.view.addSubview(tablev)
        
        tablev.frame = self.view.bounds
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: Metric.cellid)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: Metric.cellid)
        }
        let item = array[indexPath.row]
        cell?.selectionStyle = .none
        cell?.textLabel?.text = item["title"]
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = array[indexPath.row]
        let vcStr = item["toVC"] ?? ""
        guard let cls: AnyClass = NSClassFromString(vcStr),
           let clsvc = cls as? UIViewController.Type else {
        
            return
        }
        
        pushTo(clsvc.init())
        
    }
    
}
