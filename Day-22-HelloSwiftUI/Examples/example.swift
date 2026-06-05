// Day 22 - Extra: More SwiftUI modifiers
import SwiftUI

struct ModifiersExample: View {
    var body: some View {
        VStack(spacing: 16) {
            // Text modifiers
            Text("Custom Font")
                .font(.system(size: 24, weight: .bold, design: .rounded))
            
            // Image with overlay
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.red)
                .shadow(radius: 5)
            
            // Gradient button
            Button("Gradient Button") {}
                .padding()
                .background(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
                .foregroundColor(.white)
                .cornerRadius(25)
            
            // ZStack overlay
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.green.opacity(0.3))
                    .frame(height: 100)
                Text("Overlay Text")
                    .font(.title2)
                    .bold()
            }
        }
        .padding()
    }
}
