//
//  TestingView.swift
//  MapApp
//
//  Created by Markus Buchanan on 11/11/24.
//

import SwiftUI

struct TestingView: View {
    @State var popoverValidation = false
    var body: some View {
        
        VStack(spacing:-4){
            Image(systemName: "target")
                .resizable()
                .frame(width: 200,height: 200)
                .padding(5)
                .foregroundStyle(.white)
                .background(Circle().foregroundStyle(.red))
                
            Image(systemName: "arrowtriangle.down.fill")
                .resizable()
                .frame(width: 51,height: 51).foregroundStyle(.red)
            
        }

    }
}

#Preview {
    TestingView()
}
