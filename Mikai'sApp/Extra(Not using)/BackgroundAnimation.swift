//
//  BackgroundAnimation.swift
//  Mikai'sApp
//
//  Created by Makai Klintman on 1/15/24.
//

import SwiftUI

struct BackgroundAnimation: View {
    
    @State private var animateGradient = false
    
    var body: some View {
        
        let width = UIScreen.main.bounds.width
        
        ZStack {
            
            
            
            LinearGradient(gradient: .init(colors: [.purple, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
                .hueRotation(.degrees(animateGradient ? 45 : 0))
                .onAppear {
                    withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses : true)) {
                        animateGradient.toggle()
                    }
                    
                }
            
            VStack {
                Text("Welcome!")
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                   .fill(.white)
                    .opacity(0.1)
            }
            .frame(width: width / 1.7, height: 270)
        }
    }
 }

#Preview {
    BackgroundAnimation()
}
