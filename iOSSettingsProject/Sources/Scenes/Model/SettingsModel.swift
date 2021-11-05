//
//  SettingsModel.swift
//  iOSSettingsProject
//
//  Created by Oleg Kirsanov on 25.10.2021.
//

import Foundation
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

final class SettingsModel {
    
    func createModels() -> [Section] {
        return [
            Section(options: [
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
            ]),
            Section(options: [
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
            ]),
            Section(options: [
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
            ])
        ]
    }
}
