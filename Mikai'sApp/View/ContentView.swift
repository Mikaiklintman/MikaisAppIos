//
//  RealView.swift
//  Mikai'sApp
//
//  Created by Makai Klintman on 1/16/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
        VStack{
            ZStack{
                
                BackgroundView()
                
                
                
                RectangleQuotes()
                
              
                HeartShareButtons()
                    .padding(.top, 150.0)
                
                
                
            }

            }
        }
    }


#Preview {
    ContentView()
}
