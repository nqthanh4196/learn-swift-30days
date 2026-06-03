// Day 19 - Extra: Common retain cycle patterns in iOS
// Pattern 1: Timer
class TimerExample {
    var timer: Timer?
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.tick()
        }
    }
    func tick() { print("tick") }
    deinit { timer?.invalidate(); print("TimerExample deinit") }
}

// Pattern 2: Delegate (always weak)
protocol DataDelegate: AnyObject {
    func didLoad(data: String)
}

class DataLoader {
    weak var delegate: DataDelegate?
    func load() { delegate?.didLoad(data: "result") }
}

// Pattern 3: NotificationCenter
class Observer {
    init() {
        NotificationCenter.default.addObserver(
            self, selector: #selector(handle), name: .init("test"), object: nil
        )
    }
    @objc func handle() {}
    deinit { NotificationCenter.default.removeObserver(self) }
}
