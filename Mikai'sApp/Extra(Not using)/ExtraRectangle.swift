//
//  GlassRectangleQuotes.swift
//  Mikai'sApp
//
//  Created by Makai Klintman on 1/16/24.
//

import SwiftUI

struct ExtraRectangle: View {
    
   
    
    var body: some View {
        
      
        
        let width = UIScreen.main.bounds.width
        
        ZStack {
            
            
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.white.opacity(0.03), lineWidth: 2)
                .fill(Color.white.opacity(0.05))
            
            Text("Hello there!")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(Color.gray)
         //      .shimmer(.init(tint: .white.opacity(0.5), highlight: .white, blur: 5))
            
  
        

                
            
        }
        .frame(width: width / 1.25, height: 230)
       
        }
    }




#Preview {
    ExtraRectangle()
}



