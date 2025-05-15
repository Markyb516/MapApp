//
//  CardView.swift
//  MapApp
//
//  Created by Markus Buchanan on 11/13/24.
//

import SwiftUI
import MapKit

    struct CardView: View {
        @State var light = false
        @State var detailedView = false
        @Environment(LocationsViewModel.self) private var LocationsVM
        var location : Location
        
        
        var body: some View {
            ZStack {
                CardBackground
                HStack {
                    VStack(alignment:.leading, spacing: Constants.spacing){
                        CardIcon
                        CardTitle
                    }
                    .offset(y:Constants.yOffset)
                        .padding()
                        
                    VStack{
                        LearnMoreButton
                            .sheet(isPresented: $detailedView) {
                                DetailedView(location: location)
                            }
                        
                        NextButton
                    }
                    .padding()
                }
            }
            .padding()
        }
        
        
        
        var CardBackground : some View{
            RoundedRectangle(cornerRadius: Constants.CardBackgroundConstants.cornerRadius)
                .fill(.thinMaterial).frame(maxWidth: Constants.CardBackgroundConstants.maxWidth, maxHeight: Constants.CardBackgroundConstants.maxHeight).shadow(radius: Constants.CardBackgroundConstants.radius)
              
        }
        
        
        var CardIcon : some View {
            if let image = location.imageNames.first {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: Constants.CardIconConstants.maxWidth,maxHeight: Constants.CardIconConstants.maxHeight)
                    .clipShape(RoundedRectangle(cornerRadius: Constants.CardIconConstants.clippedShapeRadius))
                    .background(RoundedRectangle(cornerRadius: Constants.CardIconConstants.backgroundRadius).fill(.white).frame(maxWidth: Constants.CardIconConstants.backgroundMaxWidth,maxHeight: Constants.CardIconConstants.backgroundMaxHeight))
                   
            }
            else{
                Image(systemName: Constants.CardIconConstants.missingPhotoIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: Constants.CardIconConstants.maxWidth,maxHeight: Constants.CardIconConstants.maxHeight)
                    .clipShape(RoundedRectangle(cornerRadius: Constants.CardIconConstants.clippedShapeRadius))
                    .background(RoundedRectangle(cornerRadius: Constants.CardIconConstants.backgroundRadius).fill(.white).frame(maxWidth: Constants.CardIconConstants.backgroundMaxWidth,maxHeight: Constants.CardIconConstants.backgroundMaxHeight))
            }
           
        }
        
        
        var CardTitle : some View {
            VStack(alignment:.leading, spacing: Constants.CardTitleConstants.spacing){
                Text("\(location.name)")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("\(location.cityName)")
                    .font(.subheadline)
                    .fontWeight(.medium)
            }
        }
        
        
        var LearnMoreButton : some View{
            Button {
                detailedView.toggle()
            } label:{
                Text(Constants.LearnMoreButtonConstants.buttonText)
                    .foregroundStyle(.white).fontWeight(.semibold)
                    .frame(maxWidth: Constants.LearnMoreButtonConstants.maxWidth,maxHeight: Constants.LearnMoreButtonConstants.maxHeight)
                    .background(.accent)
                    .clipShape(RoundedRectangle(cornerRadius: Constants.LearnMoreButtonConstants.cornerRadius))
            }
        }
        
        var NextButton : some View {
            Button {
                withAnimation(.linear(duration: Constants.NextButtonConstants.animationDuration)) {
                    LocationsVM.next(item: location)
                }
              } label: {
                  Text(Constants.NextButtonConstants.buttonText)
                    .foregroundStyle(.accent)
                    .fontWeight(.semibold)
                    .frame(maxWidth: Constants.NextButtonConstants.maxWidth,maxHeight: Constants.NextButtonConstants.maxHeight)
                    .background(.gray.quinary)
                    .clipShape(RoundedRectangle(cornerRadius: Constants.NextButtonConstants.cornerRaius))
                 
            }
        }
        
        struct Constants{
            struct NextButtonConstants {
                static let animationDuration : TimeInterval = 0.6
                static let buttonText = "Next"
                static let maxWidth : CGFloat = 150
                static let maxHeight : CGFloat = 50
                static let cornerRaius : CGFloat  = 10
            }
            
            struct LearnMoreButtonConstants {
                static let maxWidth : CGFloat = 150
                static let maxHeight : CGFloat = 50
                static let cornerRadius : CGFloat = 10
                static let buttonText = "Learn more"
            }
            
            struct CardTitleConstants {
                static let spacing : CGFloat = 7
            }
            
            struct CardIconConstants{
                static let maxHeight : CGFloat = 110
                static let maxWidth : CGFloat = 110
                static let backgroundMaxHeight : CGFloat = 120
                static let backgroundMaxWidth : CGFloat = 120
                static let clippedShapeRadius : CGFloat = 10
                static let backgroundRadius : CGFloat = 10
                static let missingPhotoIcon = "photo.fill"
            }
            struct CardBackgroundConstants {
                static let cornerRadius : CGFloat = 15
                static let maxWidth : CGFloat  = 600
                static let maxHeight : CGFloat = 170
                static let radius : CGFloat = 10
            }
            
            static let spacing : CGFloat = 15
            static let yOffset : CGFloat = -40
        }
    }

#Preview {
    
    let h = LocationsViewModel()
    CardView(location: h.selectedLocation!).environment(h)
}
