//
//  LocationsHandler.swift
//  Maps_demo
//
//  Created by Ivan_Tests on 29.05.2025.
//

import Foundation
import CoreLocation

import Observation

fileprivate let kLiveUpdatesStartedKey:String = "liveUpdatesStarted"
fileprivate let kBackgroundActivitySessionStarted:String = "BGActivitySessionStarted"
fileprivate let logger = createLogger(subsystem: "Workers", category: "LocationsHandler")

@Observable
@MainActor class LocationsHandler:NSObject {
    static let instance:LocationsHandler = .init()
    private var backgroundActivitySession:CLBackgroundActivitySession?
    
    private let locationManager:CLLocationManager
    
    private override init() {
        locationManager = CLLocationManager()
        super.init()
//        locationManager.delegate = self
    }
    
    var updatesStarted:Bool = UserDefaults.standard.bool(forKey: kLiveUpdatesStartedKey) {
        didSet {
            UserDefaults.standard.set(updatesStarted, forKey: kLiveUpdatesStartedKey)
        }
    }
    
    var backgroundActivity:Bool = UserDefaults.standard.bool(forKey: kBackgroundActivitySessionStarted) {
        didSet {
            backgroundActivity ? self.backgroundActivitySession = CLBackgroundActivitySession() : self.backgroundActivitySession?.invalidate()
            UserDefaults.standard.set(backgroundActivity, forKey: kBackgroundActivitySessionStarted)
        }
    }
    
    func startLocationUpdates() {
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            startRequestingPermissions()
        case .restricted:
            return
        case .denied:
            return
        case .authorizedAlways:
            logger.notice("LocationAuth : \"Always\"")
        case .authorizedWhenInUse:
            logger.notice("LocationAuth : \"WhenInUse\"")
        @unknown default:
            fatalError("Unhandled Location Auth state")
        }
        
        Task{
            do{
                let updates = CLLocationUpdate.liveUpdates(CLLocationUpdate.LiveConfiguration.default)
                self.updatesStarted = true
                
                for try await update in updates {
                    if !self.updatesStarted{
                        break
                    }
                    guard let loc = update.location else {continue}
                    
                    let mps = loc.speed
                    let coords = loc.coordinate
                    //TODO: report the updates to clients
                }
            }
            catch{
                logger.error("Failed starting location updates: \(error)")
            }
        }
    }
    
    func stopLocationUpdates(){
        self.updatesStarted = false
        self.backgroundActivity = false
    }
    
    private func startRequestingPermissions() {
        locationManager.requestAlwaysAuthorization()
    }
}


//extension LocationsHandler:CLLocationManagerDelegate {
//    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
//        
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        
//    }
//    
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        switch manager.authorizationStatus {
//            
//        case .notDetermined:
//            startRequestingPermissions()
//        case .restricted:
//            
//        case .denied:
//            
//        case .authorizedAlways:
//            
//        case .authorizedWhenInUse:
//            
//        @unknown default:
//            fatalError("Unhandled Location Auth state")
//        }
//    }
//}
