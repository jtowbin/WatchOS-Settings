//
//  GlobalCommunicator.swift
//  SettingsApp
//
//  Created by Joey Towbin on 2017. 04. 28..
//  Copyright © 2017. Example. All rights reserved.
//

import UIKit

//This singleton class helps us to save some resources and make the app more robust, as all the pages will have ony one data store object reference, instead of recreating it always.
final class GlobalCommunicator {
    // MARK: - Singleton
    
    // Can't init is singleton
    private init() {
        let budi = AboutDataStore.appGroupName
        NSLog("Watch app group id: %@", budi)
        dataModel = AboutDataStore.readStoreAboutData()
    }
    
    // MARK: Shared Instance
    
    static let shared = GlobalCommunicator()
    
    // MARK: Local Variable
    
    //If the dataModel is updated, we persist it right away. This happens, when the app receives a context update from the iPhone.
    var dataModel : AboutDataModel {
        didSet {
            AboutDataStore.updateStoreAboutData(adm: dataModel)
        }
    }
    
    
}
