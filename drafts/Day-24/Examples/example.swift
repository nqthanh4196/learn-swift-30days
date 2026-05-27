// Day 24 - Extra: Sections & Custom rows
import SwiftUI

struct SectionedList: View {
    let fruits = ["Apple", "Avocado", "Banana", "Blueberry", "Cherry"]
    
    var grouped: [Character: [String]] {
        Dictionary(grouping: fruits) { $0.first! }
    }
    
    var body: some View {
        List {
            ForEach(grouped.keys.sorted(), id: \.self) { key in
                Section(header: Text(String(key))) {
                    ForEach(grouped[key]!, id: \.self) { fruit in
                        Label(fruit, systemImage: "leaf")
                    }
                }
            }
        }
        .listStyle(.insetGrouped)
    }
}
