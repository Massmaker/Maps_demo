//
//  MapContainerView.swift
//  Maps_demo
//
//  Created by Ivan_Tests on 30.05.2025.
//

import SwiftUI
import MapKit

struct MapContainerView: View {
    
    @Binding var currentLocation:CLLocation?
    @Binding var targetLocation:CLLocation?
    @State private var region:MKCoordinateRegion?
    @State private var cameraPosition:MapCameraPosition?
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            let camera = MapCamera(centerCoordinate: currentLocation?.coordinate ?? .kyivCityCenterCoordinate, distance: 10)
            
            Map(initialPosition: cameraPosition)
            
            currentPositionButton
        }
    }
    
    @ViewBuilder private var currentPositionButton: some View {
        Button(action: {
            
        }, label: {
            Image(systemName: "location")
                .resizable()
                .frame(width:70, height:70)
                .padding()
                
        })
    }
}

#Preview {
    MapContainerView()
}
