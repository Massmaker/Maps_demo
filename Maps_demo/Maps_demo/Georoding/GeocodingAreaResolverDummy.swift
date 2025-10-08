//
//  GeocodingAreaResolverDummy.swift
//  Maps_demo
//
//  Created by Ivan_Tests on 30.05.2025.
//


import CoreLocation
class GeocodingAreaResolverDummy: GeocodingAreaResolver {
        
    private struct PlacemarkInfoStruct:PlacemarkInfo {
        var cityName: String
        var locationNonOptional: CLLocation
    }
    
    func getCityForLocation(_ loc: CLLocation) async throws(DataErrors) -> PlacemarkInfo {
        
        var location = CLLocation.kyivCityCenterLocation
        var name = "Kyiv"
        
        let info:PlacemarkInfoStruct = PlacemarkInfoStruct(cityName: name, locationNonOptional: location)
        
        return info
    }
}


