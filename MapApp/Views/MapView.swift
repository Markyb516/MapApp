//
//  MapView.swift
//  MapApp
//
//  Created by Markus Buchanan on 10/28/24.
//

import MapKit
import SwiftUI

struct MapView: View {
 
 
    var coordinate: MKCoordinateRegion
    var locationName: String
    var body: some View {
        
            Map(
                bounds: MapCameraBounds(
                    centerCoordinateBounds: coordinate ,
                    minimumDistance: Constants.MapViewConstants.minimumDistance,
                    maximumDistance: Constants.MapViewConstants.maximumDistance
                )
            ) {
                Marker(locationName, systemImage: "target" , coordinate: coordinate.center)
                
            }
         
                
        
        
        }
            
    
    
    struct Constants{
        struct MapViewConstants{
            static let minimumDistance =  800.0
            static let maximumDistance = 8999.0
        }
    }
}

#Preview {
    MapView(coordinate: MKCoordinateRegion(center:  CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),  latitudinalMeters: 1000.0, longitudinalMeters: 1000.0),
            locationName: "testing")
}
