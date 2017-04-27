//
//  AboutInterfaceController.swift
//  SettingsApp
//
//  Created by Joey Towbin on 2017. 04. 26..
//  Copyright © 2017. Example. All rights reserved.
//

import UIKit
import WatchKit

class AboutInterfaceController: GenericTableInterfaceController {
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        loadTableData()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        pushController(withName: "InterfaceController", context: "Time")
        /*
         
         switch rowIndex {
         case 0:
         pushController(withName: "TimePageController", context: "Time")
         case 1:
         pushController(withName: "AirplaneModeInterfaceController", context: "AirplaneMode")
         default:
         pushController(withName: "GeneralInterfaceController", context: "General")
         }*/
        
    }
}
