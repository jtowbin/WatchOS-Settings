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
        //let dbgPage = WatchSettingsPage(title: "Debug", cell: .SARowController, optIconName: "Debug")
    
        
        rootPage.subPages = [/*dbgPage, */RootPageSource.getTimePage(), RootPageSource.getAirplaneModePage(), RootPageSource.getBluetoothPage(), RootPageSource.getDNDPage(),  RootPageSource.getGeneralPage(), RootPageSource.getBrightnessPage(), RootPageSource.getHapticsPage(), RootPageSource.getPasscodePage()]
        
        return rootPage
    }
    
    /*
     Time
     Airplane Mode
     Bluetooth
     Do Not Disturb*/
    
    class func getTimePage() -> WatchSettingsPage {
        let timePage = WatchSettingsPage(title: "Time", cell: .SARowController, optIconName: "clock")
        let timeBtn = WatchSettingsPage(title: "Time", cell: .TimeTableRowController, optIconName: nil)
        timePage.subPages = [timeBtn]
        
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
        let dndButton = WatchSettingsPage(title: "Do Not Disturb", cell: .DNDRowController , optIconName: nil)
        dndPage.subPages = [dndButton]
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
        let oriButton = WatchSettingsPage(title: "Orientation", cell: .OrientationRowController, optIconName: nil)
        oriPage.subPages = [oriButton]
        
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
        let brButton = WatchSettingsPage(title: "Brightness & Text Size", cell: .BrightnessRowController, optIconName: nil)
        brightnessPage.subPages = [brButton]
        
        return brightnessPage
    }
    
    class func getHapticsPage() -> WatchSettingsPage {
        let hapticsPage = WatchSettingsPage(title: "Sound & Haptics", cell: .SARowController, optIconName: "sound")
        let soundButton = WatchSettingsPage(title: "Sound & Haptics", cell: .SoundRowController, optIconName: nil)
        hapticsPage.subPages = [soundButton]
        return hapticsPage
    }
    
    class func getPasscodePage() -> WatchSettingsPage {
        let passcodePage = WatchSettingsPage(title: "Passcode", cell: .SARowController, optIconName: "lock")
        let passButton = WatchSettingsPage(title: "Passcode", cell: .PasscodeRowController, optIconName: nil)
        passcodePage.subPages = [passButton]
        
        return passcodePage
    }
    
    
    
}
