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
                
                TextContents(size)
                
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
    
    @ViewBuilder
    func TextContents(_ size: CGSize) -> some View {
        VStack(spacing: 8) {
            HStack(alignment: .top, spacing: 0) {
                ForEach(Page.allCases, id: \.rawValue) { page in
                    Text(page.title)
                        .lineLimit(1)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .kerning(1.1)
                        .frame(width: size.width)
                }
            }
            // Sliding Left or right based on the active page
            .offset(x: -activePage.index * size.width)
            .animation(.smooth(duration: 0.7, extraBounce: 0.1), value: activePage)
            
            HStack(alignment: .top, spacing: 0) {
                ForEach(Page.allCases, id: \.rawValue) { page in
                    Text(page.subTitle)
                        .font(.callout)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.gray)
                        .frame(width: size.width)
                }
            }
            // Sliding Left or right based on the active page
            .offset(x: -activePage.index * size.width)
            .animation(.smooth(duration: 1, extraBounce: 0.2), value: activePage)
        }
        .padding(.top, 10)
        .frame(width: size.width, alignment: .leading)
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
