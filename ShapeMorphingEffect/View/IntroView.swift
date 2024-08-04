//
//  IntroView.swift
//  ShapeMorphingEffect
//
//  Created by Omar Adel on 04/08/2024.
//

import SwiftUI

struct IntroView: View {
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            VStack {
                
            }
        }
        .background {
            Rectangle()
                .fill(.black.gradient)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
