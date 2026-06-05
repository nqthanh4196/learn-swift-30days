// Day 23 - Extra: ObservableObject
import SwiftUI

class TimerViewModel: ObservableObject {
    @Published var seconds = 0
    @Published var isRunning = false
    private var timer: Timer?
    
    func start() {
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.seconds += 1
        }
    }
    func stop() { isRunning = false; timer?.invalidate() }
    func reset() { stop(); seconds = 0 }
}

struct TimerView: View {
    @StateObject private var vm = TimerViewModel()
    var body: some View {
        VStack {
            Text("\(vm.seconds)s").font(.largeTitle)
            HStack {
                Button(vm.isRunning ? "Stop" : "Start") {
                    vm.isRunning ? vm.stop() : vm.start()
                }
                Button("Reset") { vm.reset() }
            }
        }
    }
}
