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
    var quotesData = [
        
            ("You cannot find peace by avoiding life", "Virginia Woolf"),
            ("The strongest principle of growth lies in the human choice", "George Eliot"),
            ("Pain is inevitable. Suffering is optional", "Haruki Murakami"),
            ("Believe you can and you're halfway there", "Theodore Roosevelt"),
            ("Your time is limited, don't waste it living someone else's life", "Steve Jobs"),
            ("The only way to do great work is to love what you do", "Steve Jobs"),
            ("Don't watch the clock; do what it does. Keep going", "Sam Levenson"),
            ("Success is not final, failure is not fatal: It is the courage to continue that counts", "Winston Churchill"),
            ("The only place where success comes before work is in the dictionary", "Vidal Sassoon"),
            ("Don't be pushed around by the fears in your mind. Be led by the dreams in your heart", "Roy T. Bennett"),
            ("The only limit to our realization of tomorrow will be our doubts of today", "Franklin D. Roosevelt"),
            ("Success usually comes to those who are too busy to be looking for it", "Henry David Thoreau"),
            ("Don't cry because it's over, smile because it happened", "Dr. Seuss"),
            ("The purpose of our lives is to be happy", "Dalai Lama"),
            ("The future belongs to those who believe in the beauty of their dreams", "Eleanor Roosevelt"),
            ("You are never too old to set another goal or to dream a new dream", "C.S. Lewis"),
            ("Strive not to be a success, but rather to be of value", "Albert Einstein"),
            ("Your attitude, not your aptitude, will determine your altitude", "Zig Ziglar"),
            ("It always seems impossible until it's done", "Nelson Mandela"),
            ("You miss 100% of the shots you don't take", "Wayne Gretzky"),
            ("The only person you are destined to become is the person you decide to be", "Ralph Waldo Emerson"),
            ("Success is stumbling from failure to failure with no loss of enthusiasm", "Winston S. Churchill"),
            ("I find that the harder I work, the more luck I seem to have", "Thomas Jefferson"),
            ("A journey of a thousand miles begins with a single step", "Lao Tzu"),
            ("I am not a product of my circumstances. I am a product of my decisions", "Stephen R. Covey")
        

    ].shuffled()

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(quotesData.indices, id: \.self) { i in
                    QuotesInRectangle(content: quotesData[i].0, author: quotesData[i].1)
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
        
    }
}

#if DEBUG
struct RectangleQuotes_Previews: PreviewProvider {
    static var previews: some View {
        RectangleQuotes()
    }
}
#endif
