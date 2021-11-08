//
//  ViewController.swift
//  iOSSettingsProject
//
//  Created by Oleg Kirsanov on 15.08.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var model: SettingsModel?
    
    private var tableView: MainSettingsView? {
        guard isViewLoaded else { return nil }
        return view as? MainSettingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Настройки"
        view = MainSettingsView()
        model = SettingsModel()
        configureView()
    }
}

// MARK: - Configurations

private extension SettingsViewController {
    
    func configureView() {
        guard let models = model?.createModels() else { return }
        tableView?.configureView(with: models)
    }
}

