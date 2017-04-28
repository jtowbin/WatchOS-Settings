//
//  GlobalCommunicator.swift
//  SettingsApp
//
//  Created by Ákos Radványi on 2017. 04. 28..
//  Copyright © 2017. Example. All rights reserved.
//

import UIKit

final class GlobalCommunicator {
    // MARK: - Singleton
    
    // Can't init is singleton
    private init() {
        let budi = Bundle.main.bundleIdentifier!
        NSLog("Watch bundle id: %@", budi)
        dataModel = AboutDataStore.readStoreAboutData(bundle: budi)
    }
    
    // MARK: Shared Instance
    
    static let shared = GlobalCommunicator()
    
    // MARK: Local Variable
    
    var dataModel : AboutDataModel {
        didSet {
            AboutDataStore.updateStoreAboutData(adm: dataModel, bundle: Bundle.main.bundleIdentifier!)
        }
    }
    
    
}
