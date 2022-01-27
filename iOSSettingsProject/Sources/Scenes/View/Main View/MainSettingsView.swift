//
//  MainSettingsView.swift
//  iOSSettingsProject
//
//  Created by Oleg Kirsanov on 28.10.2021.
//

import Foundation
import UIKit

final class MainSettingsView: UIView {
    
    // MARK: - Views
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(StandardSettingsCell.self, forCellReuseIdentifier: StandardSettingsCell.reuseIdentifier)
        tableView.register(SwitchSettingsCell.self, forCellReuseIdentifier: SwitchSettingsCell.reuseIdentifier)
        tableView.register(WarningSettingsCell.self, forCellReuseIdentifier: WarningSettingsCell.reuseIdentifier)
        tableView.register(StatusSettingsCell.self, forCellReuseIdentifier: StatusSettingsCell.reuseIdentifier)
        tableView.rowHeight = 42
        tableView.frame = self.bounds
        return tableView
    }()
    
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Settings
    
    func configureView(with models: [Section]) {
        setupHierarchy()
        setupLayout()
    }
    
    private func setupHierarchy() {
        addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}


