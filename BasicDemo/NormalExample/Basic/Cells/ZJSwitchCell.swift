//
//  ZJSwitchCell.swift
//  ZJTableViewManagerExample
//
//  Created by Javen on 2018/3/7.
//  Copyright © 2018年 . All rights reserved.
//

import UIKit

class ZJSwitchItem: ZJTableViewItem {
    var title: String?
    var isOn: Bool = false
    var didChanged: ((ZJSwitchItem)->())?
    convenience init(title: String?, isOn: Bool, didChanged: ((ZJSwitchItem)->())?) {
        self.init()
        self.title = title
        self.isOn = isOn
        self.didChanged = didChanged
    }
}

class ZJSwitchCell: UITableViewCell, ZJCellProtocol {
    var item: ZJSwitchItem!

    typealias ZJCelltemClass = ZJSwitchItem

    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var switchButton: UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func cellWillAppear() {
        labelTitle.text = item.title
        switchButton.isOn = item.isOn
    }

    @IBAction func valueChanged(_ sender: UISwitch) {
        item.isOn = sender.isOn
        item.didChanged?(item)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
