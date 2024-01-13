//
//  Tabs.swift
//  Mikai'sApp
//
//  Created by Makai Klintman on 1/16/24.
//

import SwiftUI

struct Tabs: View {
    var body: some View {
        ZStack{
            
          
                
                TabView {
                    
                    
                    ContentView()
                        .tabItem {
                            Image(systemName: "house")
                            Text("Home")
                            
                        }
                    
                    LikedQuotesView()
                        .tabItem {
                            Image(systemName: "heart")
                            Text("Liked")
                        }
                }
                
            }
        
    }
}

#Preview {
    Tabs()
}
