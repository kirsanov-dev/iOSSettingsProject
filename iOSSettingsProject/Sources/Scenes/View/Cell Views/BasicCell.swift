//
//  BasicCell.swift
//  iOSSettingsProject
//
//  Created by Oleg Kirsanov on 15.08.2021.
//

import UIKit

class BasicCell: UITableViewCell {
    
    // MARK: - Views
    
    let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = Cell.containerCornerRadius
        view.layer.masksToBounds = true
        return view
    }()
    
    let iconImage: UIImageView = {
        let iconImage = UIImageView()
        iconImage.tintColor = .white
        return iconImage
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    // MARK: - Settings
    
    func setupHierarchy() {
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImage)
    }
    
    func setupLayout() {
        let containerSize: CGFloat = contentView.frame.size.height - Cell.iconContainerDeprecator
        iconContainer.translatesAutoresizingMaskIntoConstraints = false
        iconContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Cell.iconContainerLeftIndent).isActive = true
        iconContainer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        iconContainer.widthAnchor.constraint(equalToConstant: containerSize).isActive = true
        iconContainer.heightAnchor.constraint(equalToConstant: containerSize).isActive = true
        
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        iconImage.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor).isActive = true
        iconImage.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor).isActive = true
        iconImage.widthAnchor.constraint(equalToConstant: containerSize * Cell.iconSizeMultiplier).isActive = true
        iconImage.heightAnchor.constraint(equalToConstant: containerSize * Cell.iconSizeMultiplier).isActive = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: iconContainer.rightAnchor, constant: Cell.labelLeftIndent).isActive = true
    }
    
    // MARK: - View Metrics
    
    enum Cell {
        // all cells
        static let iconContainerDeprecator: CGFloat = 12
        static let cornerRadius: CGFloat = 8
        static let iconContainerLeftIndent: CGFloat = 25
        static let iconSizeMultiplier: CGFloat = 0.55
        static let labelLeftIndent: CGFloat = 15
        static let containerCornerRadius: CGFloat = 8
        // switch cell
        static let switchRightIndent: CGFloat = -22
        // warning cell
        static let warningFontSize: CGFloat = 14
        static let warningContainerDeprecator: CGFloat = 22
        static let warningContainerRightIndent: CGFloat = -20
        // status cell
        static let statusRightIndent: CGFloat = -15
    }
    
}
