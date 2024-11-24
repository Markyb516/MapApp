//
//  MapPinView.swift
//  MapApp
//
//  Created by Markus Buchanan on 11/17/24.
//

import SwiftUI

struct MapPinView: View {
    let location : Location
    var active : Bool
    var onTap : () -> Void
    
    var body: some View {
        VStack(spacing: Constants.spacing){
            PinIcon
            PinArrow
        }
        .scaleEffect(active ? Constants.activeScaleSize : Constants.inactiveScaleSize)
        .animation(.linear(duration: Constants.animationDuration), value: active)
            .onTapGesture {
                onTap()
            }
    }
    
    var PinIcon : some View {
        Image(systemName: Constants.pinIcon)
            .resizable()
            .frame(maxWidth: Constants.pinIconMaxDimensions, maxHeight: Constants.pinIconMaxDimensions)
            .padding(Constants.pinIconPadding)
            .foregroundStyle(.white)
            .background(Circle().foregroundStyle(.red))
    }
    
    var PinArrow : some View {
        Image(systemName: Constants.pinArrowIcon)
            .resizable()
            .frame(maxWidth: Constants.pinArrowMaxDimensions,maxHeight: Constants.pinArrowMaxDimensions).foregroundStyle(.red)
    }
    
    struct Constants{
        static let spacing : CGFloat = -4
        static let pinIcon = "target"
        static let pinIconMaxDimensions : CGFloat = 20.0
        static let pinIconPadding : CGFloat = 5
        static let pinArrowIcon = "arrowtriangle.down.fill"
        static let pinArrowMaxDimensions : CGFloat = 11.0
        static let activeScaleSize : CGFloat = 1.5
        static let inactiveScaleSize : CGFloat = 1
        static let animationDuration : TimeInterval = 0.7
        
    }
}


