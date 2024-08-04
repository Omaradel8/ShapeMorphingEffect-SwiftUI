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
                
                ContinueButton()
            }
            .frame(maxWidth: .infinity)
        }
        .background {
            Rectangle()
                .fill(.black.gradient)
                .ignoresSafeArea()
        }
    }
    
    
    // Continue Button
    @ViewBuilder
    func ContinueButton() -> some View {
        Button {
            activePage = activePage.nextPage
        } label: {
            Text(activePage == .page4 ? "Login into PS App" : "Continue")
                .contentTransition(.identity)
                .foregroundStyle(.black)
                .padding(.vertical, 15)
                .frame(maxWidth: activePage == .page4 ? 220 : 180)
                .background(.white, in: .capsule)
        }
        .padding(.bottom, 15)
        .animation(.smooth(duration: 0.5, extraBounce: 0), value: activePage)
    }
}

#Preview {
    ContentView()
}
