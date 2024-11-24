//
//  MapView.swift
//  MapApp
//
//  Created by Markus Buchanan on 10/28/24.
//

import MapKit
import SwiftUI

struct MapView: View {
    @State var activeLocation : Location? = nil
    var locationsVM : LocationsViewModel
    var currentLocationCoordinate : MKCoordinateRegion{
        if let selectedLocation = locationsVM.selectedLocation {
            return MKCoordinateRegion(
                center: selectedLocation.coordinates,
                span: MKCoordinateSpan(latitudeDelta: Constants.MapViewConstants.deltas, longitudeDelta: Constants.MapViewConstants.deltas)
            )
        }
        else{
            return MKCoordinateRegion(
                center: Constants.MapViewConstants.defaultLocation,
                span: MKCoordinateSpan(latitudeDelta:Constants.MapViewConstants.deltas, longitudeDelta: Constants.MapViewConstants.deltas))
        }
    }
    var locationCoordinates: [MKCoordinateRegion] {
        let coordinates  = locationsVM.locations.map {
            MKCoordinateRegion(
                center: $0.coordinates,
                span: MKCoordinateSpan(latitudeDelta: Constants.MapViewConstants.deltas, longitudeDelta: Constants.MapViewConstants.deltas)
            )
        }
        return coordinates
    }
    var mapBounds : MapCameraBounds {
        MapCameraBounds(
            centerCoordinateBounds: currentLocationCoordinate,
            minimumDistance: Constants.MapViewConstants.minimumDistance,
            maximumDistance: Constants.MapViewConstants.maximumDistance
        )
    }
    
    var body: some View {
        Map(
            bounds: mapBounds
        ) {
            CoordinatePins
        }
    }
    
    var CoordinatePins : some MapContent {
        ForEach(0..<locationCoordinates.count){item in
            Annotation("", coordinate: locationCoordinates[item].center) {
                MapPinView(location : locationsVM.locations[item],
                           active: activeLocation == locationsVM.locations[item],
                           onTap: {
                                activeLocation = locationsVM.locations[item]
                                locationsVM.changeLocation(to: locationsVM.locations[item])
                           }
                )
            }
        }
    }
    
    struct Constants{
        struct MapViewConstants{
            static let minimumDistance =  900.0
            static let maximumDistance = 98888.0
            static let deltas = 0.1
            static let defaultLocation = CLLocationCoordinate2D(latitude: 48.8584, longitude: 2.2945)
        }
    }
}

#Preview {
    MapView(locationsVM : LocationsViewModel())
}
