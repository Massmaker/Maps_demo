//
//  RootModel.swift
//  Maps_demo
//
//  Created by Ivan_Tests on 28.05.2025.
//

import Observation

@Observable
@MainActor
class RootModel {
    var navigationState:RootNavigationState = .maps
    var isMenuOpen:Bool = false
    var geoData:Geodata = .init()
    
    weak var locationsHandler:LocationsHandler?
    var areaResolver: any GeocodingAreaResolver
    
    
    init(locationsHandler locHandler:LocationsHandler, geocodingService: any GeocodingAreaResolver) {
        self.locationsHandler = locHandler
        self.areaResolver = geocodingService
    }
    
    func onRootViewAppear() {
        locationsHandler?.backgroundActivity = true
        locationsHandler?.startLocationUpdates()
    }
}

extension RootModel {
    static var dummyWithMenu:RootModel {
        let model = RootModel(locationsHandler: .instance, geocodingService: GeocodingAreaResolverDummy())
        model.isMenuOpen = true
        return model
    }
    
    static var dummyNoMenu:RootModel {
        let model = RootModel(locationsHandler: .instance, geocodingService: GeocodingAreaResolverDummy())
        return model
    }
}
