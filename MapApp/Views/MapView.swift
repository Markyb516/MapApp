//
//  MapView.swift
//  MapApp
//
//  Created by Markus Buchanan on 10/28/24.
//

import MapKit
import SwiftUI

struct MapView: View {
    @State var dropdownActive = false
 
    var coordinate: MKCoordinateRegion
    var locationName: String
    var body: some View {
        ZStack(alignment: .top) {
            Map(
                bounds: MapCameraBounds(
                    centerCoordinateBounds: coordinate ,
                    minimumDistance: Constants.MapViewConstants.minimumDistance,
                    maximumDistance: Constants.MapViewConstants.maximumDistance
                )
            ) {
                Marker(locationName, systemImage: "target" , coordinate: coordinate.center)
                
            }
            DropdownMenuView(dropdownActive: $dropdownActive)
                .onTapGesture {
                    withAnimation(.linear(duration: 0.6)) {
                        dropdownActive.toggle()
                    }
                    
                }
                
        }
        
        }
            
    
    
    struct Constants{
        struct MapViewConstants{
            static let minimumDistance =  700.0
            static let maximumDistance = 8999.0
        }
    }
}

#Preview {
    MapView(coordinate: MKCoordinateRegion(center:  CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),  latitudinalMeters: 1000.0, longitudinalMeters: 1000.0),
            locationName: "testing")
}
