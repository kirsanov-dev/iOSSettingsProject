//
//  SwitchSettingsCell.swift
//  iOSSettingsProject
//
//  Created by Oleg Kirsanov on 15.08.2021.
//

import UIKit

class SwitchSettingsCell: BasicCell {

    static let reuseIdentifier = "SwitchSettingsCell"

    // MARK: - Views
    
    private let cellSwitch: UISwitch = {
        let cellSwitch = UISwitch()
        return cellSwitch
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        accessoryType = .none
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Settings
    
    override func setupHierarchy() {
        super.setupHierarchy()
        contentView.addSubview(cellSwitch)
    }

    override func setupLayout() {
        super.setupLayout()
        cellSwitch.sizeToFit()
        cellSwitch.translatesAutoresizingMaskIntoConstraints = false
        cellSwitch.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        cellSwitch.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -22).isActive = true
    }
    
    public func configure(with model: SettingsSwitchOption) {
        label.text = model.title
        iconImage.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
        cellSwitch.isOn = model.isOn
    }
}

