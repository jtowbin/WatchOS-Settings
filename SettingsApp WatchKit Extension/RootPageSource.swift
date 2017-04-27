//
//  RootPageSource.swift
//  SettingsApp
//
//  Created by Joey Towbin on 2017. 04. 26..
//  Copyright © 2017. Example. All rights reserved.
//

import UIKit

class RootPageSource {
    //Start app: Settings page
    func getRootPage() -> WatchSettingsPage {
        let rootPage = WatchSettingsPage(title: "Settings", cell: .SARowController, optIconName: "Settings")
        
        rootPage.subPages = [RootPageSource.getTimePage(), RootPageSource.getAirplaneModePage(), RootPageSource.getBluetoothPage(), RootPageSource.getDNDPage(),  RootPageSource.getGeneralPage(), RootPageSource.getBrightnessPage(), RootPageSource.getHapticsPage(), RootPageSource.getPasscodePage()]
        
        return rootPage
    }
    
    /*
     Time
     Airplane Mode
     Bluetooth
     Do Not Disturb*/
    
    class func getTimePage() -> WatchSettingsPage {
        let timePage = WatchSettingsPage(title: "Time", cell: .SARowController, optIconName: "clock")
        
        return timePage
    }
    
    class func getAirplaneModePage() -> WatchSettingsPage {
        let apmPage = WatchSettingsPage(title: "Airplane Mode", cell: .SARowController, optIconName: "airplane")
        let apmButton = WatchSettingsPage(title: "Airplane Mode", cell: .SwitchRowController, optIconName: nil)
        apmPage.subPages = [apmButton]
        apmButton.subPages = nil
        
        return apmPage
    }
    
    class func getBluetoothPage() -> WatchSettingsPage {
        let btPage = WatchSettingsPage(title: "Bluetooth", cell: .SARowController, optIconName: "bluetooth")
        let btButton = WatchSettingsPage(title: "DEVICES", cell: .SpinnerButtonRow, optIconName: nil)
        btButton.subPages = nil
        btPage.subPages = [btButton]
        return btPage
    }
    
    class func getDNDPage() -> WatchSettingsPage {
        let dndPage = WatchSettingsPage(title: "Do Not Disturb", cell: .SARowController, optIconName: "dnd")
        
        return dndPage
    }
    
    
    
    /*
     General
     - About
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
     -------> Legal Info
     - Orientation
     - Wake Screen
     - Wrist Detection
     - Nightstand Mode
     - Accessibility
     - Siri
     - Regulatory
     - Reset
     */
    
    class func getGeneralPage() -> WatchSettingsPage {
        let generalPage = WatchSettingsPage(title: "General", cell: .SARowController, optIconName: "general")
        
        let oriPage = WatchSettingsPage(title: "Orientation", cell: .LabelRowController, optIconName: nil)
        
        let wakePage = WatchSettingsPage(title: "Wake Screen", cell: .LabelRowController, optIconName: nil)
        
        let wrdPage = WatchSettingsPage(title: "Wrist Detection", cell: .LabelRowController, optIconName: nil)
        
        let nsPage = WatchSettingsPage(title: "Nightstand Mode", cell: .LabelRowController, optIconName: nil)
        
        let accessPage = WatchSettingsPage(title: "Accessibility", cell: .LabelRowController, optIconName: nil)
        let siriPage = WatchSettingsPage(title: "Siri", cell: .LabelRowController, optIconName: nil)
        let regPage = WatchSettingsPage(title: "Regulatory", cell: .LabelRowController, optIconName: nil)
        let resetPage = WatchSettingsPage(title: "Reset", cell: .LabelRowController, optIconName: nil)
        
        generalPage.subPages = [AboutPageSource.getAboutPage(), oriPage, wakePage, wrdPage, nsPage, accessPage, siriPage, regPage, resetPage]
        
        return generalPage
    }
   
    /*
     Brightness & Text Size
     Sound & Haptics
     Passcode
     */
    
    class func getBrightnessPage() -> WatchSettingsPage {
        let brightnessPage = WatchSettingsPage(title: "Brightness & Text Size", cell: .SARowController, optIconName: "brightness")
        
        
        return brightnessPage
    }
    
    class func getHapticsPage() -> WatchSettingsPage {
        let hapticsPage = WatchSettingsPage(title: "Sound & Haptics", cell: .SARowController, optIconName: "sound")
        
        return hapticsPage
    }
    
    class func getPasscodePage() -> WatchSettingsPage {
        let passcodePage = WatchSettingsPage(title: "Passcode", cell: .SARowController, optIconName: "lock")
        
        return passcodePage
    }
    
    
    
}
