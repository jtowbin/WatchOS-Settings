//
//  ViewController.swift
//  SettingsApp
//
//  Created by Joey Towbin on 2017. 04. 26..
//  Copyright © 2017. Example. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messages: UILabel!

    var connectivityHandler : ConnectivityHandler!
    var counter = 0
    
    @IBAction func sendMessage() {
        counter += 1
        connectivityHandler.session.sendMessage(["msg" : "Message \(counter)"], replyHandler: nil) { (error) in
            NSLog("%@", "Error sending message: \(error)")
        }
    }

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var songsText: UITextField!
    @IBOutlet weak var photosText: UITextField!
    @IBOutlet weak var applicationsText: UITextField!
    @IBOutlet weak var capacityText: UITextField!
    @IBOutlet weak var availableText: UITextField!
    @IBOutlet weak var versionText: UITextField!
    @IBOutlet weak var modelText: UITextField!
    @IBOutlet weak var legalText: UITextField!
    @IBOutlet weak var serialText: UITextField!
    
    
    @IBAction func updateAppContext() {
        counter += 1
        saveAboutChanges()
        try! connectivityHandler.session.updateApplicationContext(uiAboutModel().toDictionary())
    }

    @IBAction func transferUserInfo() {
        counter += 1
        connectivityHandler.session.transferUserInfo((UIApplication.shared.delegate as! AppDelegate).aboutData.toDictionary()) //"com.requinsynergy.SettingsApp").toDictionary())
        //["msg" : "Message \(counter)"])
    }
    
    //todo reduce duplication
    func updateFieldsFromStore() {
            let adm = (UIApplication.shared.delegate as? AppDelegate)?.aboutData
            self.updateFieldsFromModel(admodel: adm!)
    }
    
    
    func uiAboutModel() -> AboutDataModel {
        let adm = AboutDataModel()
        adm.nameText = nameText.text ?? "Apple Watch"
        adm.songsText = songsText.text ?? "0"
        adm.photosText = photosText.text ?? "0"
        adm.applicationText = applicationsText.text ?? "0"
        adm.capacityText = capacityText.text ?? "6 GB"
        adm.availableText = availableText.text ?? "4.5 GB"
        adm.versionText = versionText.text ?? "3.2 (14V243)"
        adm.modelText = modelText.text ?? "A1758"
        adm.legalText = legalText.text ?? "Tap General > About > Legal in My Watch on the Apple Watch app on iPhone."
        adm.serialText = serialText.text ?? "12345"
        
        return adm
    }
    
    
    func saveAboutChanges() {
        let updatedData = uiAboutModel()
        (UIApplication.shared.delegate as? AppDelegate)?.aboutData = updatedData
        
        AboutDataStore.updateStoreAboutData(adm: updatedData)
    }
    
    func updateFieldsFromModel(admodel: AboutDataModel) {
        nameText.text = admodel.nameText
        songsText.text = admodel.songsText
        photosText.text = admodel.photosText
        applicationsText.text = admodel.applicationText
        capacityText.text = admodel.capacityText
        availableText.text = admodel.availableText
        versionText.text = admodel.versionText
        modelText.text = admodel.modelText
        legalText.text = admodel.legalText
        serialText.text = admodel.serialText
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.connectivityHandler = (UIApplication.shared.delegate as? AppDelegate)?.connectivityHandler
        self.connectivityHandler?.addObserver(self, forKeyPath: "messages", options: [], context: nil)
        self.updateFieldsFromModel(admodel: ((UIApplication.shared.delegate as? AppDelegate)?.aboutData)!)
        
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "messages" {
            OperationQueue.main.addOperation {
                self.updateMessages()
            }
        }
    }

    func updateMessages() {
        self.messages.text = self.connectivityHandler.messages.joined(separator: "\n")
    }

    deinit {
        self.connectivityHandler?.removeObserver(self, forKeyPath: "messages")
    }

}
