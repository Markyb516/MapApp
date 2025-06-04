//
//  DropdownBackgroundShape.swift
//  MapApp
//
//  Created by Markus Buchanan on 11/10/24.
//

import SwiftUI

struct DropdownBackgroundShape: ViewModifier {
    let cornerRadius : Double
    let opacity : Double
    let shadowRadius : Double
    let shadowX : Double
    let shadowY : Double
    
    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .shadow(color: .black.opacity(opacity), radius: shadowRadius, x:shadowX, y: shadowY)
            .padding(.horizontal)
            .frame(maxWidth: .infinity)
            .padding(.top)
    }
   
}

extension View {
    func dropdownShape(cornerRadius: Double, opacity: Double, shadowRadius: Double, shadowX: Double, shadowY: Double) -> some  View {
        
        modifier(DropdownBackgroundShape(cornerRadius: cornerRadius, opacity: opacity, shadowRadius: shadowRadius, shadowX: shadowX, shadowY: shadowY))
    }
}

