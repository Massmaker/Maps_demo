//
//  Maps_demoApp.swift
//  Maps_demo
//
//  Created by Ivan_Tests on 27.05.2025.
//

import SwiftUI

@main
struct Maps_demoApp: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate:ApplicationDelegate
    
    var body: some Scene {
        WindowGroup {
            RootView(viewModel: RootModel())
        }
    }
}
