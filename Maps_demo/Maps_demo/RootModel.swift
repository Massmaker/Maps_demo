//
//  RootModel.swift
//  Maps_demo
//
//  Created by Ivan_Tests on 28.05.2025.
//

import Observation

@Observable
class RootModel {
    var navigationState:RootNavigationState = .maps
    var isMenuOpen:Bool = false
    var geoData:Geodata = .init()
}

extension RootModel {
    static var dummyWithMenu:RootModel {
        let model = RootModel()
        model.isMenuOpen = true
        return model
    }
    
    static var dummyNoMenu:RootModel {
        let model = RootModel()
        return model
    }
}
