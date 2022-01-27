//
//  StatusSettingsCell.swift
//  iOSSettingsProject
//
//  Created by Oleg Kirsanov on 15.08.2021.
//

import UIKit

class StatusSettingsCell: BasicCell {

    static let reuseIdentifier = "StatusSettingsCell"

    // MARK: - Views
    
    private let status: UILabel = {
        let status = UILabel()
        status.numberOfLines = 1
        status.textColor = UIColor.systemGray
        return status
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Settings

    override func setupHierarchy() {
        super.setupHierarchy()
        contentView.addSubview(status)
    }

    override func setupLayout() {
        super.setupLayout()
        status.translatesAutoresizingMaskIntoConstraints = false
        status.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: Cell.statusRightIndent).isActive = true
        status.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    public func configure(with model: SettingsStatusOption) {
        label.text = model.title
        iconImage.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
        status.text = model.status
    }
}
