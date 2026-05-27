// ============================================
// Day 12 - Extra Examples
// ============================================

// MARK: - Example 1: Lazy property
struct DataLoader {
    lazy var data: [Int] = {
        print("  Loading data...")
        return (1...1000).map { $0 }
    }()
}

var loader = DataLoader()
print("Before access: data not loaded yet")
print("Count: \(loader.data.count)")

// MARK: - Example 2: Subscript
struct Matrix {
    let rows: Int, cols: Int
    private var grid: [Double]
    
    init(rows: Int, cols: Int) {
        self.rows = rows
        self.cols = cols
        grid = Array(repeating: 0.0, count: rows * cols)
    }
    
    subscript(row: Int, col: Int) -> Double {
        get { grid[row * cols + col] }
        set { grid[row * cols + col] = newValue }
    }
}

var m = Matrix(rows: 2, cols: 2)
m[0, 0] = 1; m[0, 1] = 2
m[1, 0] = 3; m[1, 1] = 4
print("\nMatrix[1,1] = \(m[1, 1])")
