//
//  GeocodingService.swift
//  Maps_demo
//
//  Created by Ivan_Tests on 30.05.2025.
//

import Foundation
import CoreLocation


fileprivate let logger = createLogger(subsystem: "Workers", category: "GeocodingService")

protocol PlacemarkInfo {
    var cityName:String{get}
    var locationNonOptional:CLLocation {get}
}

protocol GeocodingAreaResolver {
    func getCityForLocation(_ loc:CLLocation) async throws(DataErrors) -> any PlacemarkInfo
}



/// Purpose of this class is to get a city from current user's coordinates
///  the route to the city center from current location would be built using that info
@MainActor
class GeocodingService: GeocodingAreaResolver {
    private let geocoder:CLGeocoder = .init()
    private var isFetching:Bool = true
    
    func getCityForLocation(_ loc:CLLocation) async throws(DataErrors) -> any PlacemarkInfo {
        guard !isFetching else {
            throw .rateLimiting
        }
        
        isFetching = true
        
        do {
            let placemarks:[CLPlacemark] = try await geocoder.reverseGeocodeLocation(loc)
            isFetching = false
            
            #if DEBUG
            guard let mark = placemarks.first,
                  let cityName = mark.locality else {
                logger.warning("No Placemark or placemark without city name")
                throw DataErrors.itemNotFound
            }
            logger.notice("Detected city/town name: '\(cityName)'")
            return mark
            #else
            guard let mark = placemarks.first else {
                throw DataErrors.itemNotFound
            }
            return mark
            #endif
            
            
        }
        catch (let geocodingError) {
            logger.error("Error Fetching nearest city/town: \(geocodingError.localizedDescription)")
            isFetching = false
            throw .systemError(geocodingError)
            
        }
    }
    
}

