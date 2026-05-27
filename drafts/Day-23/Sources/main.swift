// ============================================
// Day 23 - CounterApp
// Topic: State Management (@State, @Binding)
// ============================================
import SwiftUI

struct CounterApp: View {
    @State private var count = 0
    @State private var history: [String] = []
    @State private var step = 1
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Counter")
                .font(.largeTitle).bold()
            
            Text("\(count)")
                .font(.system(size: 72, weight: .bold, design: .rounded))
                .foregroundColor(count >= 0 ? .blue : .red)
            
            // Step selector (Binding demo)
            StepPicker(step: $step)
            
            HStack(spacing: 20) {
                CounterButton(label: "-\(step)", color: .red) {
                    count -= step
                    history.append("-\(step) → \(count)")
                }
                CounterButton(label: "Reset", color: .gray) {
                    count = 0
                    history.append("Reset → 0")
                }
                CounterButton(label: "+\(step)", color: .green) {
                    count += step
                    history.append("+\(step) → \(count)")
                }
            }
            
            // History
            if !history.isEmpty {
                List(history.suffix(5), id: \.self) { entry in
                    Text(entry).font(.caption)
                }
                .frame(height: 150)
            }
        }
        .padding()
    }
}

// Child view with @Binding
struct StepPicker: View {
    @Binding var step: Int
    
    var body: some View {
        HStack {
            Text("Step:")
            ForEach([1, 5, 10], id: \.self) { value in
                Button("\(value)") { step = value }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(step == value ? Color.blue : Color.gray.opacity(0.2))
                    .foregroundColor(step == value ? .white : .primary)
                    .cornerRadius(8)
            }
        }
    }
}

struct CounterButton: View {
    let label: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.headline)
                .frame(width: 80, height: 44)
                .background(color)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}

@main
struct CounterAppMain: App {
    var body: some Scene {
        WindowGroup { CounterApp() }
    }
}
