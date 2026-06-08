// ============================================
// Day 29 - AnimatedCards
// Topic: Animations & Gestures
// ============================================
import SwiftUI

struct AnimatedCardsApp: View {
    @State private var cards = ["Swift", "SwiftUI", "Combine", "CoreData", "Async"]
    @State private var offset = CGSize.zero
    @State private var currentIndex = 0
    @State private var isAnimating = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Swipe Cards")
                .font(.largeTitle).bold()
            
            ZStack {
                ForEach(cards.indices.reversed(), id: \.self) { index in
                    CardView(title: cards[index], index: index, total: cards.count)
                        .offset(index == currentIndex ? offset : .zero)
                        .rotationEffect(.degrees(index == currentIndex ? Double(offset.width / 20) : 0))
                        .gesture(
                            index == currentIndex ?
                            DragGesture()
                                .onChanged { gesture in
                                    offset = gesture.translation
                                }
                                .onEnded { gesture in
                                    withAnimation(.spring()) {
                                        if abs(gesture.translation.width) > 100 {
                                            offset = CGSize(width: gesture.translation.width > 0 ? 500 : -500, height: 0)
                                            currentIndex = min(currentIndex + 1, cards.count - 1)
                                        }
                                        offset = .zero
                                    }
                                }
                            : nil
                        )
                        .animation(.spring(), value: offset)
                }
            }
            .frame(height: 300)
            
            // Animated button
            Button(action: {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
                    isAnimating.toggle()
                }
            }) {
                HStack {
                    Image(systemName: "sparkles")
                        .rotationEffect(.degrees(isAnimating ? 360 : 0))
                    Text("Animate")
                }
                .padding()
                .background(isAnimating ? Color.purple : Color.blue)
                .foregroundColor(.white)
                .cornerRadius(isAnimating ? 25 : 10)
                .scaleEffect(isAnimating ? 1.1 : 1.0)
            }
        }
        .padding()
    }
}

struct CardView: View {
    let title: String
    let index: Int
    let total: Int
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.blue.opacity(1.0 - Double(index) * 0.15))
            .frame(width: 280, height: 200)
            .shadow(radius: 5)
            .overlay(
                VStack {
                    Image(systemName: "swift")
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                    Text(title)
                        .font(.title2).bold()
                        .foregroundColor(.white)
                }
            )
            .offset(y: CGFloat(index) * 8)
            .scaleEffect(1.0 - CGFloat(index) * 0.05)
    }
}

@main
struct AnimatedApp: App {
    var body: some Scene {
        WindowGroup { AnimatedCardsApp() }
    }
}
