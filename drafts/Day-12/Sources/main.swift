// ============================================
// Day 12 - FitnessTracker
// Topic: Properties & Methods
// ============================================

struct FitnessTracker {
    // MARK: - Stored Properties
    let userName: String
    let dailyStepGoal: Int
    
    // Property with observer
    var steps: Int = 0 {
        didSet {
            if steps >= dailyStepGoal && oldValue < dailyStepGoal {
                print("  🎉 Goal reached! \(steps)/\(dailyStepGoal) steps!")
            }
        }
    }
    
    var weightKg: Double = 70.0
    
    // MARK: - Computed Properties
    var distanceKm: Double {
        return Double(steps) * 0.0007  // avg step = 0.7m
    }
    
    var caloriesBurned: Double {
        return Double(steps) * 0.04
    }
    
    var progress: Double {
        return min(Double(steps) / Double(dailyStepGoal) * 100, 100)
    }
    
    var progressBar: String {
        let filled = Int(progress / 10)
        let empty = 10 - filled
        return "[\(String(repeating: "█", count: filled))\(String(repeating: "░", count: empty))] \(String(format: "%.0f", progress))%"
    }
    
    // MARK: - Static
    static let stepsPerKm = 1428
    static var totalUsersSteps = 0
    
    // MARK: - Methods
    mutating func walk(steps count: Int) {
        steps += count
        FitnessTracker.totalUsersSteps += count
    }
    
    mutating func run(distanceKm km: Double) {
        let runSteps = Int(km * Double(FitnessTracker.stepsPerKm))
        steps += runSteps
        FitnessTracker.totalUsersSteps += runSteps
        print("  🏃 Ran \(km)km (+\(runSteps) steps)")
    }
    
    func summary() {
        print("📊 \(userName)'s Daily Summary")
        print("   Steps: \(steps) / \(dailyStepGoal)")
        print("   \(progressBar)")
        print("   Distance: \(String(format: "%.2f", distanceKm)) km")
        print("   Calories: \(String(format: "%.0f", caloriesBurned)) kcal")
    }
}

// MARK: - Demo
print("🏋️ Fitness Tracker")
print("================================\n")

var tracker = FitnessTracker(userName: "Thanh", dailyStepGoal: 10000)

tracker.walk(steps: 3000)
print("After morning walk:")
tracker.summary()

print("")
tracker.run(distanceKm: 3.5)
print("After run:")
tracker.summary()

print("")
tracker.walk(steps: 4000)
print("After evening walk:")
tracker.summary()

print("\n📈 Global stats: \(FitnessTracker.totalUsersSteps) total steps across all users")
