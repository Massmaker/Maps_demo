//
//  CoreLocation+Extensions.swift
//  Maps_demo
//
//  Created by Ivan_Tests on 30.05.2025.
//

import Foundation
import CoreLocation

extension CLPlacemark {
    var cityName:String {
        self.locality ?? "Not a city/town"
    }
}

extension CLPlacemark: PlacemarkInfo {
    var locationNonOptional: CLLocation {
        self.location ?? CLLocation.kyivCityCenterLocation
    }
}


extension CLLocationCoordinate2D {
    static var kyivCityCenterCoordinate = CLLocationCoordinate2D(latitude: 50.45082,
                                                                 longitude: 30.523088)
}
extension CLLocation {
    static var kyivCityCenterLocation:CLLocation  = CLLocation(latitude: CLLocationCoordinate2D.kyivCityCenterCoordinate.latitude,
                                                               longitude: CLLocationCoordinate2D.kyivCityCenterCoordinate.longitude)
}
