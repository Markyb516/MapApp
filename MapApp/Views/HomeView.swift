//
//  ContentView.swift
//  MapApp
//
//  Created by Markus Buchanan on 10/27/24.
//

import MapKit
import SwiftUI

struct HomeView: View {
    
    @Environment(LocationsViewModel.self) private var locationsVM
   
    var body: some View {
        if let selectedLocation = locationsVM.selectedLocation {
    
            ZStack(alignment: .top){
                MapView(locationsVM : locationsVM )
    
                VStack{
            
                    DropdownMenuView(header: selectedLocation.name , VM: locationsVM )
                    
                    Spacer()
                    
                    LocationCards(selectedLocation:selectedLocation)
                }
                .padding(.bottom)
                
            }
        }
        else{
            ContentUnavailableView(Constants.itemsUnavailableMessage, systemImage: Constants.itemsUnavailableIcon)
        }
    }

    func LocationCards (selectedLocation : Location) ->  some View {
        
        return ForEach(locationsVM.locations){ location in
            if selectedLocation == location {
                CardView( location : location
                )
                .transition(.asymmetric(insertion:  .move(edge: .trailing), removal:  .move(edge: .leading))
                   )
            }
        }
        .animation(.linear(duration: Constants.animationDuration), value: locationsVM.selectedLocation)
    }
   
    
    struct Constants{
        static let latitude = 100.0
        static  let longitude = 100.0
        static let animationDuration = 0.6
        static let itemsUnavailableMessage = "There are no items available"
        static let itemsUnavailableIcon = "exclamationmark.triangle.fill"
        
    }
    
    
    
}



#Preview {
    let test = LocationsViewModel()
    HomeView()
        .environment(test)
}
