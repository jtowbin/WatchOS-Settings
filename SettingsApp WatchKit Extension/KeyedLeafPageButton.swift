//
//  KeyedLeafPageButton.swift
//  SettingsApp
//
//  Created by Ákos Radványi on 2017. 04. 26..
//  Copyright © 2017. Example. All rights reserved.
//

import UIKit

class KeyedLeafPageButton: WatchSettingsPage {
    var textKey : String = "name"
    
    init(keyForText: String, title: String) {
        super.init(title: title, cell: .DetailRowController, optIconName: nil)
        textKey = keyForText
    }
}
