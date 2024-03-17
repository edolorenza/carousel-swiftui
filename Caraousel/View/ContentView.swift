//
//  ContentView.swift
//  Caraousel
//
//  Created by Edo Lorenza on 17/03/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var carouselVM = CarouselViewModel()
    @State private var progress: Float = 0
    
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            CarouselView()
                .frame(height: 190)
                .environmentObject(carouselVM.stateModel)
            
            HStack(alignment: .center, spacing: 3) {
                //foreach with your items (array of image) from viewmodel/API
                ForEach(0..<4, id: \.self) { index in
                    
                    if index == carouselVM.activeCard {
                        ProgressBar(value: self.progress)
                            .frame(width: 44, height: 8)
                            .onAppear{
                                self.animateProgress()
                            }
                    }else{
                        Circle()
                          .frame(width: index == carouselVM.activeCard ? 8 : 7, height: index == carouselVM.activeCard ? 8 : 7)
                           .foregroundColor(index == carouselVM.activeCard ? .red : Color.gray.opacity(0.4))
                           .overlay(Circle().stroke(Color.clear, lineWidth: 1))
                           .animation(.spring())
                    }
                   
                }
            }
            Spacer()
        }
        .padding()
    }
    
    func animateProgress() {
        self.progress = 0
        withAnimation(Animation.linear(duration: 5.0)) {
            progress = 1.0
        }
    }
}

struct ProgressBar: View {
    
    init(value: Float) {
        self.value = value
    }
    
    var value: Float
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.2)
                    .foregroundColor(.gray)
                  
                ZStack(alignment: .trailing) {
                    RoundedRectangle(cornerRadius: 45)
                        .fill(Color.green)
                        .frame(width: min(CGFloat(self.value) * geometry.size.width, geometry.size.width), height: geometry.size.height)
                }
            }
            .cornerRadius(45.0)
        }
    }
}
