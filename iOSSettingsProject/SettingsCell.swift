//
//  SettingsCell.swift
//  iOSSettingsProject
//
//  Created by Oleg Kirsanov on 15.08.2021.
//

import UIKit

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

class SettingsCell: BasicCell {

    static let reuseIdentifier = "SettingsCell"
    
    // MARK: - Views
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Init
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Settings
    
    override func setupHierarchy() {
        super.setupHierarchy()
    }

    override func setupLayout() {
        super.setupLayout()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        iconImage.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
    }

    public func configure(with model: SettingsOption) {
        label.text = model.title
        iconImage.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
    }
}
