//
//  AboutPageSource.swift
//  SettingsApp
//
//  Created by Joey Towbin on 2017. 04. 26..
//  Copyright © 2017. Example. All rights reserved.
//

import UIKit

class AboutPageSource: NSObject {
    /*- About
    -------> Name (detail cell, black background)
    -------> Songs
    -------> Photos
    -------> Applications
    -------> Capacity
    -------> Available
    -------> Version
    -------> Model
    -------> Serial Number
    -------> MAC Address
    -------> Bluetooth
    -------> SEID
    -------> Legal Info*/
    
    class func getAboutPage() -> WatchSettingsPage {
        let aboutPage = WatchSettingsPage(title: "About", cell: .LabelRowController, optIconName: nil)
        aboutPage.subPages = nil
        
        let nameButton = KeyedLeafPageButton(keyForText: "name", title: "Name")
        let songsButton = KeyedLeafPageButton(keyForText: "songs", title: "Songs")
        let photosButton = KeyedLeafPageButton(keyForText: "photos", title: "Photos")
        let appsButton = KeyedLeafPageButton(keyForText: "applications", title: "Applications")
        let capacityButton = KeyedLeafPageButton(keyForText: "capacity", title: "Capacity")
        let avButton = KeyedLeafPageButton(keyForText: "available", title: "Available")
        let versionButton = KeyedLeafPageButton(keyForText: "version", title: "Version")
        let modelButton = KeyedLeafPageButton(keyForText: "model", title: "Model")
        let serialButton = KeyedLeafPageButton(keyForText: "serial", title: "Serial Number")
        let legalButton = KeyedLeafPageButton(keyForText: "legal", title: "Legal Info")
        
        
        aboutPage.subPages = [nameButton,songsButton, photosButton, appsButton, capacityButton, avButton, versionButton, modelButton, serialButton, legalButton]
        
        
        return aboutPage
    }
    
}
