//
//  AboutDataModel.swift
//  SettingsApp
//
//  Created by Ákos Radványi on 2017. 04. 26..
//  Copyright © 2017. Example. All rights reserved.
//

import UIKit

class AboutDataModel {
    var nameText = "Apple Watch"
    var songsText = "0"
    var photosText = "0"
    var applicationText = "4"
    var capacityText = "6 GB"
    var availableText = "4.5 GB"
    var versionText = "3.2 (14V243)"
    var modelText = "A1758"
    var legalText = "Tap General > About > Legal in My Watch on the Apple Watch app on iPhone."
    var serialText = "123456"
    
    func toDictionary() -> [String:String] {
        var ret = [String:String]()
        ret["name"] = nameText
        ret["songs"] = songsText
        ret["photos"] = photosText
        ret["applications"] = applicationText
        ret["capacity"] = capacityText
        ret["available"] = availableText
        ret["version"] = versionText
        ret["model"] = modelText
        ret["legal"] = legalText
        ret["serial"] = serialText
        return ret
    }
    
    convenience init(dict: [String:Any]) {
        self.init()
        nameText = dict["name"] as? String ?? "Apple Watch"
        songsText = dict["songs"] as? String ?? "1"
        photosText = dict["photos"] as? String ?? "2"
        applicationText = dict["applications"] as? String ?? "4"
        capacityText = dict["capacity"] as? String ?? "6 GB"
        availableText = dict["available"] as? String ?? "4.5 GB"
        versionText = dict["version"] as? String ?? "3.2 (14V243)"
        modelText = dict["model"] as? String ?? "A1758"
        legalText = dict["legal"] as? String ?? "Tap General > About > Legal in My Watch on the Apple Watch app on iPhone."
        serialText = dict["serial"] as? String ?? "123456"
    }
}
