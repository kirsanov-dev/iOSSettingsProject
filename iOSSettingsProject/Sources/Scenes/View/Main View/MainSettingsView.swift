//
//  MainSettingsView.swift
//  iOSSettingsProject
//
//  Created by Oleg Kirsanov on 28.10.2021.
//

import Foundation
import UIKit

final class MainSettingsView: UIView {

    // MARK: - Private properties
    
    private var model = SettingsModel()
    
    // MARK: - Views
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(StandardSettingsCell.self, forCellReuseIdentifier: StandardSettingsCell.reuseIdentifier)
        tableView.register(SwitchSettingsCell.self, forCellReuseIdentifier: SwitchSettingsCell.reuseIdentifier)
        tableView.register(WarningSettingsCell.self, forCellReuseIdentifier: WarningSettingsCell.reuseIdentifier)
        tableView.register(StatusSettingsCell.self, forCellReuseIdentifier: StatusSettingsCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 42
        tableView.frame = self.bounds
        return tableView
    }()
    
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
    
    func setupHierarchy() {
        addSubview(tableView)
    }
    
    func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension MainSettingsView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.createModels().count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.createModels()[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = model.createModels()[indexPath.section].options[indexPath.row]
        
        switch model.self {
        
        case .simpleCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: StandardSettingsCell.reuseIdentifier, for: indexPath) as? StandardSettingsCell else {
                return UITableViewCell() }
            cell.configure(with: model)
            return cell
            
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchSettingsCell.reuseIdentifier, for: indexPath) as? SwitchSettingsCell else {
                return UITableViewCell() }
            cell.configure(with: model)
            return cell
            
        case .warningCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WarningSettingsCell.reuseIdentifier, for: indexPath) as? WarningSettingsCell else {
                return UITableViewCell() }
            cell.configure(with: model)
            return cell
            
        case .statusCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: StatusSettingsCell.reuseIdentifier, for: indexPath) as? StatusSettingsCell else {
                return UITableViewCell() }
            cell.configure(with: model)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let modelType = model.createModels()[indexPath.section].options[indexPath.row]
        
        switch modelType.self {
        case .simpleCell(let model):
            model.handler()
        case .switchCell(let model):
            model.handler()
        case .warningCell(let model):
            model.handler()
        case .statusCell(let model):
            model.handler()
        }
    }
}


