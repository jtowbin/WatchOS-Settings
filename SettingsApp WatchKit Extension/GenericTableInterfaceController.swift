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
//This is the core of the app, using the dynamic and static cell prototypes.
class GenericTableInterfaceController: WKInterfaceController {
    @IBOutlet var tableController: WKInterfaceTable!
    var session : WCSession?
    
    //Reference for the singleton data store object
    let communicator = GlobalCommunicator.shared
    //Context of the current page. When the app starts, it's empty and will be set as the root node. After, we get it by navigation from the caller interface controller.
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
            //this is the part, which runs at app start and loads the whole navigation tree
            pageContext = RootPageSource().getRootPage()
        }
        else {
            
            //this part runs, when we are in a subpage, navigated to from a higher level
            pageContext = context as? WatchSettingsPage
        }
        
        // Configure interface objects here.
        
        //call the table loader logic
        loadDynamicTableCells()
        return
       
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        //when we load the screen, we have to set up the watch connectivity session, and set it's delegate so we can receive the updates from the phone
        self.session = WCSession.default()
        self.session?.delegate = self
        self.session?.activate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    //This code handles navigation to subpages.
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        
        /* Add back for debug screen:
        if pageContext?.pageTitle == "Settings" && rowIndex == 0 {
            pushController(withName: "InterfaceController", context: "Debug")
        }*/
        
        //When no subpages are present, stop the navigation.
        if pageContext?.subPages == nil {
            return
        }
        
        //When there are leaf nodes, we also won't navigate further.
        if rowIndex < (pageContext?.subPages?.count)! {
            if let sp = pageContext?.subPages?[rowIndex] {
                if sp.subPages == nil {
                    return
                }
            }
        }
        //Otherwise, we push the subpage with it's context
        pushController(withName: "GenericTableInterfaceController", context: pageContext!.subPages?[rowIndex])
        
    }
    
    
    //load the cells
    func loadDynamicTableCells() {
        //set up the title at the top of the watch
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
            //We set up the number of rows of the table in advance, and the rowtype from the storyboard. One page can have only cells with the same rowtype!
            tableController.setNumberOfRows(currentContext.subPages!.count,
                                            withRowType: WatchSettingsPage.cellTypeToString(type: (subPArray[0].cellType)))
        }
        
        //Get our about page dictionary (or can be used to localize/customize other pages later, if needed)
        let adata = GlobalCommunicator.shared.dataModel
        let adataDict = adata.toDictionary()
        
        for (index, page) in subPArray.enumerated() {
            switch page.cellType {
            case .DetailRowController:
                //These are the items of the about page. We set the static title, and get the custom subtitle by the textKey property from the dictionary we received from the phone.
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
                
            //Other, static prototypes. I've added them here with examples, in case you want to add custom stuff later to them.
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
            case .SiriRowController:
                break
            case .RegulatoryRowController:
                break
            case .ResetRowController:
                break
            }
            
            
        }
        
    }
    
    
}

// MARK: - WCSessionDelegate
extension GenericTableInterfaceController : WCSessionDelegate {
    
    //Watchkit session delegate functions, the context one is the important - it receives and stores the data from the phone.
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
