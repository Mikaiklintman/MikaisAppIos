//
//  ContentView.swift
//  Mikai'sApp
//
//  Created by Makai Klintman on 1/13/24.
//

import SwiftUI

struct BackgroundView: View {
    private enum AnimationProperties {
        static let animationspeed: Double = 10
        static let timerDuration: TimeInterval = 3
        static let blurRadius: CGFloat = 130
    }
    
    @State private var timer = Timer.publish(every: AnimationProperties.timerDuration, on: .main, in: .common).autoconnect()
    
    @ObservedObject private var animator = CircleAnimator(colors: GradientColors.all)
    
    var body: some View {
        
        ZStack {
            ZStack {
                
                
                ForEach(animator.circles) { circle in
                    MovingCircle(originOffset: circle.position)
                        .foregroundColor(circle.color)
                }
            }
            .blur(radius: AnimationProperties.blurRadius)
            
        }
        .background(GradientColors.backgroundColor)
        .onDisappear {
            timer.upstream.connect().cancel()
        }
        .onAppear {
            animateCircles()
            timer = Timer.publish(every: AnimationProperties.timerDuration, on: .main, in: .common).autoconnect()
        }
        .onReceive(timer) { _ in
            animateCircles()
        }
    }
    
    private func animateCircles() {
        withAnimation(.easeInOut(duration: AnimationProperties.animationspeed)) {
            animator.animate()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}

private enum GradientColors {
    static var all: [Color] {
        [
            Color(hex: 0x191970), // Midnight Blue
            Color(hex: 0x2E0854), // Dark Purple
            Color(hex: 0x800080), // Purple
            Color(hex: 0xA020F0), // Dark Magenta
            Color(hex: 0x4B0082)  // Indigo
        ]
    }
    
    static var backgroundColor: Color {
        Color(hex: 0x051222)
    }
}

extension Color {
    init(hex: Int, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 8) & 0xff) / 255,
            blue: Double(hex & 0xff) / 255,
            opacity: alpha
        )
    }
}

private struct MovingCircle: Shape {
    var originOffset: CGPoint
    
    var animatableData: CGPoint.AnimatableData {
        get {
            originOffset.animatableData
        }
        set {
            originOffset.animatableData = newValue
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let adjustedX = rect.width * originOffset.x
        let adjustedY = rect.height * originOffset.y
        let smallestDimension = min(rect.width, rect.height)
        path.addArc(center: CGPoint(x: adjustedX, y: adjustedY), radius: smallestDimension / 2, startAngle: .zero, endAngle: .degrees(360), clockwise: true)
        return path
    }
}

private class CircleAnimator: ObservableObject {
    class Circle: Identifiable {
        internal init(position: CGPoint, color: Color) {
            self.position = position
            self.color = color
        }
        
        var position: CGPoint
        let id = UUID().uuidString
        let color: Color
    }
    
    @Published private(set) var circles: [Circle] = []
    
    init(colors: [Color]) {
        circles = colors.map({ color in
            Circle(position: CircleAnimator.generateRandomPosition(), color: color)
        })
    }
    
    func animate() {
        objectWillChange.send()
        for circle in circles {
            circle.position = CircleAnimator.generateRandomPosition()
        }
    }
    
    static func generateRandomPosition() -> CGPoint {
        CGPoint(x: CGFloat.random(in: 0...1), y: CGFloat.random(in: 0...1))
    }
}
