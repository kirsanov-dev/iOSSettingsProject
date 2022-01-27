//
//  ViewController.swift
//  iOSSettingsProject
//
//  Created by Oleg Kirsanov on 15.08.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var settingsModel = Section.createModels()
    
    private var settingsView: MainSettingsView? {
        guard isViewLoaded else { return nil }
        return view as? MainSettingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Настройки"
        view = MainSettingsView()
        configureView()
    }
}

// MARK: - Configurations

private extension SettingsViewController {
    
    func configureView() {
        settingsView?.tableView.delegate = self
        settingsView?.tableView.dataSource = self
        settingsView?.configureView(with: settingsModel)
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingsModel.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsModel[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = settingsModel[indexPath.section].options[indexPath.row]
        
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
        let modelType = settingsModel[indexPath.section].options[indexPath.row]
        
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

