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
    
    //This is the function, which sends the info to the watch.
    @IBAction func updateAppContext() {
        saveAboutChanges()
        try? connectivityHandler.session.updateApplicationContext(uiAboutModel().toDictionary())

        //NSLog("No watch is paired")
        
    }
    
    //Reset back the fields to their defaults, and save the changes.
    @IBAction func resetClicked(_ sender: Any) {
        let adm = AboutDataModel()
        updateFieldsFromModel(admodel: adm)
        saveAboutChanges()
    }
    
    //Update the UI from the saved settings
    func updateFieldsFromStore() {
            let adm = (UIApplication.shared.delegate as? AppDelegate)?.aboutData
            self.updateFieldsFromModel(admodel: adm!)
    }
    
    
    //Get the data model from the updated UI
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
    
    //Save and send changes to the watch
    func saveAboutChanges() {
        let updatedData = uiAboutModel()
        (UIApplication.shared.delegate as? AppDelegate)?.aboutData = updatedData
        
        AboutDataStore.updateStoreAboutData(adm: updatedData)
    }
    
    //Update UI helper function
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

    
    //When the view loads, we sign up for the watchkit events and update the UI from the store/defaults.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.connectivityHandler = (UIApplication.shared.delegate as? AppDelegate)?.connectivityHandler
        self.connectivityHandler?.addObserver(self, forKeyPath: "messages", options: [], context: nil)
        self.updateFieldsFromModel(admodel: ((UIApplication.shared.delegate as? AppDelegate)?.aboutData)!)
        
    }

    //To prevent memory leak, we unsubscribe.
    deinit {
        self.connectivityHandler?.removeObserver(self, forKeyPath: "messages")
    }

}
