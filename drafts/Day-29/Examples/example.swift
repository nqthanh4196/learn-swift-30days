// Day 29 - Extra: Transition & matchedGeometryEffect
import SwiftUI

struct TransitionDemo: View {
    @State private var showDetail = false
    @Namespace private var animation
    
    var body: some View {
        VStack {
            if !showDetail {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.blue)
                    .matchedGeometryEffect(id: "card", in: animation)
                    .frame(width: 100, height: 100)
                    .onTapGesture {
                        withAnimation(.spring()) { showDetail = true }
                    }
            } else {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.blue)
                    .matchedGeometryEffect(id: "card", in: animation)
                    .frame(height: 300)
                    .onTapGesture {
                        withAnimation(.spring()) { showDetail = false }
                    }
            }
        }
        .padding()
    }
}
