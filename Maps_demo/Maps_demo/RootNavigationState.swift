//
//  RootNavigationState.swift
//  Maps_demo
//
//  Created by Ivan_Tests on 28.05.2025.
//

import Foundation
enum RootNavigationState {
    case maps
    case itemsList
}

import SwiftUI
import CoreLocation
import MapKit

extension RootNavigationState:View {
    var body: some View {
        switch self {
        case .maps:
            Map()
        case .itemsList:
            ContentUnavailableView("List is not implemented yet", systemImage: "cross.circle", description: Text("under construction"))
        }
    }
}
