//
//  DetailedView.swift
//  MapApp
//
//  Created by Markus Buchanan on 11/19/24.
//

import SwiftUI
import MapKit

struct DetailedView: View {
    var  location : Location
    var body: some View {
        ImageCarrosel
        LocationDetails
    }
    
    var ImageCarrosel : some View {
        TabView{
            ForEach(location.imageNames, id: \.self ){ image in
                Image(image).resizable().scaledToFill()
                    .shadow(radius: Constants.ImageCarroselConstants.shadowRadius1)
                    .shadow(radius: Constants.ImageCarroselConstants.shadowRadius2)
            }
            
        }.tabViewStyle(PageTabViewStyle())
    }
    
    var LocationDetails : some View{
        VStack(alignment:.leading,spacing:Constants.LocationDetailsConstants.spacing){
            Text("\(location.name)").font(.largeTitle).fontWeight(.black)
                .padding(.horizontal)
            
            Text("\(location.cityName)").font(.title2).fontWeight(.semibold)
                .padding(.horizontal)
            
            Text("\(location.description)")
                .font(.title3)
                .fontWeight(.regular)
            
                .padding(.horizontal)
            
            if let url = URL(string: location.link){
                Link(destination: url) {
                    Text(Constants.LocationDetailsConstants.wikiText)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.accent)
                        .padding(.horizontal)
                }
            }
        }
    }

    struct Constants {
        struct LocationDetailsConstants{
            static let wikiText = "Read more on Wikipedia."
            static let spacing : CGFloat = 10
        }
        struct ImageCarroselConstants {
            static let shadowRadius1 : CGFloat = 10
            static let shadowRadius2 : CGFloat = 25

        }
    }
}

#Preview {
    DetailedView(location: Location(
        name: "Colosseum",
        cityName: "Rome",
        coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),
        description: "The Colosseum is an oval amphitheatre in the centre of the city of Rome, Italy, just east of the Roman Forum. It is the largest ancient amphitheatre ever built, and is still the largest standing amphitheatre in the world today, despite its age.",
        imageNames: [
            "rome-colosseum-1",
            "rome-colosseum-2",
            "rome-colosseum-3",
        ],
        link: "https://en.wikipedia.org/wiki/Colosseum"))
}
