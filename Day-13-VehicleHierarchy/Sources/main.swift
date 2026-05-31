// ============================================
// Day 13 - VehicleHierarchy
// Topic: Inheritance & Polymorphism
// ============================================

// MARK: - Base Class
class Vehicle {
    let brand: String
    let year: Int
    var speed: Double = 0
    var isRunning: Bool = false
    
    init(brand: String, year: Int) {
        self.brand = brand
        self.year = year
    }
    
    func start() {
        isRunning = true
        print("  🔑 \(brand) started")
    }
    
    func stop() {
        isRunning = false
        speed = 0
        print("  🛑 \(brand) stopped")
    }
    
    func describe() -> String {
        return "\(brand) (\(year)) - \(speed) km/h"
    }
}

// MARK: - Car
class Car: Vehicle {
    let doors: Int
    var gear: Int = 0
    
    init(brand: String, year: Int, doors: Int = 4) {
        self.doors = doors
        super.init(brand: brand, year: year)
    }
    
    func shiftGear(to gear: Int) {
        self.gear = gear
        speed = Double(gear) * 30
    }
    
    override func describe() -> String {
        return "🚗 " + super.describe() + " | Gear: \(gear)"
    }
}

// MARK: - Electric Car
class ElectricCar: Car {
    var batteryLevel: Double = 100
    
    func charge() {
        batteryLevel = 100
        print("  ⚡ Charged to 100%")
    }
    
    override func describe() -> String {
        return "⚡🚗 \(brand) (\(year)) - \(speed) km/h | Battery: \(Int(batteryLevel))%"
    }
}

// MARK: - Motorcycle
class Motorcycle: Vehicle {
    let engineCC: Int
    
    init(brand: String, year: Int, engineCC: Int) {
        self.engineCC = engineCC
        super.init(brand: brand, year: year)
    }
    
    func wheelie() {
        print("  🏍️ \(brand) doing a wheelie!")
    }
    
    override func describe() -> String {
        return "🏍️ " + super.describe() + " | \(engineCC)cc"
    }
}

// MARK: - Truck
class Truck: Vehicle {
    let maxLoad: Double // tons
    var currentLoad: Double = 0
    
    init(brand: String, year: Int, maxLoad: Double) {
        self.maxLoad = maxLoad
        super.init(brand: brand, year: year)
    }
    
    func load(_ tons: Double) -> Bool {
        guard currentLoad + tons <= maxLoad else {
            print("  ❌ Overweight!")
            return false
        }
        currentLoad += tons
        return true
    }
    
    override func describe() -> String {
        return "🚛 " + super.describe() + " | Load: \(currentLoad)/\(maxLoad)t"
    }
}

// MARK: - Demo Polymorphism
print("🚗 Vehicle Hierarchy")
print("================================\n")

let fleet: [Vehicle] = [
    Car(brand: "Toyota Camry", year: 2024),
    ElectricCar(brand: "Tesla Model 3", year: 2025),
    Motorcycle(brand: "Honda CBR", year: 2023, engineCC: 600),
    Truck(brand: "Hyundai HD", year: 2022, maxLoad: 5.0),
]

// Polymorphism - same interface, different behavior
for vehicle in fleet {
    vehicle.start()
    print("  \(vehicle.describe())")
}

// Type casting
print("\n📊 Fleet Analysis:")
let cars = fleet.filter { $0 is Car }
let bikes = fleet.filter { $0 is Motorcycle }
print("  Cars: \(cars.count), Motorcycles: \(bikes.count)")

for vehicle in fleet {
    if let electric = vehicle as? ElectricCar {
        electric.charge()
    } else if let moto = vehicle as? Motorcycle {
        moto.wheelie()
    } else if let truck = vehicle as? Truck {
        truck.load(3.5)
        print("  \(truck.describe())")
    }
}
