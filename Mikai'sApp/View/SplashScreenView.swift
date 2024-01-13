//
//  SplashScreen.swift
//  Mikai'sApp
//
//  Created by Makai Klintman on 1/15/24.
//

import SwiftUI

extension Color {
    static let midnightBlue = Color(UIColor(red: 25/255, green: 25/255, blue: 112/255, alpha: 1.0))
}

struct SplashScreenView: View {
    
    @State private var animateGradient = false
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        
        
        
        if isActive {
            Tabs()
        } else {
            
            ZStack{
            BackgroundView()
     
            VStack {
                VStack {
                    Image(systemName: "book.pages.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.black)
                    Text("MK Quotes")
                        .font(Font.custom("Baskerville-Bold", size: 26))
                        .foregroundColor(.gray.opacity(0.80))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeInOut(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                    withAnimation {
                        self.isActive = true
                    }
                    
                }
            }
            }
        }
        
        
    }
}

#Preview {
    SplashScreenView()
}
