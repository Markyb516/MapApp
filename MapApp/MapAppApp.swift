//
//  MapAppApp.swift
//  MapApp
//
//  Created by Markus Buchanan on 10/27/24.
//

import SwiftUI

@main
struct MapAppApp: App {
    @State private var locationsVM = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(locationsVM)
        }
    }
}
