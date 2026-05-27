// ============================================
// Day 22 - HelloSwiftUI
// Topic: SwiftUI Basics (Text, Image, Button)
// ============================================
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Header
            Text("Hello, SwiftUI! 👋")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.blue)
            
            Text("Day 22 of Learn Swift in 30 Days")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Divider()
            
            // Profile Card
            HStack(spacing: 16) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.blue)
                
                VStack(alignment: .leading) {
                    Text("Nguyễn Quốc Thanh")
                        .font(.headline)
                    Text("iOS Developer")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(Color.blue.opacity(0.1))
            .cornerRadius(12)
            
            // Skills
            VStack(alignment: .leading, spacing: 8) {
                Text("Skills")
                    .font(.headline)
                
                HStack {
                    SkillBadge(name: "Swift", color: .orange)
                    SkillBadge(name: "SwiftUI", color: .blue)
                    SkillBadge(name: "UIKit", color: .green)
                }
            }
            
            Spacer()
            
            // Button
            Button(action: { print("🚀 Let's learn!") }) {
                HStack {
                    Image(systemName: "play.fill")
                    Text("Start Learning")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct SkillBadge: View {
    let name: String
    let color: Color
    
    var body: some View {
        Text(name)
            .font(.caption)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(color.opacity(0.2))
            .foregroundColor(color)
            .cornerRadius(8)
    }
}

@main
struct HelloSwiftUIApp: App {
    var body: some Scene {
        WindowGroup { ContentView() }
    }
}
