//
//  InterfaceController.swift
//  SettingsApp WatchKit Extension
//
//  Created by Ákos Radványi on 2017. 04. 26..
//  Copyright © 2017. Example. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class MessageRow : NSObject {

    @IBOutlet var label: WKInterfaceLabel!

}

class InterfaceController: WKInterfaceController, WCSessionDelegate {

    @IBOutlet var messagesTable: WKInterfaceTable!

    var session : WCSession?
    var counter = 0

    @IBAction func requestInfo() {
        session?.sendMessage(["request" : "date"],
            replyHandler: { (response) in
                self.messages.append("Reply: \(response)")
            },
            errorHandler: { (error) in
                print("Error sending message: %@", error)
            }
        )
    }

    @IBAction func sendMessage() {
        counter += 1
        session?.sendMessage(["msg" : "Message \(counter)"], replyHandler: nil) { (error) in
            NSLog("%@", "Error sending message: \(error)")
        }
    }

    @IBAction func updateAppContext() {
        counter += 1
        try! session?.updateApplicationContext(["msg" : "Message \(counter)"])
    }

    @IBAction func transferUserInfo() {
        counter += 1
        session?.transferUserInfo(["msg" : "Message \(counter)"])
    }

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        messages.append("ready")
    }
    
    override func willActivate() {
        super.willActivate()

        session = WCSession.default()
        session?.delegate = self
        session?.activate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }

    // MARK: - Messages Table

    var messages = [String]() {
        didSet {
            OperationQueue.main.addOperation {
                self.updateMessagesTable()
            }
        }
    }

    func updateMessagesTable() {
        messagesTable.setNumberOfRows(messages.count, withRowType: "MessageRow")
        for (i, msg) in messages.enumerated() {
            let row = messagesTable.rowController(at: i) as! MessageRow
            row.label.setText(msg)
        }
    }

    // MARK: - WCSessionDelegate

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        NSLog("%@", "activationDidCompleteWith activationState:\(activationState) error:\(error)")
    }

    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        let msg = message["msg"]!
        self.messages.append("Message \(msg)")
        WKInterfaceDevice.current().play(.notification)
    }

    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {

        let aboutT = AboutDataModel(dict: applicationContext)
        AboutDataStore().updateStoreAboutData(adm: aboutT, bundle: "com.requinsynergy.SettingsApp.watchkitapp")
        let check = AboutDataStore().readStoreAboutData(bundle: "com.requinsynergy.SettingsApp.watchkitapp").toDictionary()
        self.messages.append("AppContext \(aboutT.toDictionary())")
   	}

    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
        let msg = userInfo["name"]!
        self.messages.append("UserInfo \(msg)")
   	}

}
