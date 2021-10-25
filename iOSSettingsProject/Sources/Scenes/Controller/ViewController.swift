//
//  ViewController.swift
//  iOSSettingsProject
//
//  Created by Oleg Kirsanov on 15.08.2021.
//

import UIKit

struct Section {
    let options: [SettingsOptionType]
}

enum SettingsOptionType {
    case simpleCell(model: SettingsOption)
    case switchCell(model: SettingsSwitchOption)
    case warningCell(model: SettingsWarningOption)
    case statusCell(model: SettingsStatusOption)
}

class ViewController: UIViewController {

    // MARK: - Views
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(SettingsCell.self, forCellReuseIdentifier: SettingsCell.reuseIdentifier)
        tableView.register(SwitchSettingsCell.self, forCellReuseIdentifier: SwitchSettingsCell.reuseIdentifier)
        tableView.register(WarningSettingsCell.self, forCellReuseIdentifier: WarningSettingsCell.reuseIdentifier)
        tableView.register(StatusSettingsCell.self, forCellReuseIdentifier: StatusSettingsCell.reuseIdentifier)
        return tableView
    }()
    
    var models = [Section]()
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Настройки"
        configureTableView()
        configureSections()
    }
    
    // MARK: - Configure
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 42
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }
    
    func configureSections() {
        models.append(Section(options: [
            .switchCell(model: SettingsSwitchOption(title: "Авиарежим", icon: UIImage(systemName: "airplane"), iconBackgroundColor: UIColor.systemOrange, isOn: false){
            }),
            .statusCell(model: SettingsStatusOption(title: "Wi-Fi", icon: UIImage(systemName: "wifi"), iconBackgroundColor: UIColor.systemBlue, status: "Не подключено"){
                print("Выбрана ячейка Wi-Fi")
            }),
            .statusCell(model: SettingsStatusOption(title: "Bluetooth", icon: UIImage(named: "bluetooth"), iconBackgroundColor: UIColor.systemBlue, status: "Вкл."){
                print("Выбрана ячейка Bluetooth")
            }),
            .simpleCell(model: SettingsOption(title: "Сотовая связь", icon: UIImage(named: "network_cell"), iconBackgroundColor: UIColor.systemGreen){
                print("Выбрана ячейка Сотовая связь")
            }),
            .simpleCell(model: SettingsOption(title: "Режим модема", icon: UIImage(named: "square_on_square"), iconBackgroundColor: UIColor.systemGreen){
                print("Выбрана ячейка Режим модема")
            }),
            .switchCell(model: SettingsSwitchOption(title: "VPN", icon: UIImage(named: "vpn_key"), iconBackgroundColor: UIColor.systemBlue, isOn: false){
            })
        ]))
        
        models.append(Section(options: [
            .simpleCell(model: SettingsOption(title: "Уведомления", icon: UIImage(named: "notifications"), iconBackgroundColor: UIColor.systemRed){
                print("Выбрана ячейка Уведомления")
            }),
            .simpleCell(model: SettingsOption(title: "Звуки, тактильные сигналы", icon: UIImage(named: "volume_down"), iconBackgroundColor: UIColor.magenta){
                print("Выбрана ячейка Звуки, тактильные сигналы")
            }),
            .simpleCell(model: SettingsOption(title: "Не беспокоить", icon: UIImage(named: "do_not_disturb_on"), iconBackgroundColor: UIColor.systemPurple){
                print("Выбрана ячейка Не беспокоить")
            }),
            .simpleCell(model: SettingsOption(title: "Экранное время", icon: UIImage(named: "hourglass_empty"), iconBackgroundColor: UIColor.systemPurple){
                print("Выбрана ячейка Экранное время")
            })
        ]))
        
        models.append(Section(options: [
            .warningCell(model: SettingsWarningOption(title: "Основные", icon: UIImage(systemName: "gear"), iconBackgroundColor: UIColor.systemGray, warningNumber: "1", warningBackgroundColor: UIColor.systemRed){
                print("Выбрана ячейка Основные")
            }),
            .simpleCell(model: SettingsOption(title: "Пункт управления", icon: UIImage(named: "dvr"), iconBackgroundColor: UIColor.systemGray){
                print("Выбрана ячейка Пункт управления")
            }),
            .simpleCell(model: SettingsOption(title: "Экран и яркость", icon: UIImage(named: "textformat"), iconBackgroundColor: UIColor.systemBlue){
                print("Выбрана ячейка Экран и яркость")
            }),
                .simpleCell(model: SettingsOption(title: "Экран \"Домой\"", icon: UIImage(named: "House Fill"), iconBackgroundColor: UIColor.systemGreen){
                print("Выбрана ячейка Экран \"Домой\"")
            })
        ]))
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.self {
        
        case .simpleCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.reuseIdentifier, for: indexPath) as? SettingsCell else {
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
        let modelType = models[indexPath.section].options[indexPath.row]
        
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


