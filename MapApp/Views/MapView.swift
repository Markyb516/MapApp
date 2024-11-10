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
            Header
                
        }
        
        }
            
    var Header : some View {
        
        VStack {
            Text("MapKit App")
                .font(.title)
                .fontWeight(.black)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.thickMaterial)
                .overlay(alignment: .leading) {
                    Image(systemName: Constants.HeaderConstants.dropdownImage).fontWeight(.bold).padding()
                }
                .clipShape(RoundedRectangle(cornerRadius: Constants.HeaderConstants.cornerRadius))
                .shadow(color: .black.opacity(Constants.HeaderConstants.opacity), radius: Constants.HeaderConstants.opacityRadius, x:Constants.HeaderConstants.shadowX, y: Constants.HeaderConstants.shadowY)
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .padding(.top)
            
            
        }
    }
    
    struct Constants{
        struct MapViewConstants{
            static let minimumDistance =  700.0
            static let maximumDistance = 8999.0
        }
        struct HeaderConstants {
            static let cornerRadius = 10.0
            static let opacity = 0.4
            static let opacityRadius = 9.0
            static let shadowX = 0.0
            static let shadowY = 5.0
            static let dropdownImage = "arrow.down"
        }
    }
}

#Preview {
    MapView(coordinate: MKCoordinateRegion(center:  CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),  latitudinalMeters: 1000.0, longitudinalMeters: 1000.0),
            locationName: "testing")
}
