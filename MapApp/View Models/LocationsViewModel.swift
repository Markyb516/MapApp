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
        selectedLocation = location
    }
}
