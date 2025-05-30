//
//  ContentView.swift
//  Maps_demo
//
//  Created by Ivan_Tests on 27.05.2025.
//

import SwiftUI

struct RootView: View {
    
    @State var viewModel:RootModel
    
    var body: some View {
        ZStack {
            
            NavigationStack {
                viewModel.navigationState
            }
                
            if viewModel.isMenuOpen {
                
            }
        }
        .onAppear{
            viewModel.onRootViewAppear()
        }
    }
}

#Preview {
    RootView(viewModel: RootModel.dummyNoMenu)
}
