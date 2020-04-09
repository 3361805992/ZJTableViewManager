//
//  FormViewController.swift
//  ZJTableViewManagerExample
//
//  Created by Javen on 2018/3/5.
//  Copyright © 2018年 上海勾芒信息科技. All rights reserved.
//

import UIKit

class FormViewController: ZJBaseTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Forms"
        tableView.tableFooterView = UIView()

        manager.register(ZJTextCell.self, ZJTextItem.self)
        manager.register(ZJTextFieldCell.self, ZJTextFieldItem.self)
        manager.register(ZJSwitchCell.self, ZJSwitchItem.self)

        // Custom SectionHeader
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 40))
        label.backgroundColor = .lightGray
        label.textColor = .red
        label.text = "    Custom Section Header"
        let section = ZJTableViewSection(headerView: label)
        manager.add(section: section)

        // Custom Cell
        // Simple String
        section.add(item: ZJTableViewItem(title: "Simple String"))

        // Full length text field
        section.add(item: ZJTextFieldItem(title: nil, placeHolder: "Full length text field", text: nil, isFullLength: true, didChanged: nil))

        // Text Item
        section.add(item: ZJTextFieldItem(title: "Text Item", placeHolder: "Text", text: nil, didChanged: { item in
            if let text = (item as! ZJTextFieldItem).text {
                zj_log(text)
            }
        }))

        // Password
        let passwordItem = ZJTextFieldItem(title: "Password", placeHolder: "Password Item", text: nil, didChanged: { item in
            if let text = (item as! ZJTextFieldItem).text {
                zj_log(text)
            }
        })
        passwordItem.isSecureTextEntry = true
        section.add(item: passwordItem)

        // Switch Item
        section.add(item: ZJSwitchItem(title: "Switch Item", isOn: false, didChanged: { item in
            zj_log((item as! ZJSwitchItem).isOn)
        }))

        manager.reload()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destinationViewController.
         // Pass the selected object to the new view controller.
     }
     */
}
