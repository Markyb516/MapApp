//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by Markus Buchanan on 10/27/24.
//

import SwiftUI


@Observable class LocationsViewModel{
    var locations = LocationsDataService.locations
    
    var selectedLocation = LocationsDataService.locations.first
    
    func changeLocation(to location : Location) {
        if let newLocation = locations.firstIndex(where: { $0 == location }){
            locations[newLocation].active = true
            selectedLocation = locations[newLocation]
            
        }
        
    }
    

    
  func next(item: Location) {
        // Ensure that 'item' exists in the locations array and find its index
        if let index = locations.firstIndex(where: { $0.name == item.name }) {
            // Check if the next index exists
            if index + 1 < locations.count {
                let nextLocation = locations[index + 1]
                selectedLocation = nextLocation
            } else {
                // If we're at the end of the array, loop back to the first location
                selectedLocation = locations[0]
            }
        }
    }
}
