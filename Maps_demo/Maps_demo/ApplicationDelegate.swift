//
//  ApplicationDelegate.swift
//  Maps_demo
//
//  Created by Ivan_Tests on 27.05.2025.
//

import UIKit
fileprivate let logger = createLogger(subsystem: "Workers", category: "ApplicationDelegate")

final class ApplicationDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        logger.notice(#function)
        
        let handler = LocationsHandler.instance
        if handler.updatesStarted {
            handler.startLocationUpdates()
        }
        
        if handler.backgroundActivity {
            handler.backgroundActivity = true
        }
        
        
        return true
    }
}
