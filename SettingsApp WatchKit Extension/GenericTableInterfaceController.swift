//
//  GenericTableInterfaceController.swift
//  SettingsApp
//
//  Created by Joey Towbin on 2017. 04. 25..
//  Copyright © 2017. Example. All rights reserved.
//

import UIKit
import WatchKit
import WatchConnectivity

class GenericTableInterfaceController: WKInterfaceController {
    @IBOutlet var tableController: WKInterfaceTable!
    var session : WCSession?
    
    let stringData = ["Time", "Do Not Disturb", "Airplane Mode", "General", "Brightness & Text Size"]
    let imageData = ["time", "sleep", "time", "general", "brightness"]
    let communicator = GlobalCommunicator.shared
    
    var pageContext : WatchSettingsPage? = nil
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        //Start app: Settings
        /*
         Time
         Airplane Mode
         Bluetooth
         Do Not Disturb
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
         Brightness & Contrast
         Sound & Haptics
         Passcode
         
         
         
         */
        if context == nil {
            pageContext = RootPageSource().getRootPage()
        }
        else {
            pageContext = context as? WatchSettingsPage
        }
        
        // Configure interface objects here.
        
        
        loadDynamicTableCells()
        return
        
        switch pageContext!.pageTitle {
        case "About":
            loadAboutData()
        default:
            loadTableData()
        }
        /*
         if let val: String = context as? String {
         if val == "About" {
         loadAboutData()
         }
         else
         {
         loadTableData()
         }
         }
         else
         {
         loadTableData()
         }*/
        /* if context == nil
         {
         loadTableData()
         }
         else
         {
         loadAboutData()
         }*/
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        self.session = WCSession.default()
        self.session?.delegate = self
        self.session?.activate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        
        /* Add back for debug screen:
        if pageContext?.pageTitle == "Settings" && rowIndex == 0 {
            pushController(withName: "InterfaceController", context: "Debug")
        }*/
        if pageContext?.subPages == nil {
            return
        }
        
        if rowIndex < (pageContext?.subPages?.count)! {
            if let sp = pageContext?.subPages?[rowIndex] {
                if sp.subPages == nil {
                    return
                }
            }
        }
        
        pushController(withName: "GenericTableInterfaceController", context: pageContext!.subPages?[rowIndex])
        
        switch rowIndex {
        case 0:
            pushController(withName: "GenericTableInterfaceController", context: pageContext!.subPages?[rowIndex])
            // case 1:
        //   pushController(withName: "AirplaneModeInterfaceController", context: "AirplaneMode")
        default:
            pushController(withName: "InterfaceController", context: "Debug")
            
        }
    }
    
    
    
    func loadDynamicTableCells() {
        self.setTitle(pageContext!.pageTitle)
        let currentContext = pageContext!
        let subPArray = currentContext.subPages ?? [WatchSettingsPage]()
        //If there would be no subpages, we would not be here.
        if subPArray.isEmpty {
            tableController.setNumberOfRows(0,
                                            withRowType: WatchSettingsPage.cellTypeToString(type: .LabelRowController))
        }
        else
        {
            
            tableController.setNumberOfRows(currentContext.subPages!.count,
                                            withRowType: WatchSettingsPage.cellTypeToString(type: (subPArray[0].cellType)))
        }
        
        let adata = GlobalCommunicator.shared.dataModel
        let adataDict = adata.toDictionary()
        
        for (index, page) in subPArray.enumerated() {
            switch page.cellType {
            case .DetailRowController:
                if page is KeyedLeafPageButton {
                    let row = tableController.rowController(at: index) as! DetailRowController
                    row.labelContent.setText(page.pageTitle)
                    row.sublabelContent.setText(adataDict[ (page as! KeyedLeafPageButton).textKey])
                }
                break
            case .LabelRowController:
                let row = tableController.rowController(at: index) as! LabelRowController
                row.labelContent.setText(page.pageTitle)
                break
            case .SARowController:
                let row = tableController.rowController(at: index) as! SARowController
                row.labelContent.setText(page.pageTitle)
                row.imageContent.setImage(UIImage(named: page.optionalIconName!))
                break
            case .SwitchRowController:
                let row = tableController.rowController(at: index) as! SwitchRowController
                row.labelContent.setText(page.pageTitle)
                break
            case .SpinnerButtonRow:
                let row = tableController.rowController(at: index) as! SpinnerButtonRow
                row.labelContent.setText(page.pageTitle)
                row.headerSpinner.setImageNamed("spinner")
                break
            case .DNDRowController:
                //let row = tableController.rowController(at: index) as! DNDRowController
                break
            case .BrightnessRowController:
                //let row = tableController.rowController(at: index) as! BrightnessRowController
                break
            case .SoundRowController:
                //let row = tableController.rowController(at: index) as! SoundRowController
                break
            case .PasscodeRowController:
                //let row = tableController.rowController(at: index) as! PasscodeRowController
                break
            case .TimeTableRowController:
                //let row = tableController.rowController(at: index) as! TimeTableRowController
                break
            case .OrientationRowController:
                //let row = tableController.rowController(at: index) as! OrientationRowController
                break
            case .WakeScreenRowController:
                //let row = tableController.rowController(at: index) as! WakeScreenRowController
                break
            case .WristDetectionRowController:
                //let row = tableController.rowController(at: index) as! WristDetectionRowController
                break
            case .NightstandModeRowController:
                //let row = tableController.rowController(at: index) as! NightstandModeRowController
                break
            case .AccessibilityRowController:
                break
            }
            
            
        }
        
    }
    
    
    
    func loadTableData() {
        tableController.setNumberOfRows(stringData.count,
                                        withRowType: "SARowController")
        
        
        for (index, labelText) in stringData.enumerated() {
            let row = tableController.rowController(at: index)
                as! SARowController
            row.labelContent.setText(labelText)
            row.imageContent.setImage(UIImage(named: imageData[index]))
        }
    }
    
    func loadAboutData() {
        let adata = GlobalCommunicator.shared.dataModel
        let adataDict = adata.toDictionary()
        
        let headers = ["Name", "Songs", "Photos", "Applications", "Capacity", "Available", "Version", "Serial Number", "Legal"]
        
        let headerKeys = ["name", "songs", "photos", "applications", "capacity", "available", "version", "serial", "legal"]
        //  tableController.setRowTypes(["SARowController", "DetailRowController", "LabelRowController"])
        //rowControllerAtIndex
        tableController.setNumberOfRows(headers.count,
                                        withRowType: "DetailRowController")
        
        
        for (index, labelText) in headers.enumerated() {
            let row = tableController.rowController(at: index)
                as! DetailRowController
            row.labelContent.setText(labelText)
            row.sublabelContent.setText(adataDict[headerKeys[index]])
        }
    }
}

// MARK: - WCSessionDelegate
extension GenericTableInterfaceController : WCSessionDelegate {
    
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        
    }
    
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        
        let aboutT = AboutDataModel(dict: applicationContext)
        GlobalCommunicator.shared.dataModel = aboutT
   	}
    
    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
    
   	}
    
}
