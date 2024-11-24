//
//  Location.swift
//  MapApp
//
//  Created by Markus Buchanan on 10/27/24.
//

import Foundation
import MapKit

struct Location : Identifiable, Equatable{
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
    var active = false
    let id = UUID().uuidString
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
}
