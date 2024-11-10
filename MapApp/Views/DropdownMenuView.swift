//
//  DropdownMenuView.swift
//  MapApp
//
//  Created by Markus Buchanan on 11/10/24.
//

import SwiftUI

struct DropdownMenuView: View {
    @Binding var dropdownActive : Bool
    var VM : LocationsViewModel
    var body: some View {
        VStack {
            Text("MapKit App")
                .font(.title)
                .fontWeight(.black)
            if dropdownActive{
                ForEach(VM.locations){ location in
                    
                    Button(action:{VM.changeLocation(to: location)}){
                        Text(location.name).fontWeight(.semibold)
                    }
                    .transition(AnyTransition(.scale))
                    
                }
            }
            
        }.frame(maxWidth: .infinity)
            .padding()
            .background(.thickMaterial)
            .overlay(alignment: .leading) {
                Image(systemName: dropdownActive ? Constants.HeaderConstants.dropdownActiveImage :  Constants.HeaderConstants.dropdownImage).fontWeight(.bold).foregroundStyle(.accent).padding()
            }
            .dropdownShape(
                cornerRadius: Constants.HeaderConstants.cornerRadius,
                opacity: Constants.HeaderConstants.opacity,
                shadowRadius:Constants.HeaderConstants.shadowRadius,
                shadowX: Constants.HeaderConstants.shadowX,
                shadowY: Constants.HeaderConstants.shadowY
            )
        
        
           
        
    }
    
    struct Constants{
     
        struct HeaderConstants {
            static let cornerRadius = 10.0
            static let opacity = 0.4
            static let shadowRadius = 9.0
            static let shadowX = 0.0
            static let shadowY = 5.0
            static let dropdownImage = "arrow.right"
            static let dropdownActiveImage = "arrow.down"
        }
    }
}

#Preview {
    @Previewable @State var testing = false
    
    DropdownMenuView(dropdownActive: $testing, VM: LocationsViewModel())
        .onTapGesture {
            withAnimation(.easeOut(duration: 0.3)) {
                testing.toggle()
            }
            
        }
}
