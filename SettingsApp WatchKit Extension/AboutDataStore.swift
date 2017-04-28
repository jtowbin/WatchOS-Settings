//
//  AboutDataStore.swift
//  SettingsApp
//
//  Created by Joey Towbin on 2017. 04. 26..
//  Copyright © 2017. Example. All rights reserved.
//

import UIKit

class AboutDataStore: NSObject {
    class func readStoreAboutData(bundle: String) -> AboutDataModel {
        let suitN = "group.com.requinsynergy.settingsapp"
        let defaults = UserDefaults(suiteName: suitN)
        
        let adm = AboutDataModel()
        
        adm.nameText = defaults?.string(forKey: "name") ?? "Apple Watch"
        adm.songsText = defaults?.string(forKey: "songs") ?? "0"
        adm.photosText = defaults?.string(forKey: "photos") ?? "0"
        adm.applicationText = defaults?.string(forKey: "applications") ?? "0"
        adm.capacityText = defaults?.string(forKey: "capacity") ?? "6 GB"
        adm.availableText = defaults?.string(forKey: "available") ?? "4.5 GB"
        adm.versionText = defaults?.string(forKey: "version") ?? "3.2 (14V243)"
        adm.modelText = defaults?.string(forKey: "model") ?? "A1758"
        adm.legalText = defaults?.string(forKey: "legal") ?? "Tap General > About > Legal in My Watch on the Apple Watch app on iPhone."
        adm.serialText = defaults?.string(forKey: "serial") ?? "12345"
        
        return adm
    }
    
    class func updateStoreAboutData(adm : AboutDataModel, bundle: String) {
        let suitN = "group.com.requinsynergy.settingsapp"
        
        let defaults = UserDefaults(suiteName: suitN)
        //"com.requinsynergy.SettingsApp.watchkitapp" - watch
        // - app
        defaults?.set(adm.nameText, forKey: "name")
        defaults?.set(adm.songsText, forKey: "songs")
        defaults?.set(adm.photosText, forKey: "photos")
        defaults?.set(adm.applicationText, forKey: "applications")
        defaults?.set(adm.capacityText, forKey: "capacity")
        defaults?.set(adm.availableText, forKey: "available")
        defaults?.set(adm.versionText, forKey: "version")
        defaults?.set(adm.modelText, forKey: "model")
        defaults?.set(adm.legalText, forKey: "legal")
        defaults?.set(adm.serialText, forKey: "serial")
        
        defaults?.synchronize()
    }
    
}
