//
//  Settings.swift
//  iOSSettingsProject
//
//  Created by Oleg Kirsanov on 25.10.2021.
//

import Foundation
import UIKit

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

struct SettingsSwitchOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    var isOn: Bool
    let handler: (() -> Void)
}

struct SettingsWarningOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    var warningNumber: String
    let warningBackgroundColor: UIColor
    let handler: (() -> Void)
}

struct SettingsStatusOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    var status: String
    let handler: (() -> Void)
}


