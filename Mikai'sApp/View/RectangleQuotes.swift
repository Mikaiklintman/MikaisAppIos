import SwiftUI

struct QuotesInRectangle: View {
    let content: String
    let author: String
    let width = UIScreen.main.bounds.width

    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.white.opacity(0.03), lineWidth: 2)
                .fill(Color.white.opacity(0.05))
            
            VStack {
                Text("\(content) ")
                    .font(Font.custom("Georgia-Bold", size: 26))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    
            
                
                Text("- \(author)")
                    .font(.subheadline)
                   .foregroundColor(Color.gray)
                   .shimmer(.init(tint: .white.opacity(0.5), highlight: .white, blur: 5))
                    
            }
            .padding()
            .frame(width: width / 1.25, height: 230)
           
            .cornerRadius(10)
        }
    }
}

struct RectangleQuotes: View {
    var quotesData = quotes.shuffled()
    var currentIndex = 0
    init() {
        loadLikedQuotes()
    }
    
    private func loadLikedQuotes() {
        for(index, _) in quotes.enumerated() {
            quotes[index].isLiked = UserDefaults.standard.bool(forKey: "liked_\(index)")
        }
    }
    
    func toggleLike() {
        quotes[currentIndex].isLiked.toggle()
        UserDefaults.standard.set(quotes[currentIndex].isLiked, forKey: "liked_\(currentIndex)")
    }
    
    func CustomButton(systemImage: String, status: Bool, activeTint: Color, inActiveTint: Color, onTap: @escaping () -> ()) -> some View {
        Button(action: {
            onTap()
        }) {
            Image(systemName: systemImage)
                .font(.title2)
                .particleEffect(systemImage: systemImage, font: .title2, status: status, activeTint: activeTint, inActiveTint: inActiveTint)
                .foregroundColor(status ? activeTint : inActiveTint)
                .padding(.horizontal, 18)
                .padding(.vertical, 8)
                .background(
                    Capsule()
                        .fill(status ? activeTint.opacity(0.25) : inActiveTint.opacity(0.25))
                )
        }
    }

    var body: some View {
        VStack{
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(quotes.indices, id: \.self) { i in
                        QuotesInRectangle(content: quotesData[i].content, author: quotesData[i].author)
                           .frame(width: 230, height: 280)
                            .offset(y: -150)
                            .containerRelativeFrame(.horizontal, count: 1, spacing: 1)
                            .scrollTransition { content, phase in
                                content
                                    .opacity(phase.isIdentity ? 1.0 : 0.3)
                                    .scaleEffect(x: phase.isIdentity ? 1.0 : 0.6, y: phase.isIdentity ? 1.0 : 0.6)
                            }
                    }
                }
                .scrollTargetLayout()
            }
            .contentMargins(0, for: .scrollContent)
            .scrollTargetBehavior(.viewAligned)
            CustomButton(systemImage: "suit.heart.fill", status: quotes[currentIndex].isLiked, activeTint: .pink, inActiveTint: .gray) {
                    toggleLike()
                }
        }
    }
}

#if DEBUG
struct RectangleQuotes_Previews: PreviewProvider {
    static var previews: some View {
        RectangleQuotes()
    }
}
#endif
