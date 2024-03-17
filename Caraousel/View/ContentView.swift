//
//  ContentView.swift
//  Caraousel
//
//  Created by Edo Lorenza on 17/03/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var carouselVM = CarouselViewModel()
    
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            CarouselView()
                .frame(height: 190)
                .environmentObject(carouselVM.stateModel)
            
            HStack(spacing: 3) {
                //foreach with your items (array of image) from viewmodel/API
                ForEach(0..<4, id: \.self) { index in
                    Circle()
                        .frame(width: index == carouselVM.activeCard ? 8 : 7,
                               height: index == carouselVM.activeCard ? 8 : 7)
                        .foregroundColor(index == carouselVM.activeCard ? .green : Color.gray.opacity(0.4))
                        .overlay(Circle().stroke(Color.clear, lineWidth: 1))
                        .padding(.bottom, 8)
                        .animation(.spring())
                }
            }
            Spacer()
        }
        .padding()
    }
}
