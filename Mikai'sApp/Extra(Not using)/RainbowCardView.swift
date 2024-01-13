//
//  RainbowCardView.swift
//  Mikai'sApp
//
//  Created by Makai Klintman on 1/15/24.
//

import SwiftUI
struct RainbowCardView: View {
  @State var rotation: CGFloat = 0.0
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 20, style: .continuous)
        .frame(width: 440, height: 430)
        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple, .pink]), startPoint: .top, endPoint: .bottom))
        .rotationEffect(.degrees(rotation))
        .mask {
          RoundedRectangle(cornerRadius: 20, style: .continuous)
            .stroke(lineWidth: 7)
            .frame(width: 250, height: 335)
            .blur(radius: 10)
        }
      RoundedRectangle(cornerRadius: 20, style: .continuous)
        .frame(width: 260, height: 340)
        .foregroundColor(.black)
      RoundedRectangle(cornerRadius: 20, style: .continuous)
        .frame(width: 500, height: 440)
        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple, .pink]), startPoint: .top, endPoint: .bottom))
        .rotationEffect(.degrees(rotation))
        .mask {
          RoundedRectangle(cornerRadius: 20, style: .continuous)
            .stroke(lineWidth: 4)
            .frame(width: 256, height: 340)
        }
    }
    .ignoresSafeArea()
    .onAppear {
      withAnimation(.linear(duration: 4).repeatForever(autoreverses: false)) {
        rotation = 360
      }
    }
  }
}
#Preview {
  RainbowCardView()
}
