//
//  KeyedLeafPageButton.swift
//  SettingsApp
//
//  Created by Joey Towbin on 2017. 04. 26..
//  Copyright © 2017. Example. All rights reserved.
//

import UIKit
//The cells of the about page are using this class. The 2nd rows are dynamically "translated" based on the textKey property.
class KeyedLeafPageButton: WatchSettingsPage {
    var textKey : String = "name"
    
    init(keyForText: String, title: String) {
        super.init(title: title, cell: .DetailRowController, optIconName: nil)
        textKey = keyForText
    }
}
