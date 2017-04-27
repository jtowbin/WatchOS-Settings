//
//  WatchSettingsPage.swift
//  SettingsApp
//
//  Created by Joey Towbin on 2017. 04. 26..
//  Copyright © 2017. Example. All rights reserved.
//

import UIKit

class WatchSettingsPage {
    var pageTitle: String = "Settings"
    var cellType: WatchSettingsCellType = .SARowController
    var subPages: [WatchSettingsPage]? = nil
    var optionalIconName: String? = nil
    
    init(title: String, cell: WatchSettingsCellType, optIconName: String?) {
        pageTitle = title
        optionalIconName = optIconName
        cellType = cell
    }
    
    enum WatchSettingsCellType {
        case SARowController
        case DetailRowController
        case LabelRowController
        case SwitchRowController
        case SpinnerButtonRow
        case DNDRowController
        case BrightnessRowController
        case SoundRowController
    }
    
    class func cellTypeToString(type: WatchSettingsCellType) -> String {
        switch type {
        case .SARowController:
            return "SARowController"
        case .DetailRowController:
            return "DetailRowController"
        case .LabelRowController:
            return "LabelRowController"
        case .SwitchRowController:
            return "SwitchRowController"
        case .SpinnerButtonRow:
            return "SpinnerButtonRow"
        case .DNDRowController:
            return "DNDRowController"
        case .BrightnessRowController:
            return "BrightnessRowController"
        case .SoundRowController:
            return "SoundRowController"
        
        }
    }
}