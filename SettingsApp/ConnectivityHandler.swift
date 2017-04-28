//
//  ConnectivityHandler.swift
//  SettingsApp
//
//  Created by Joey Towbin on 2017. 04. 26..
//  Copyright © 2017. Example. All rights reserved.
//

import Foundation
import WatchConnectivity
import AudioToolbox

class ConnectivityHandler : NSObject, WCSessionDelegate {

    var session = WCSession.default()

    dynamic var messages = [String]()

    override init() {
        super.init()

        session.delegate = self
        session.activate()

        NSLog("%@", "Paired Watch: \(session.isPaired), Watch App Installed: \(session.isWatchAppInstalled)")
    }

    // MARK: - WCSessionDelegate

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        NSLog("%@", "activationDidCompleteWith activationState:\(activationState) error:\(error)")
    }

    func sessionDidBecomeInactive(_ session: WCSession) {
        NSLog("%@", "sessionDidBecomeInactive: \(session)")
    }

    func sessionDidDeactivate(_ session: WCSession) {
        NSLog("%@", "sessionDidDeactivate: \(session)")
    }

    func sessionWatchStateDidChange(_ session: WCSession) {
        NSLog("%@", "sessionWatchStateDidChange: \(session)")
    }

    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        NSLog("didReceiveMessage: %@", message)
        if message["request"] as? String == "date" {
            replyHandler(AboutDataStore.readStoreAboutData(bundle: "com.requinsynergy.SettingsApp").toDictionary())
            //["date" : "\(Date())"])
        }
    }

    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        let msg = message["msg"]!
        self.messages.append("Message \(msg)")
        AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
    }

    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        let msg = applicationContext["msg"]!
        self.messages.append("AppContext \(msg)")
   	}

    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
        let msg = userInfo["msg"]!
        self.messages.append("UserInfo \(msg)")
   	}
    
}
