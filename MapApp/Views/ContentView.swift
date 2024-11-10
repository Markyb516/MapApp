//
//  ContentView.swift
//  MapApp
//
//  Created by Markus Buchanan on 10/27/24.
//

import MapKit
import SwiftUI

struct ContentView: View {

    @Environment(LocationsViewModel.self) private var locationsVM

    var body: some View {
        if let starterLocation = locationsVM.locations.first{
            MapView(
                coordinate:  MKCoordinateRegion(
                    center: starterLocation.coordinates,
                    latitudinalMeters: Constants.latitude, longitudinalMeters: Constants.longitude
                )
                , locationName : starterLocation.name
            )
        }
        else{
            ContentUnavailableView("There are no items available", systemImage: "exclamationmark.triangle.fill")
        }
    }
    
    
    struct Constants{
        static let latitude = 1000.0
        static  let longitude = 1000.0
        
    }
}

#Preview {
    let test = LocationsViewModel()
    ContentView()
        .environment(test)
}
