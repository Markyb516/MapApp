//
//  DropdownMenuView.swift
//  MapApp
//
//  Created by Markus Buchanan on 11/10/24.
//

import SwiftUI

struct DropdownMenuView: View {
    @State var dropdownActive = false
    var header : String
    var VM : LocationsViewModel
    var body: some View {
        VStack {
            Heading
            if dropdownActive{
                LocationsDropdownList
            }
        }.frame(maxWidth: .infinity)
            .padding()
            .background(.thickMaterial)
            .overlay(alignment: .leading){DropdownIndicatorArrow}
            .dropdownShape(
                cornerRadius: Constants.cornerRadius,
                opacity: Constants.opacity,
                shadowRadius:Constants.shadowRadius,
                shadowX: Constants.shadowX,
                shadowY: Constants.shadowY
            )
            .onTapGesture {
                    dropdownActive.toggle()
            }
            .animation(.easeOut(duration: Constants.animationDuration), value: dropdownActive)
    }
    
    
    var Heading : some View {
        Text(header)
            .font(.largeTitle)
            .fontWeight(.black)
    }
    
    var LocationsDropdownList : some View {
        ScrollView{
        ForEach(VM.locations){ location in
            Button(action:{
                VM.changeLocation(to: location)
                dropdownActive.toggle()}){
                    Text(location.name)
                        .font(.title2)
                        .fontWeight(.semibold).minimumScaleFactor(0.5)
                }
                .transition(AnyTransition(.scale))
            
            }
        }.frame(maxWidth: .infinity, maxHeight: 200)
         .transition(AnyTransition(.scale))
    }
    
    var DropdownIndicatorArrow : some View {
        Image(systemName: dropdownActive ? Constants.dropdownActiveImage :  Constants.dropdownImage).fontWeight(.bold).foregroundStyle(.accent).padding()
    }
    
    struct Constants{
     
      
            static let cornerRadius = 10.0
            static let opacity = 0.4
            static let shadowRadius = 9.0
            static let shadowX = 0.0
            static let shadowY = 5.0
            static let dropdownImage = "arrow.right"
            static let dropdownActiveImage = "arrow.down"
            static let animationDuration = 0.4
        
    }
}

#Preview {
    DropdownMenuView(header: "map kit", VM: LocationsViewModel())
    
}
