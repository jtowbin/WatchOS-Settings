//
//  RootPageSource.swift
//  SettingsApp
//
//  Created by Joey Towbin on 2017. 04. 26..
//  Copyright © 2017. Example. All rights reserved.
//

import UIKit

//The main navigation hyerarchy.
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
    
    
    //We create the subpages, and their children. The cell types here are the ones defined in the storyboard.
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
    
    
    //The general page has the most content. Most cells have a static page as a subPage, displaying one static cell.
    //About page has more children, you can see those in the relevant helper class.
    class func getGeneralPage() -> WatchSettingsPage {
        let generalPage = WatchSettingsPage(title: "General", cell: .SARowController, optIconName: "general")
        
        let oriPage = WatchSettingsPage(title: "Orientation", cell: .LabelRowController, optIconName: nil)
        let oriButton = WatchSettingsPage(title: "Orientation", cell: .OrientationRowController, optIconName: nil)
        oriPage.subPages = [oriButton]
        
        let wakePage = WatchSettingsPage(title: "Wake Screen", cell: .LabelRowController, optIconName: nil)
        let wakeBtn = WatchSettingsPage(title: "Wake Screen", cell: .WakeScreenRowController, optIconName: nil)
        wakePage.subPages = [wakeBtn]
        
        let wrdPage = WatchSettingsPage(title: "Wrist Detection", cell: .LabelRowController, optIconName: nil)
        let wrdButton = WatchSettingsPage(title: "Wrist Detection", cell: .WristDetectionRowController, optIconName: nil)
        wrdPage.subPages = [wrdButton]
        
        let nsPage = WatchSettingsPage(title: "Nightstand Mode", cell: .LabelRowController, optIconName: nil)
        let nsButton = WatchSettingsPage(title: "Nightstand Mode", cell: .NightstandModeRowController,     optIconName: nil)
        nsPage.subPages = [nsButton]
        
        let accessPage = WatchSettingsPage(title: "Accessibility", cell: .LabelRowController, optIconName: nil)
        let acButton = WatchSettingsPage(title: "Accessibility", cell: .AccessibilityRowController, optIconName: nil)
        accessPage.subPages = [acButton]
        
        
        let siriPage = WatchSettingsPage(title: "Siri", cell: .LabelRowController, optIconName: nil)
        let siriBtn = WatchSettingsPage(title: "Siri", cell: .SiriRowController, optIconName: nil)
        siriPage.subPages = [siriBtn]
        
        
        let regPage = WatchSettingsPage(title: "Regulatory", cell: .LabelRowController, optIconName: nil)
        let regBtn = WatchSettingsPage(title: "Regulatory", cell: .RegulatoryRowController, optIconName: nil)
        regPage.subPages = [regBtn]
        
        let resetPage = WatchSettingsPage(title: "Reset", cell: .LabelRowController, optIconName: nil)
        let resetBtn = WatchSettingsPage(title: "Reset", cell: .ResetRowController, optIconName: nil)
        resetPage.subPages = [resetBtn]
        
        //After creating the subpages, give them to the general page
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
