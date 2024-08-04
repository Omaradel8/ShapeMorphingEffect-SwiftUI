//
//  IntroView.swift
//  ShapeMorphingEffect
//
//  Created by Omar Adel on 04/08/2024.
//

import SwiftUI

struct IntroView: View {
    
    @State private var activePage: Page = .page1
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            VStack {
                Spacer()
                
                MorphingSymbolView(symbol: activePage.rawValue,
                                   config: .init(font: .system(size: 150, weight: .bold),
                                                 frame: .init(width: 250, height: 200),
                                                 radius: 30,
                                                 foregroundColor: .white)
                )
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity)
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
