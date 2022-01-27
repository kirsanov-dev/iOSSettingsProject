//
//  WarningSettingsCell.swift
//  iOSSettingsProject
//
//  Created by Oleg Kirsanov on 15.08.2021.
//

import UIKit

class WarningSettingsCell: BasicCell {

    static let reuseIdentifier = "WarningSettingsCell"
    
    // MARK: - Views
    
    private let warning: UILabel = {
        let warning = UILabel()
        warning.numberOfLines = 0
        warning.textColor = UIColor.white
        warning.contentMode = .scaleAspectFit
        warning.font = UIFont.systemFont(ofSize: Cell.warningFontSize)
        warning.adjustsFontSizeToFitWidth = true
        return warning
    }()
    
    private let warningContainer: UIView = {
        let warningContainer = UIView()
        warningContainer.clipsToBounds = true
        warningContainer.backgroundColor = .red
        return warningContainer
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
        contentView.addSubview(warningContainer)
        warningContainer.addSubview(warning)
    }

    override func setupLayout() {
        super.setupLayout()
        
        let warningSize: CGFloat = contentView.frame.size.height - Cell.warningContainerDeprecator
        warningContainer.translatesAutoresizingMaskIntoConstraints = false
        warningContainer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        warningContainer.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: Cell.warningContainerRightIndent).isActive = true
        warningContainer.widthAnchor.constraint(equalToConstant: warningSize).isActive = true
        warningContainer.heightAnchor.constraint(equalToConstant: warningSize).isActive = true
        warningContainer.layer.cornerRadius = warningSize / 2
        
        warning.translatesAutoresizingMaskIntoConstraints = false
        warning.centerXAnchor.constraint(equalTo: warningContainer.centerXAnchor).isActive = true
        warning.centerYAnchor.constraint(equalTo: warningContainer.centerYAnchor).isActive = true
    }
    
    public func configure(with model: SettingsWarningOption) {
        label.text = model.title
        iconImage.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
        warningContainer.backgroundColor = model.warningBackgroundColor
        warning.text = model.warningNumber
    }
}
