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
    private weak var locationsHandler:LocationsHandler?
    var navigationState:RootNavigationState = .maps
    var isMenuOpen:Bool = false
    var geoData:Geodata = .init()
    
    init(locationsHandler lHandler:LocationsHandler) {
        self.locationsHandler = lHandler
    }
    
    func onRootViewAppear() {
        locationsHandler?.backgroundActivity = true
        locationsHandler?.startLocationUpdates()
    }
}

extension RootModel {
    static var dummyWithMenu:RootModel {
        let model = RootModel(locationsHandler: .instance)
        model.isMenuOpen = true
        return model
    }
    
    static var dummyNoMenu:RootModel {
        let model = RootModel(locationsHandler: .instance)
        return model
    }
}
