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
    @State var dropdownActive = false
    var body: some View {
        if let selectedLocation = locationsVM.selectedLocation{
            
            ZStack(alignment: .top){
                MapView(
                    coordinate:  MKCoordinateRegion(
                        center: selectedLocation.coordinates,
                        latitudinalMeters: Constants.latitude, longitudinalMeters: Constants.longitude
                    )
                    , locationName : selectedLocation.name
                )
                
                DropdownMenuView(dropdownActive: $dropdownActive, VM: locationsVM )
                    .onTapGesture {
                        withAnimation(.easeOut(duration: 0.4)) {
                            dropdownActive.toggle()
                        }
                        
                    }
            }
        }
        else{
            ContentUnavailableView("There are no items available", systemImage: "exclamationmark.triangle.fill")
        }
    }
    
    
    struct Constants{
        static let latitude = 100.0
        static  let longitude = 100.0
        
    }
}

#Preview {
    let test = LocationsViewModel()
    ContentView()
        .environment(test)
}
