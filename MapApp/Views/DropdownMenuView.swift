//
//  DropdownMenuView.swift
//  MapApp
//
//  Created by Markus Buchanan on 11/10/24.
//

import SwiftUI

struct DropdownMenuView: View {
    @Binding var dropdownActive : Bool
    var body: some View {
        VStack {
            Text("MapKit App")
                .font(.title)
                .fontWeight(.black)
        

            
            
        }.frame(maxWidth: .infinity)
            .padding()
            .background(.thickMaterial)
            .overlay(alignment: .leading) {
                Image(systemName: dropdownActive ? Constants.HeaderConstants.dropdownActiveImage :  Constants.HeaderConstants.dropdownImage).fontWeight(.bold).foregroundStyle(.accent).padding()
            }
            .clipShape(RoundedRectangle(cornerRadius: Constants.HeaderConstants.cornerRadius))
            .shadow(color: .black.opacity(Constants.HeaderConstants.opacity), radius: Constants.HeaderConstants.opacityRadius, x:Constants.HeaderConstants.shadowX, y: Constants.HeaderConstants.shadowY)
            .padding(.horizontal)
            .frame(maxWidth: .infinity)
            .padding(.top)    }
    
    struct Constants{
     
        struct HeaderConstants {
            static let cornerRadius = 10.0
            static let opacity = 0.4
            static let opacityRadius = 9.0
            static let shadowX = 0.0
            static let shadowY = 5.0
            static let dropdownImage = "arrow.right"
            static let dropdownActiveImage = "arrow.down"
        }
    }
}

#Preview {
    @Previewable @State var testing = false
    
    DropdownMenuView(dropdownActive: $testing)
        .onTapGesture {
            withAnimation(.easeOut(duration: 0.3)) {
                testing.toggle()
            }
            
        }
}
