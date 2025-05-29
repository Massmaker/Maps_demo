//
//  Geodata.swift
//  Maps_demo
//
//  Created by Ivan_Tests on 29.05.2025.
//

import Foundation
import CoreLocation

struct Geodata {
    private(set) var speedMetersPerSecond: Double = 0
    private(set) var coordinates: CLLocationCoordinate2D = .init(latitude: 30, longitude: 40)
    private(set) var distanceMeters: Double = 0
    
    mutating func setSpeed(_ mps:Double) {
        speedMetersPerSecond = mps
    }
    
    mutating func setDistancw(_ meters:Double) {
        distanceMeters = meters
    }
    
    mutating func setCoordinates(_ coords:CLLocationCoordinate2D) {
        coordinates = coords
    }
}
