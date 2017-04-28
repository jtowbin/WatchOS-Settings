//
//  GlobalCommunicator.swift
//  SettingsApp
//
//  Created by Joey Towbin on 2017. 04. 28..
//  Copyright © 2017. Example. All rights reserved.
//

import UIKit

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
    
    var dataModel : AboutDataModel {
        didSet {
            AboutDataStore.updateStoreAboutData(adm: dataModel)
        }
    }
    
    
}
